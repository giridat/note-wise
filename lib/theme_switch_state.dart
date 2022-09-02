part of 'theme_switch_bloc.dart';




class ThemeSwitchState extends Equatable {
  const ThemeSwitchState({this.currentTheme = ThemeStyle.white});
  final ThemeStyle currentTheme;
  @override
  // TODO: implement props
  List<Object> get props => [currentTheme];

  ThemeSwitchState copyWith({
    ThemeStyle? currentTheme,

  }) {
    print(currentTheme);
    return ThemeSwitchState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}


