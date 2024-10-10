import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/Theme/theme_model.dart';
import '../core/Theme/theme_provider.dart';

class ThemeClass extends ThemeModel{

  static ThemeModel of(BuildContext context) => Provider.of<ThemeProvider>(context,listen: false).appTheme;


  ThemeClass.lightTheme({
    super.isDark = false,
    super.whiteColor = const Color(0xffFFFFFF),
    super.primaryColor = const Color(0xff239E46),
    super.secondary = const Color(0xffDFF9E6),
    super.labelColor = const Color(0xffDCDCDC),
    super.background = const Color(0xfff1fcf3),
    super.mainBlack = const Color(0xff000000),
    super.secondaryBlackColor = const Color(0xff6D6D6D),
    super.waiting = const Color(0xffF68524),
    super.cancel = const Color(0xffEA3829),
    super.success = const Color(0xff00B060),

  });

  ThemeClass.darkTheme({
    super.isDark = true,
    super.whiteColor = const Color(0xffFFFFFF),
    super.primaryColor = const Color(0xff239E46),
    super.background = const Color(0xfff1fcf3),
    super.secondary = const Color(0xffDFF9E6),
    super.success = const Color(0xff00B060),
    super.waiting = const Color(0xffF68524),
    super.cancel = const Color(0xffEA3829),
    super.mainBlack = const Color(0xff000000),
    super.secondaryBlackColor = const Color(0xff6D6D6D),
    super.labelColor = const Color(0xffDCDCDC),
  });
}

