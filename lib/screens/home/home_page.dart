import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      Surah data = state.surah[index];
                      return ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          child: Text('${data.number}'),
                        ),
                        title: Text(
                          '${data.name!.transliteration!.id!} (${data.name!.translation!.id!})',
                        ),
                        subtitle: Text(
                            '${data.numberOfVerses} ayat | ${data.revelation?.id}'),
                        trailing: Text(data.name!.short!),
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
