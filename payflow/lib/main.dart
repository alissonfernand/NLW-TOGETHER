import 'package:flutter/material.dart';
// import 'package:payflow/modules/splash/splash_page.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/appcolors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: LoginPage(),
    );
  }
}
