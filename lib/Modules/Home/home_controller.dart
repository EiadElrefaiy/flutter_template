import 'package:Parking/Models/user_model.dart';
import 'package:Parking/Modules/Auth/Splash/splash_data_handler.dart';
import 'package:Parking/Utilities/router_config.dart';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/shared_preferences.dart';
import 'home_data_handler.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }
  static HomeController? _this;
  HomeController._();
  bool loading=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
}
