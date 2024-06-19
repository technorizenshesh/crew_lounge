import 'dart:convert';
import 'dart:io';

import 'package:crew_lounge/app/data/apis/api_models/get_chat_user_model.dart';
import 'package:crew_lounge/app/data/apis/api_models/get_posts_model.dart';
import 'package:crew_lounge/app/data/apis/api_models/get_simple_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_add_post_model.dart';
import '../api_models/get_chat_message_model.dart';
import '../api_models/get_contact_us_model.dart';
import '../api_models/get_my_posts_model.dart';
import '../api_models/get_notification.dart';
import '../api_models/get_user_model.dart';

class ApiMethods {
  static Future<UserModel?> userSignup({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUserSignup,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  /* static Future<UserModel?> userVerification({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUserVerification,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }  */

  static Future<UserModel?> login({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<SimpleResponseModel?> sendOtpForPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendOtpForPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  static Future<SimpleResponseModel?> checkOtp({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  static Future<SimpleResponseModel?> resetPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfResetPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  static Future<UserModel?> getProfile({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: queryParameters,
      url: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  ///Update Profile Api Calling.....
  static Future<UserModel?> updateProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    UserModel? logInModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateProfile,
      imageMap: imageMap,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = UserModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  static Future<AddPostModel?> uploadNewPost(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> bodyParams,
      required File? imageFile}) async {
    AddPostModel? addPostModel;
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfAddPosts,
      image: imageFile,
      imageKey: 'image',
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      addPostModel = AddPostModel.fromJson(jsonDecode(response.body));
      return addPostModel;
    }
    return null;
  }

  static Future<GetPostListModel?> getPostsApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetPostListModel? getPostListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPosts,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPostListModel = GetPostListModel.fromJson(jsonDecode(response.body));
      return getPostListModel;
    }
    return null;
  }

  /// Get Like Post LIST ...
  static Future<GetPostListModel?> getLikePostsApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetPostListModel? getPostListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetLikePosts,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPostListModel = GetPostListModel.fromJson(jsonDecode(response.body));
      return getPostListModel;
    }
    return null;
  }

  static Future<SimpleResponseModel?> likeUnLikePost({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfLikeUnLike,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get My Posts List ....
  static Future<GetMyPostModel?> getMyPostsApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetMyPostModel? getPostListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetMyPosts,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPostListModel = GetMyPostModel.fromJson(jsonDecode(response.body));
      return getPostListModel;
    }
    return null;
  }

  ///Get Chat UserList ...
  static Future<GetChatUserModel?> getChatUserList(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    GetChatUserModel getChatUserModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetConversation,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      getChatUserModel = GetChatUserModel.fromJson(jsonDecode(response.body));
      return getChatUserModel;
    }
    return null;
  }

  ///Get Chat message by other user id...
  static Future<GetChatModel?> getChat(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    GetChatModel getChatModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetChat,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      getChatModel = GetChatModel.fromJson(jsonDecode(response.body));
      return getChatModel;
    }
    return null;
  }

  static Future<http.Response?> insertChat(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> bodyParams,
      File? image,
      String? imageKey,
      bool wantSnackBar = true}) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfInsertChat,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Contact Us api
  static Future<ContactUsModel?> contactUsApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = false}) async {
    ContactUsModel contactUsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddContactUs,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      contactUsModel = ContactUsModel.fromJson(jsonDecode(response.body));
      return contactUsModel;
    }
    return null;
  }

  /// Delete Account api
  static Future<SimpleResponseModel?> deleteAccountApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteAccount,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Change Online Status api
  static Future<UserModel?> changeOnlineStatusApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = false}) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangeOnlineStatus,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  /// Change Password api
  static Future<SimpleResponseModel?> changePassword(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get Notification List ....
  static Future<NotificationModel?> getNotificationApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    NotificationModel? notificationModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetNotification,
      checkResponse: checkResponse,
    );
    if (response != null) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));
      return notificationModel;
    }
    return null;
  }
}
