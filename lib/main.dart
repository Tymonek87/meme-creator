import 'package:flutter/material.dart';
import 'package:meme_creator/injectable/injectable.dart';
import 'package:meme_creator/presentation/pages/login/login_page_builder.dart';

import 'package:meme_creator/presentation/pages/registration/registration_page_builder.dart';

void main() {
  configureDependencies();
  runApp(const MemeCreatorApp());
}

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => const LoginPageBuilder(),
  "/register": (BuildContext context) => const RegistrationPageBuilder(),
};
class MemeCreatorApp extends StatelessWidget {
  const MemeCreatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Tomasz Krasoń',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: routes,
      home: const SafeArea(
        child: LoginPageBuilder()
      ),
    );
  }
}
