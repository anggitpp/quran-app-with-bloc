part of 'detail_surah_cubit.dart';

enum DetailSurahStatus {
  initial,
  loading,
  success,
  error,
}

class DetailSurahState extends Equatable {
  final DetailSurahStatus detailSurahStatus;
  final DetailSurah detailSurah;
  DetailSurahState({
    required this.detailSurahStatus,
    required this.detailSurah,
  });

  factory DetailSurahState.initial() {
    return DetailSurahState(
        detailSurahStatus: DetailSurahStatus.initial,
        detailSurah: DetailSurah());
  }

  @override
  String toString() =>
      'DetailSurahState(detailSurahStatus: $detailSurahStatus, detailSurah: $detailSurah)';

  @override
  List<Object> get props => [detailSurahStatus, detailSurah];

  DetailSurahState copyWith({
    DetailSurahStatus? detailSurahStatus,
    DetailSurah? detailSurah,
  }) {
    return DetailSurahState(
      detailSurahStatus: detailSurahStatus ?? this.detailSurahStatus,
      detailSurah: detailSurah ?? this.detailSurah,
    );
  }
}
