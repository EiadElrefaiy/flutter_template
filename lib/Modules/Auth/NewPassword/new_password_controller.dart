import 'package:Parking/Models/user_model.dart';
import 'package:Parking/Modules/Auth/Splash/splash_data_handler.dart';
import 'package:Parking/Utilities/router_config.dart';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/shared_preferences.dart';
import 'new_password_data_handler.dart';

class NewPasswordController extends ControllerMVC {
  // singleton
  factory NewPasswordController() {
    _this ??= NewPasswordController._();
    return _this!;
  }
  static NewPasswordController? _this;
  NewPasswordController._();
  bool loading=false;
  late TextEditingController newPasswordController,confirmPasswordController;
  @override
  void initState() {
    newPasswordController=TextEditingController();
    confirmPasswordController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  onConfirm()async{
    loading=true;
    setState((){});
    final result=await NewPasswordDataHandler.confirm(newPassword: newPasswordController.text, confirmPassword: confirmPasswordController.text);
    result.fold((l){
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r){
      currentContext_!.pushNamed("home");
    });
  }
}
