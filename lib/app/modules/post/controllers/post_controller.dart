import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../routes/app_pages.dart';

class PostController extends GetxController {
  List<Widget> mediaList = [];
  final List<File> path = [];
  File? firstFile;
  int currentPage = 0;
  int? lastPage;
  RxInt selectedImgIndex = 0.obs;
  RxBool progressBar = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchNewMedia();
    loadRecentImages();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        fetchNewMedia();
      }
    }
  }

  fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      print(albums);
      List<AssetEntity> media = await albums[0]
          .getAssetListPaged(size: 60, page: currentPage); //preloading files
      print(media);
      for (var asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            firstFile = path[0];
          }
        }
      }
      // print("image path:-"+media[0]!.thumbnailDataWithSize(const ThumbnailSize(200, 200)).asStream().toString());
      // Future<File?> filename=media[0].file;
      // print("image path:-"+filename.toString());
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(
                const ThumbnailSize(200, 200)), //resolution of thumbnail
            builder:
                (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // File file=File.fromRawPath(snapshot.data!);
                // print("File path:-"+file.uri.path);
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (asset.type == AssetType.video)
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 5),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                );
              }
              return Container();
            },
          ),
        );
      }
      mediaList.addAll(temp);
      currentPage++;
      changeProgressBar(false);
      increment();
    } else {
      print("Give permission to access photoes...");

      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  changeSelected(int index) {
    selectedImgIndex.value = index;
  }

  changeProgressBar(bool value) {
    progressBar.value = value;
  }

  Future<void> loadRecentImages() async {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (albums.isNotEmpty) {
      List<AssetEntity> recentImages = await albums.first.getAssetListRange(
        start: 0,
        end: 10, // Fetch the first 10 images
      );
      recentImages = recentImages;
      print("Length" + recentImages.length.toString());
    }
  }

  openNewPostPage(File file) {
    // Map<String,String> data={"img_file":file.path,};
    // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>const NewPostActivity()));
    Get.toNamed(Routes.NEW_POST, arguments: file);
    // Get.toNamed('/newPostActivity',parameters: data);
  }
}
