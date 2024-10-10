import 'package:Parking/Models/user_model.dart';
import 'package:Parking/Modules/Auth/Login/login_screen.dart';
import 'package:Parking/Modules/Auth/Splash/splash_data_handler.dart';
import 'package:Parking/Utilities/router_config.dart';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/shared_preferences.dart';

class SplashController extends ControllerMVC {
  // singleton
  factory SplashController() {
    _this ??= SplashController._();
    return _this!;
  }
  static SplashController? _this;
  SplashController._();

UserModel userModel=UserModel();

  Future init(BuildContext context)async{
    await SplashDataHandler.getCurrentUser();
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted) {
      // GoRouter.of(context).go(HomeScreen.routeName);
      if(SharedPref.isLogin()){
        // GoRouter.of(context).goNamed(HomeScreen.routeName);
      }else{
        // GoRouter.of(context).go(LoginScreen.routeName);
        currentContext_!.pushNamed(LoginScreen.routeName);
      }
    }
  }
}
