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

final green = Colors.lightGreen[900];
final grey = Colors.grey[300];
final yellow = Colors.yellow[600];

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
          appBarTheme: AppBarTheme(backgroundColor: green),
          textTheme: Theme.of(context).textTheme.apply(
                // bodyColor: grey,
                displayColor: grey,
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: green,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: green,
          ),
          primaryColor: green,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: green,
            selectionHandleColor: yellow,
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: yellow!))
          ),
          backgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ROUTES.home,
        getPages: AppPages.pages,
      ),
    );
  }
}
