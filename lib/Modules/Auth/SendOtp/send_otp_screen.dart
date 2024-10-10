import 'package:Parking/Modules/Auth/ForgetPassword/forget_password_controller.dart';
import 'package:Parking/Modules/Auth/NewPassword/new_password_screen.dart';
import 'package:Parking/Modules/Auth/SendOtp/send_otp_controller.dart';
import 'package:Parking/Utilities/text_style_helper.dart';
import 'package:Parking/Utilities/theme_helper.dart';
import 'package:Parking/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Widgets/loading_screen.dart';

class SendOtpScreen extends StatefulWidget {
  static const routeName = "send-otp";

  const SendOtpScreen({super.key});

  @override
  createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends StateMVC<SendOtpScreen> {
  _SendOtpScreenState() : super(ForgetPasswordController()) {
    con = ForgetPasswordController();
  }

  late ForgetPasswordController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).secondary,
      body: LoadingScreen(
        loading: con.loading,
        child: SingleChildScrollView(  // Make the content scrollable
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(55),
                height: 310.r,
                width: double.infinity,
                decoration: BoxDecoration(color: ThemeClass.of(context).secondary),
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
                    Text(
                      "نسيت كلمة المرور",
                      style: TextStyleHelper.of(context)
                          .h_36
                          .copyWith(color: ThemeClass.of(context).mainBlack),
                    ),
                    SizedBox(height: 30.r),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "ادخل الرمز",
                            textDirection: TextDirection.rtl,
                            style: TextStyleHelper.of(context)
                                .b_20
                                .copyWith(color: ThemeClass.of(context).mainBlack),
                          ),
                          SizedBox(height: 15.r),
                          OTPInput(),
                          SizedBox(height: 220.r),
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

class OTPInput extends StatefulWidget {
  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends StateMVC<OTPInput> {
  _OTPInputState() : super(SendOtpController()) {
    con = SendOtpController();
  }

  late SendOtpController con;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OTP Input fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 60,
              child: TextField(
                controller: con.otpControllers[index], // Use individual controllers
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeClass.of(context).secondary, // Fill color
                  counterText: "", // Hides the counter below the text field
                  border: InputBorder.none, // Removes border
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Circular border
                    borderSide: BorderSide.none, // Remove border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Circular border
                    borderSide: BorderSide.none, // Remove border
                  ),
                ),
                style: TextStyle(color: ThemeClass.of(context).mainBlack), // Input text color
                onChanged: (value) {
                  if (value.length == 1 && index != 3) {
                    FocusScope.of(context).nextFocus(); // Moves to next field
                  } else if (value.isEmpty && index != 0) {
                    FocusScope.of(context).previousFocus(); // Moves to previous field
                  }
                  con.checkIfAllInputsFilled(); // Check if all inputs are filled
                },
              ),
            );
          }),
        ),

        SizedBox(height: 20), // Add some space between input and button

        // Custom "Continue" button
        CustomButtonWidget.primary(
          title: 'استمر',
          onTap: con.isButtonDisabled ? null : () {
            // Concatenate the values of the OTP inputs
            String otp = con.otpControllers.map((controller) => controller.text).join();

            // Print the concatenated OTP string
            print('Concatenated OTP: $otp');
            Navigator.push(context , MaterialPageRoute(builder: (context) => NewPasswordScreen()));

            // Call the send OTP function if needed
            //con.onSendOtp();
          },
          backgroundColor: con.isButtonDisabled
              ? ThemeClass.of(context).primaryColor.withOpacity(0.5) // Disabled color
              : ThemeClass.of(context).primaryColor, // Enabled color
        ),

        SizedBox(height: 10),

        // Resend OTP and Timer Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${(con.remainingTime ~/ 60).toString().padLeft(2, '0')}:${(con.remainingTime % 60).toString().padLeft(2, '0')}",
              textDirection: TextDirection.rtl,
              style: TextStyleHelper.of(context).b_20.copyWith(
                color: ThemeClass.of(context).primaryColor,
              ),
            ),
            TextButton(
              onPressed: con.isTimerRunning || con.isButtonDisabled // Disable "Resend" if timer is running or any input is empty
                  ? null
                  : () {
                con.startTimer(); // Resend the OTP
              },
              child: Text(
                "اعادة ارسال الرمز",
                textDirection: TextDirection.rtl,
                style: TextStyleHelper.of(context).b_20.copyWith(
                  color: ThemeClass.of(context).mainBlack,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
