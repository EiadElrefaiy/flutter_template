import 'package:Parking/Models/user_model.dart';
import 'package:Parking/Modules/Auth/Splash/splash_data_handler.dart';
import 'package:Parking/Utilities/router_config.dart';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/shared_preferences.dart';
import 'login_data_handler.dart';

class LoginController extends ControllerMVC {
  // singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }
  static LoginController? _this;
  LoginController._();
  bool loading=false;
  late TextEditingController phoneController,passwordController;
  @override
  void initState() {
    phoneController=TextEditingController();
    passwordController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  onLogin()async{
    loading=true;
    setState((){});
    final result=await LoginDataHandler.login(phone: phoneController.text, password: passwordController.text);
    result.fold((l){
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r){
      currentContext_!.pushNamed("forget-password");
    });
  }
}
