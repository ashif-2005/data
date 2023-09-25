import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/provider/auth_provider.dart';
import 'package:otp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDD765gA287VSlLjhw-Yi9JYYx9X_3hYzs",
        authDomain: "auth-c2030.firebaseapp.com",
        //databaseURL: "",
        projectId: "auth-c2030",
        storageBucket: "auth-c2030.appspot.com",
        messagingSenderId: "1095242143091",
        appId: "1:1095242143091:android:0924132ed3231985b7e106"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        title: "FlutterPhoneAuth",
      ),
    );
  }
}
