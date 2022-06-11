import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme.dart';
import '../../cubit/cubits.dart';
import '../../models/detail_surah.dart';
import '../../models/surah.dart';
import '../../widgets/widgets.dart';

class DetailSurahPage extends StatefulWidget {
  final Surah surah;

  const DetailSurahPage({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  void initState() {
    context.read<DetailSurahCubit>().loadDetailSurah(widget.surah.number!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Surah surah = widget.surah;

    return Scaffold(
      appBar: AppBar(
        title: Text('${surah.name?.transliteration?.id?.toUpperCase()}'),
      ),
      body: BlocBuilder<DetailSurahCubit, DetailSurahState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          return state.detailSurahStatus == DetailSurahStatus.success
              ? ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    GestureDetector(
                      onTap: () => showGlobalDialog(
                          context, 'Tafsir', '${surah.tafsir!.id}'),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.lightPurpleColor,
                              AppColors.darkPurpleColor,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                '${surah.name?.transliteration?.id?.toUpperCase()}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '( ${surah.name?.translation?.id?.toUpperCase()} )',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                '${surah.numberOfVerses} Ayat | ${surah.revelation?.id}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.detailSurah.verses?.length,
                      itemBuilder: (context, index) {
                        final Verse verse = state.detailSurah.verses![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.purple[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/octagon.png'),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${verse.number?.inSurah}',
                                        style: TextStyle(
                                            color: AppColors.purpleColor),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.bookmark_add_outlined),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.play_arrow),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${verse.text?.arab} ",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${verse.text?.transliteration?.en} ",
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "${verse.translation?.id} ",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      },
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
