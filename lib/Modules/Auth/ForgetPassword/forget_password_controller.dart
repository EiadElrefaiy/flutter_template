import 'package:Parking/Models/user_model.dart';
import 'package:Parking/Modules/Auth/Splash/splash_data_handler.dart';
import 'package:Parking/Utilities/router_config.dart';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/shared_preferences.dart';
import 'forget_password_data_handler.dart';

class ForgetPasswordController extends ControllerMVC {
  // singleton
  factory ForgetPasswordController() {
    _this ??= ForgetPasswordController._();
    return _this!;
  }
  static ForgetPasswordController? _this;
  ForgetPasswordController._();
  bool loading=false;
  late TextEditingController phoneController;
  @override
  void initState() {
    phoneController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  onSend()async{
    loading=true;
    setState((){});
    final result=await ForgetPasswordDataHandler.forgetPassord(phone: phoneController.text);
    result.fold((l){
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r){
      currentContext_!.pushNamed("");
    });
  }
}
