import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Color blue = const Color(0xFF0C6CF2);






const kYellow = Color(0xffffe600);
const runYellow = Color(0xffffe600);
const runBlack = Color(0xff1c1b1b);
const kBar = Color(0xffF2F5F7);
const kBlue = Color(0xff1c1b1b);
const kBlue1 = Color(0xFF007FBA);
var kFaded= const Color(0xff979797);
const kRegButton= Color(0xffDADEE3);
const kText = Color(0xff1B3760);
const kOwe= Color(0xffE6A40B);
//const kPrimaryColor = Color(0xff67407E);
const kAsh = Color(0xff959595);
const  kOrange = Color(0xffF15F22);
const  kDarkgreen   =    Color(0xff13C27C);
const  kgreen = Color(0xff96C93C);
const kRed= Color(0xffE02020);

const kprimaryYellow = Color(0xffFEB816);
const kprimaryLight =    Color(0xff987EA7);
const kprimaryGreen =   Color(0xff00B871);
const kPrimaryDark = Color(0xff1F1A21);
const kPrimaryDarkAccent = Color(0xff3E3F6F);
const kPrimaryDarkTextField = Color(0xff473A4D);
const kPrimaryDarkText = Color(0xffE3E4FF);

Color buttonColor = const Color(0xff00ACEC);
Color headerColor = const Color(0xff0D3E53);
Color smallTextColor = const Color(0xffB3B3B3);
Color textFieldBackgroundColor = const Color(0xffF5F9FF);
Color orangeColor = const Color(0xffF87831);
Color greenColor = const Color(0xff1AD88C);
Color modalWindowColor = const Color(0xff335d6e);
Color ourBluishGreyColor = const Color(0xff6D767D);
//const kPrimaryColor= Color(0xff67407E);
const kPrimaryColor= Color(0xff0F1E72);

//#67407E
final kTitleStyle = TextStyle(
  color: kFaded,
  fontFamily: 'CM Sans Serif',
  fontSize: 14.0,
  fontWeight: FontWeight.w700,
);


final kq = const TextStyle(color: Color(0xff858484), fontSize:10, fontWeight: FontWeight.w500);






class MyColors {

  static const Color colorPrimary = Color(0xffFF6D50);
  static const Color lightGrey = Color(0xffC1C1C1);
  static const Color colorPrimaryDark = Color(0x33FF6D50);
  static const Color accentColor = Color(0xffF5F5F5);
  static const Color grey = Color(0xffE1E3E8);
  static Color grey1 = const Color(0xffE1E3E8).withOpacity(0.5);
  static const Color otp = Color(0xff182538);
  static const Color boxOtp = Color(0x33C5CCD6);
  static const Color statusColor = Color(0xFFCCB8B8);
  static const Color statusColor2 = Color(0xFFB09393);
  static const Color textDetailsColor = Color(0xFF665656);
  static Color accentColorLight = const Color(0xFFFB7D64);

  static Color appBarBlueBlack = const Color(0xff505B6A);
  static Color drawerHeaderColor = const Color(0xffffe600);
  static Color drawerBG = const Color(0xff1c1b1b);
  static Color textBlueBlack = const Color(0xff182538);
  static Color buttonColor = const Color(0xff007FBA);
  static Color bgGreen = const Color(0xff228370);


  static const Color accentColorDeep = Color(0xffeaad30);
  static const Color colorGreyTrans = Color(0xffd6d6d6);



  static const madison = Color(0xFF0B3067);
  static const portGore = Color(0xFF232846);
  static const goldenBell = Color(0xFFED8F12);
  static const santasGrey = Color(0xFF9DA3B4);
  static const bigStone = Color(0xFF182538);
  static const athensGray = Color(0xFFF2F2F4);
  static const blackSqueeze = Color(0xFFF9FBFD);
  static const wildSand = Color(0xFFF5F5F5);
  static const manatee = Color(0xFF8C929C);
  static const catalinaBlue = Color(0xFF061476);
  static const shamRock = Color(0xFF2CC197);
  static const grayChateau = Color(0xFF9FA7B3);
  static const ghost = Color(0xFFE2E2E2);
  static const chablis = Color(0xFFFFF2F3);
  static const aliceBlue = Color(0xFFF8FCFF);

}





class AppTheme {
  static ThemeData lightThemeData() {
    return ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white, surfaceTintColor: Colors.white),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: 32.h,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: 22.h,
              fontWeight: FontWeight.w600,
            )),
        colorScheme: ColorScheme.light(onPrimary: blue),
        useMaterial3: true,
        primaryColorLight: blue,

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: blue,
        ),
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: blue,
        )),
        tabBarTheme:  TabBarTheme(
            indicatorColor: blue, indicatorSize: TabBarIndicatorSize.tab),
        primarySwatch: Colors.blue,
        fontFamily: 'Sora',
        brightness: Brightness.light,
        primaryColor: blue);
  }

  static ThemeData darkThemeData() {
    return ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.black, surfaceTintColor: Colors.white),
        colorScheme: ColorScheme.dark(onPrimary: blue),
        useMaterial3: true,
        primaryColorLight: blue,
        floatingActionButtonTheme:  FloatingActionButtonThemeData(
            backgroundColor: blue, foregroundColor: Colors.white),
        progressIndicatorTheme:  ProgressIndicatorThemeData(
          color: blue,
        ),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: 32.h,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: 22.h,
              fontWeight: FontWeight.w600,
            )),
        cardColor: Colors.grey,
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: blue,
        )),
        tabBarTheme:  TabBarTheme(
            indicatorColor: blue, indicatorSize: TabBarIndicatorSize.tab),
        primarySwatch: Colors.blue,
        fontFamily: 'Sora',
        primaryColor: blue);
  }
}
