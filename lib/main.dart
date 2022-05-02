import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/injectable/injectable.dart';
import 'package:meme_creator/presentation/pages/meme_app/bloc/navigation_bloc.dart';
import 'package:meme_creator/presentation/pages/meme_app/meme_app.dart';

void main() {
  configureDependencies();
  runApp(const MemeCreatorApp());
}

class MemeCreatorApp extends StatelessWidget {
  const MemeCreatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
          home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: MemeApp(),
      ));
}