import 'package:get/route_manager.dart';

import '../ui/views/views.dart';
part 'app_routes.dart';

mixin AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
  ];
}
