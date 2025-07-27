import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_router.dart';
import 'package:small_kindness/features/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(size: 24.w),
            elevation: 2.5.r,
            scrolledUnderElevation: 0,
            backgroundColor: ConstColors().ffFFFFFF,
            titleTextStyle: AppTextStyles.urbanist.semiBold(
              color: ConstColors().ff000000,
              fontSize: 22.sp,
            ),
          ),
          splashColor: Colors.transparent,
          // It remove the unecessary borders
          dividerColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          scaffoldBackgroundColor: ConstColors().ffFFFFFF,
        ),
        navigatorKey: AppRouter.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
