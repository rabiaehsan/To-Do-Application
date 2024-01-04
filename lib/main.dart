import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'app/routes/app_pages.dart';
import 'auth/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, );
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'Todo app',
        theme: ThemeData(
                 colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL.toString(),
        // initialBinding: BindingsBuilder(() {
        //   Get.lazyPut(() => AuthController());
        // }),
        // getPages: [
        //   // GetPage(name: '/', page: () => const Splash()),
        //   // GetPage(name: '/videoplayerapp', page:() => const VideoPlayerApp()),
        //   // GetPage(name: '/signin', page: () => const SignIn()),
        //   // GetPage(name: '/homepage', page: () => const HomePage()),
        // ],

      ),
    );
  }
}


