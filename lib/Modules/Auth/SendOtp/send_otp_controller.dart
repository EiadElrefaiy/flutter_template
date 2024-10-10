import 'dart:async';
import 'package:Parking/Utilities/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SendOtpController extends ControllerMVC {
  factory SendOtpController() {
    _this ??= SendOtpController._();
    return _this!;
  }
  static SendOtpController? _this;
  SendOtpController._();

  bool loading = false;
  late List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  Timer? _timer;
  int remainingTime = 120; // Initial countdown time (2 minutes)
  bool isButtonDisabled = true; // Button is disabled initially
  bool isTimerRunning = false; // Timer running state

  @override
  void initState() {
    super.initState();
    for (var controller in otpControllers) {
      controller.addListener(checkIfAllInputsFilled); // Listen for changes in each input field
    }
    startTimer();
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void checkIfAllInputsFilled() {
    isButtonDisabled = otpControllers.any((controller) => controller.text.isEmpty); // Disable if any input is empty
    setState(() {});
  }

  // Start the OTP timer countdown
  void startTimer() {
    remainingTime = 120;
    isButtonDisabled = false; // Disable button while the timer is running
    isTimerRunning = true; // Set timer state to running
    setState(() {});

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
      } else {
        _timer?.cancel();
        isTimerRunning = false; // Set timer state to not running
        isButtonDisabled = false; // Enable button when timer is done
      }
      setState(() {});
    });
  }

  // Handles OTP send logic
  void onSendOtp() {
    if (loading) return; // Prevent multiple requests
    loading = true;
    setState(() {});

    // Example of sending the OTP; replace with your actual implementation
    /*
    final result = await SendOtpDataHandler.sendOtp(otp: otpControllers.map((controller) => controller.text).join());
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) {
      currentContext_!.pushNamed("forget-password");
    });
    */

    loading = false; // Reset loading state
    setState(() {});
  }
}
