import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pravas/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return GetMaterialApp(
          theme: PravasThemeData.themeDataLight(),
          darkTheme: PravasThemeData.themeDataDark(),
          themeMode: ThemeMode.system,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
//flutter version:-3.10.6
//dart version:-3.0.6
