import 'package:Parking/Modules/Auth/ForgetPassword/forget_password_screen.dart';
import 'package:Parking/Modules/Auth/Login/login_controller.dart';
import 'package:Parking/Modules/Home/home_controller.dart';
import 'package:Parking/Utilities/strings.dart';
import 'package:Parking/Utilities/text_style_helper.dart';
import 'package:Parking/Utilities/theme_helper.dart';
import 'package:Parking/Widgets/custom_button_widget.dart';
import 'package:Parking/Widgets/custom_textfield_widget.dart';
import 'package:Parking/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Widgets/loading_screen.dart';
class HomeScreen extends StatefulWidget {
  static const routeName="home";
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState():super(HomeController()){
    con=HomeController();
  }
  late HomeController con;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ThemeClass.of(context).secondary,
      body: LoadingScreen(
        loading: con.loading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 224.r,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ThemeClass.of(context).secondary
                ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/mask.png',
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        right: 25.r,
                        top: 100.r,
                        child:
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  width: 30.r,
                                  'assets/images/welcome.png',
                                ),
                                SizedBox(height: 5.r,)
                              ],
                            ),
                            SizedBox(width: 15.r,),
                            Text("مرحبا بك",style: TextStyleHelper.of(context).h_32.copyWith(
                              color: ThemeClass.of(context).mainBlack,
                            ) ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 80.r),
                decoration: BoxDecoration(
                  color: ThemeClass.of(context).background,
          
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            height: 140.r,
                            width: 140.r,
                            decoration: BoxDecoration(
                              color: ThemeClass.of(context).primaryColor,
                              shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              width: 30,
                              'assets/images/add_car.png',
                            ),
                          ),
          
                          SizedBox(height: 20.r,),
          
                          Text("اضافة سيارة",style: TextStyleHelper.of(context).h_24.copyWith(
                            color: ThemeClass.of(context).mainBlack,
                          ) ),
          
                          SizedBox(height: 50.r,),
          
                          Container(
                            padding: EdgeInsets.all(27),
                            height: 140.r,
                            width: 140.r,
                            decoration: BoxDecoration(
                                color: ThemeClass.of(context).primaryColor,
                                shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              width: 30,
                              'assets/images/invoice.png',
                            ),
                          ),
          
                          SizedBox(height: 20.r,),
          
                          Text("اصدار فاتورة",style: TextStyleHelper.of(context).h_24.copyWith(
                            color: ThemeClass.of(context).mainBlack,
                          ) ),
          
                          SizedBox(height: 220.r,),
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
