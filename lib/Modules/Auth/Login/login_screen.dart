import 'package:Parking/Modules/Auth/ForgetPassword/forget_password_screen.dart';
import 'package:Parking/Modules/Auth/Login/login_controller.dart';
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
import '../../Home/home_screen.dart';
class LoginScreen extends StatefulWidget {
  static const routeName="login";
  const LoginScreen({super.key});

  @override
   createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState():super(LoginController()){
    con=LoginController();
  }
  late LoginController con;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ThemeClass.of(context).secondary,
      body: LoadingScreen(
        loading: con.loading,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(55),
              height: 310.r,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeClass.of(context).secondary
              ),
              child: Container(
                margin: EdgeInsets.only(top: 50.r),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80.r),
              decoration: BoxDecoration(
                color: ThemeClass.of(context).background,

                borderRadius: BorderRadius.circular(50.0),
              ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("تسجيل الدخول",style: TextStyleHelper.of(context).h_36.copyWith(
                    color: ThemeClass.of(context).mainBlack,

                  ),),
                  SizedBox(height: 60.r,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("رقم الهاتف",style: TextStyleHelper.of(context).b_18.copyWith(
                          color: ThemeClass.of(context).mainBlack,
                          ),
                        ),
                        SizedBox(height: 12.r,),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFieldWidget(
                            controller: con.phoneController,
                            hint: "اكتب رقم الهاتف",

                            prefixIcon: Icon(Icons.email_outlined , color: ThemeClass.of(context).mainBlack,),
                            isDense: true,
                            insidePadding: EdgeInsets.symmetric(vertical: 15.h),
                            backGroundColor:Color(0xffDFF9E6),
                          ),
                        ),

                        SizedBox(height: 20.r,),

                        Text("كلمة المرور",style: TextStyleHelper.of(context).b_18.copyWith(
                          color: ThemeClass.of(context).mainBlack,
                          ),
                        ),
                        SizedBox(height: 12.r,),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFieldWidget(
                            controller: con.phoneController,
                            hint: "اكتب كلمة المرور",
                            prefixIcon: Icon(Icons.lock_outline , color: ThemeClass.of(context).mainBlack,),
                            suffixIcon: Icon(Icons.visibility_off_outlined, color: ThemeClass.of(context).mainBlack,),
                            isDense: true,
                            insidePadding: EdgeInsets.symmetric(vertical: 15.h),
                            backGroundColor:Color(0xffDFF9E6),
                          ),
                        ),

                        SizedBox(height: 22.r,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.push(context , MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                              },
                              child: Text(
                                "نسيت كلمة المرور؟",
                                style: TextStyleHelper.of(context).b_20.copyWith(
                                  color: ThemeClass.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 35.r,),

                  CustomButtonWidget.primary(
                    title: 'دخول',
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => HomeScreen()));
                      print("works");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
