import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.todo),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: Text(S.current.logout),
                onTap: () async => controller.logout(),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('HomeView'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('LoginView'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('RegisterView'),
              onTap: () {},
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => Get.toNamed<dynamic>(Routes.addTodo),
          child: const Icon(Icons.add),
        ),
      );
}
