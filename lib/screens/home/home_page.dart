import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/config/route_name.dart';

import '../../cubit/cubits.dart';
import '../../models/surah.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().loadSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.surahStatus == SurahStatus.success
                ? ListView.builder(
                    itemCount: state.surah.length,
                    itemBuilder: (context, index) {
                      Surah surah = state.surah[index];
                      return ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, RouteName.detailSurah,
                            arguments: surah),
                        leading: CircleAvatar(
                          child: Text('${surah.number}'),
                        ),
                        title: Text(
                          '${surah.name!.transliteration!.id!} (${surah.name!.translation!.id!})',
                        ),
                        subtitle: Text(
                          '${surah.numberOfVerses} ayat | ${surah.revelation?.id}',
                        ),
                        trailing: Text(
                          surah.name!.short!,
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
