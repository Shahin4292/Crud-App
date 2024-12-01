import 'package:crud_getx/routes/route_names.dart';
import 'package:crud_getx/views/note_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/home_screen.dart';

class RoutePages {
  static List<GetPage<dynamic>> route = [
    GetPage(
      name: RouteNames.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteNames.noteScreen,
      page: () => const NoteScreen(),
    )
  ];
}
