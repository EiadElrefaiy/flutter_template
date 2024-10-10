
class APIEndPoint{
  static const String baseServerURL = "https://********.com";
  static const String _baseURL = "$baseServerURL/api/";



  //=========================== api User ====================================
  static const String login = "${_baseURL}login";
  static const String forgetPassword = "${_baseURL}forget-password";
  static const String sendOtp = "${_baseURL}send-otp";
  static const String newPassword = "${_baseURL}new-password";
  static const String test = "${_baseURL}todos";
}



