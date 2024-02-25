import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:glycoguide/app_screens/signin_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: "${dotenv.env["APIKEY"]}");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Lato',
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
    );
  }
}
