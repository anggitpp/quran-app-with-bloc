import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quran_app/repositories/surah_repository.dart';

import '../../models/detail_surah.dart';

part 'detail_surah_state.dart';

class DetailSurahCubit extends Cubit<DetailSurahState> {
  final SurahRepository surahRepository;
  DetailSurahCubit({
    required this.surahRepository,
  }) : super(DetailSurahState.initial());

  void loadDetailSurah(int numberSurah) async {
    emit(state.copyWith(detailSurahStatus: DetailSurahStatus.loading));
    DetailSurah detailSurah = await surahRepository.getDetailSurah(numberSurah);
    emit(
      state.copyWith(
          detailSurahStatus: DetailSurahStatus.success,
          detailSurah: detailSurah),
    );
  }
}
