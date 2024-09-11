import 'package:api_intigration_tutorial/provider/count_provider.dart';
import 'package:api_intigration_tutorial/screens/counter_provider_screen.dart';
import 'package:api_intigration_tutorial/screens/dropdown_api_screen.dart';
import 'package:api_intigration_tutorial/screens/home_screen.dart';
import 'package:api_intigration_tutorial/screens/Signup_screen.dart';
import 'package:api_intigration_tutorial/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/upload_image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CountProvider(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 199, 8, 233),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: CounterProviderScreen()));
  }
}
