import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly_url/Welcome_Page.dart';

import 'ShortedUrl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ()=>MaterialApp(

        home: Welcome_Page(),

      ),
      designSize:const Size(428, 926) ,
    );
  }
}

