import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/config/route_name.dart';

import '../../config/theme.dart';
import '../../cubit/cubits.dart';
import '../../models/surah.dart';
import 'package:quran_app/config/constant.dart';

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
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, RouteName.homeSearch),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(
                    fontSize: AppSizes.defaultMargin,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: AppSizes.phoneWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.darkPurpleColor.withOpacity(0.5),
                        AppColors.darkPurpleColor,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Opacity(
                          opacity: 0.6,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/images/alquran.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Bacaan Terakhir',
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Al-Fatihah',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Juz 1 | Ayat 5',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // BlocBuilder<HomeCubit, HomeState>(
        //   builder: (context, state) {
        //     return state.surahStatus == SurahStatus.success
        //         ? ListView.builder(
        //             itemCount: state.surah.length,
        //             itemBuilder: (context, index) {
        //               Surah surah = state.surah[index];
        //               return ListTile(
        //                 onTap: () => Navigator.pushNamed(
        //                     context, RouteName.detailSurah,
        //                     arguments: surah),
        //                 leading: CircleAvatar(
        //                   child: Text('${surah.number}'),
        //                 ),
        //                 title: Text(
        //                   '${surah.name!.transliteration!.id!} (${surah.name!.translation!.id!})',
        //                 ),
        //                 subtitle: Text(
        //                   '${surah.numberOfVerses} ayat | ${surah.revelation?.id}',
        //                 ),
        //                 trailing: Text(
        //                   surah.name!.short!,
        //                 ),
        //               );
        //             },
        //           )
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           );
        //   },
        // ),
      ),
    );
  }
}
