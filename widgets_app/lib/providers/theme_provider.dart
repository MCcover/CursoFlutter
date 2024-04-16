import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(
      selectedColor: colorIndex,
    );
  }
}
