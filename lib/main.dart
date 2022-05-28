import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/config/routes.dart';
import 'package:quran_app/cubit/cubits.dart';
import 'package:quran_app/cubit/home/home_cubit.dart';
import 'package:quran_app/repositories/surah_repository.dart';
import 'package:quran_app/config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => SurahRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeCubit(surahRepository: context.read<SurahRepository>()),
          ),
          BlocProvider(
            create: (context) => DetailSurahCubit(
                surahRepository: context.read<SurahRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme,
          routes: routes,
        ),
      ),
    );
  }
}
