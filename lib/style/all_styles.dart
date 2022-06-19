import 'package:note_project/style/app_style_dark.dart';
import 'package:note_project/style/app_style_light.dart';

enum ThemeStyle { white, dark }

final Map<Enum, dynamic> allThemes = {
  ThemeStyle.white: LightMode(),
  ThemeStyle.dark: DarkMode()
};
