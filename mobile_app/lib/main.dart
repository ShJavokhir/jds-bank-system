import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main()async {
  await GetStorage.init();

  final mySystemTheme= SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Colors.red);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  //SystemUiOverlayStyle(
   //     statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
   //     statusBarBrightness: Brightness.dark,
   //     statusBarIconBrightness: Brightness.dark,
   //     systemNavigationBarIconBrightness: Brightness.dark,
   //     systemNavigationBarColor: Colors.white,
   //     systemNavigationBarDividerColor: Colors.white
   //   )
  runApp(

    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
