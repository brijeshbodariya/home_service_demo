import 'package:flutter/material.dart';
import 'package:home_service_demo/Splash/splash_screen.dart';
import 'package:home_service_demo/UI/bottom_nav.dart';
import 'package:home_service_demo/UI/home.dart';
import 'package:home_service_demo/constant/constant.dart';
import 'package:home_service_demo/provider/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<Update>(
        create: (_) => Update(),
        child: MaterialApp(
          home: const AnimatedSplashScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryIconTheme: const IconThemeData(color: Colors.black),
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
          routes: <String, WidgetBuilder>{
            splashScreen: (BuildContext context) =>
                const AnimatedSplashScreen(),
            homeScreen: (BuildContext context) => const MyApp(),
          },
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'YOU ARE IN',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      'Sector 62, Noida',
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: const Home(),
      bottomNavigationBar: const Bottom(),
    );
  }
}
