part of 'home_cubit.dart';

enum SurahStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final SurahStatus surahStatus;
  final List<Surah> surah;
  HomeState({
    required this.surahStatus,
    required this.surah,
  });

  factory HomeState.initial() {
    return HomeState(surahStatus: SurahStatus.initial, surah: []);
  }

  HomeState copyWith({
    SurahStatus? surahStatus,
    List<Surah>? surah,
  }) {
    return HomeState(
      surahStatus: surahStatus ?? this.surahStatus,
      surah: surah ?? this.surah,
    );
  }

  @override
  String toString() => 'HomeState(surahStatus: $surahStatus)';

  @override
  List<Object> get props => [surahStatus, surah];
}
