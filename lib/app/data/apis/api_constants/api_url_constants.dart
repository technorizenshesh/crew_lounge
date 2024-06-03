class ApiUrlConstants {
  static const String baseUrl =
      'https://server-php-8-1.technorizen.com/CrewLounget/api/';
  static const String baseUrlForGetMethodParams =
      'server-php-8-1.technorizen.com';

  static const String endPointOfUserSignup = '${baseUrl}signup';
  static const String endPointOfLogin = '${baseUrl}login';
  static const String endPointOfSendOtpForPassword =
      '${baseUrl}send_otp_for_password';
  static const String endPointOfResetPassword = '${baseUrl}reset_password';
  static const String endPointOfCheckOtp = '${baseUrl}check_otp';
  static const String endPointOfGetProfile = '${baseUrl}get_profile';
  static const String endPointOfAddPosts = '${baseUrl}add_posts';
  static const String endPointOfGetPosts = '${baseUrl}get_posts';
  static const String endPointOfLikeUnLike =
      '/CrewLounget/api/like_unlike_posts';
}
