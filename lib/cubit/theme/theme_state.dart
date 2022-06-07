part of 'theme_cubit.dart';

enum ThemeStatus {
  light,
  dark,
}

class ThemeState extends Equatable {
  ThemeStatus themeStatus;
  ThemeState({
    required this.themeStatus,
  });

  factory ThemeState.initial() => ThemeState(themeStatus: ThemeStatus.light);

  @override
  List<Object> get props => [themeStatus];

  ThemeState copyWith({
    ThemeStatus? themeStatus,
  }) {
    return ThemeState(
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }

  @override
  String toString() => 'ThemeState(themeStatus: $themeStatus)';
}
