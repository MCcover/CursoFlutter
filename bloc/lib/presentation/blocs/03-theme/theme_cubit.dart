import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool isDarkMode = false,
  }) : super(ThemeState(isDarkMode: isDarkMode));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode() {
    emit(const ThemeState(isDarkMode: true));
  }

  void setLightMode() {
    emit(const ThemeState(isDarkMode: false));
  }
}
