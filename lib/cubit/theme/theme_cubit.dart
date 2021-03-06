import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme() {
    if (state.themeStatus == ThemeStatus.light) {
      emit(ThemeState(themeStatus: ThemeStatus.dark));
    } else {
      emit(ThemeState(themeStatus: ThemeStatus.light));
    }
  }
}
