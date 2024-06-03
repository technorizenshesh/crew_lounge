import 'dart:convert';
import 'dart:io';

import 'package:crew_lounge/app/data/apis/api_models/get_posts_model.dart';
import 'package:crew_lounge/app/data/apis/api_models/get_simple_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_add_post_model.dart';
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
  }) async {
    GetPostListModel? getPostListModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPosts,
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
}
