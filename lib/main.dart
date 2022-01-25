import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mighty_book/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Note: UserController would be used in router middleware,
  /// and should load before Get.binding phase.
  // Get.put<UserController>(
  //   UserController(
  //     UserRepository(),
  //   ),
  // );
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ROUTES.home,
        getPages: AppPages.pages,
      ),
    );
  }
}
