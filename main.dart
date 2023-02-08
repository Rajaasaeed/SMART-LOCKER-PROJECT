import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'controllers/bookingProvider.dart';
import 'controllers/investor_controller.dart';
import 'controllers/lockerProvider.dart';
import 'controllers/user_controller.dart';
import 'views/screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LockerProvider()),
    ChangeNotifierProvider(create: (_) => BookingProvider()),
    ChangeNotifierProvider(create: (_) => UserController()),
    ChangeNotifierProvider(create: (_) => InvestorController()),
  ], child: const SmartLockersApp()));
}

class SmartLockersApp extends StatelessWidget {
  const SmartLockersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate
        ],
        title: 'Smart Lockers',
        theme: CupertinoThemeData(
          barBackgroundColor: Colors.transparent,
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(190, 221, 97, 14),
        ),
        home: WelcomePage(),
      ),
    );
  }
}
