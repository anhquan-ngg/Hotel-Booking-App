import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/firebase_options.dart';
import 'package:hotel_booking_app/pages/splash.dart';
import 'package:hotel_booking_app/common/app_colors.dart';

import 'firebase_options.dart';

const clientId = 'adslfjhas;dfjasdjfgajldfggals';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: AppColors.primaryNormal),
        primaryColor: AppColors.primaryNormal,
        textTheme: GoogleFonts.interTextTheme()
      ),
      home: const SplashPage(),
    );
  }
}
