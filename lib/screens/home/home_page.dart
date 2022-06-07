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
    bool isDarkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeCubit>().changeTheme(),
        child: Icon(
          Icons.color_lens,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                  onTap: () => Navigator.pushNamed(context, RouteName.lastRead),
                  child: Container(
                    width: AppSizes.phoneWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.lightPurpleColor,
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
                                    style:
                                        TextStyle(color: AppColors.whiteColor),
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
                SizedBox(
                  height: 20,
                ),
                TabBar(
                  indicatorColor:
                      isDarkMode ? Colors.white : AppColors.purpleColor,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(
                      text: "Surah",
                    ),
                    Tab(
                      text: "Juz",
                    ),
                    Tab(
                      text: "Bookmark",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    BlocBuilder<HomeCubit, HomeState>(
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
                                    leading: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/${isDarkMode ? 'octagon-dark.png' : 'octagon.png'}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${surah.number}',
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : AppColors.purpleColor,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      '${surah.name!.transliteration!.id!} (${surah.name!.translation!.id!})',
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : AppColors.purpleColor),
                                    ),
                                    subtitle: Text(
                                      '${surah.numberOfVerses} ayat | ${surah.revelation?.id}',
                                    ),
                                    trailing: Text(
                                      surah.name!.short!,
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : AppColors.purpleColor),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                    ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/${isDarkMode ? 'octagon-dark.png' : 'octagon.png'}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : AppColors.purpleColor,
                              ),
                            ),
                          ),
                          title: Text(
                            'Juz ${index + 1}',
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : AppColors.purpleColor),
                          ),
                        );
                      },
                    ),
                    Center(child: Text('View Bookmark')),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
