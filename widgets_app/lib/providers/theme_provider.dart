import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);
final colorListProvider = Provider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier()
      : super(AppTheme(
          selectedColor: 0,
          isDarkMode: false,
        ));
}
