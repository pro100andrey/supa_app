import 'package:get/get.dart';

import '../modules/add_todo/bindings/add_todo_binding.dart';
import '../modules/add_todo/views/add_todo_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/initial/bindings/initial_binding.dart';
import '../modules/initial/views/initial_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.initial;

  static final routes = [
    GetPage<void>(
      name: _Paths.initial,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage<void>(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<void>(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage<void>(
      name: _Paths.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.addTodo,
      fullscreenDialog: true,
      page: () => const AddTodoView(),
      binding: AddTodoBinding(),
    ),
  ];
}
