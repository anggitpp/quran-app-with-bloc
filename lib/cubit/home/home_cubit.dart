import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/repositories/surah_repository.dart';

import '../../models/surah.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SurahRepository surahRepository;
  HomeCubit({required this.surahRepository}) : super(HomeState.initial());

  void loadSurah() async {
    emit(state.copyWith(surahStatus: SurahStatus.loading));
    List<Surah> allSurah = await surahRepository.getAllSurah();
    emit(state.copyWith(surahStatus: SurahStatus.success, surah: allSurah));
  }
}
