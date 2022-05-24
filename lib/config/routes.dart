import '../screens/home/home_page.dart';
import '../screens/introduction/introduction/introduction_page.dart';
import 'route_name.dart';

final routes = {
  RouteName.introduction: (context) => const IntroductionPage(),
  RouteName.home: (context) => const HomePage(),
};
