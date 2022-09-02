import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_project/style/all_styles.dart';

part 'theme_switch_event.dart';

part 'theme_switch_state.dart';

class ThemeSwitchBloc extends Bloc<ThemeSwitchEvent, ThemeSwitchState> {
  ThemeSwitchBloc() : super(const ThemeSwitchState()) {
    on<WhiteTheme>(_onWhiteTheme);
    on<DarkTheme>(_onDarkTheme);
  }

  void _onWhiteTheme(WhiteTheme event, Emitter<ThemeSwitchState> emit) {
    final bool isWhite = state.currentTheme == ThemeStyle.white;
    if (isWhite) {
      return;
    }
    state.copyWith(currentTheme: ThemeStyle.white);
    print("${state.currentTheme} white ");
  }

  void _onDarkTheme(DarkTheme event, Emitter<ThemeSwitchState> emit) {
    final bool isDark = state.currentTheme == ThemeStyle.dark;
    if (isDark) {
      return;
    }
    state.copyWith(currentTheme: ThemeStyle.dark);
    print("${state.currentTheme} dark ");
  }
}
