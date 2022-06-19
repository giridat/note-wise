import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_project/screens/home_screen.dart';
import 'package:note_project/style/all_styles.dart';
import 'package:note_project/style/app_style_dark.dart';
import 'package:note_project/style/app_style_light.dart';
import 'package:note_project/theme_switch_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // ThemeData newTheme = ThemeData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeSwitchBloc>(
      create: (context) => ThemeSwitchBloc(),
      child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (context, state) {
          ThemeData newTheme = ThemeData();
          if (state.currentTheme == ThemeStyle.white) {
            newTheme = ThemeData(
                primaryColor: LightMode.accentColor,
                backgroundColor: LightMode.bgColor,
                scaffoldBackgroundColor: LightMode.bgColor);
          }
          if (state.currentTheme == ThemeStyle.dark) {
            newTheme = ThemeData(
                primaryColor: DarkMode.accentColor,
                backgroundColor: DarkMode.bgColor,
                scaffoldBackgroundColor: DarkMode.bgColor);
          }

          return MaterialApp(
            theme: newTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
// if (state.currentTheme == ThemeStyle.white) {
// newTheme = ThemeData(primaryColor: LightMode.accentColor,
// backgroundColor: LightMode.bgColor,
// scaffoldBackgroundColor: LightMode.bgColor);
// }
// if (state.currentTheme == ThemeStyle.dark) {
// newTheme = ThemeData(primaryColor: DarkMode.accentColor,
// backgroundColor: DarkMode.bgColor,
// scaffoldBackgroundColor: DarkMode.bgColor);
// }
}
