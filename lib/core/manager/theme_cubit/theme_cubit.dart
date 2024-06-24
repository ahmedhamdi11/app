import 'package:app/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.isDarkTheme) : super(ThemeInitial());

  bool isDarkTheme;

  void changeTheme(bool isDark) {
    isDarkTheme = isDark;
    emit(ChangeThemeState());
    getIt<SharedPreferences>().setBool("darkTheme", isDarkTheme);
  }
}
