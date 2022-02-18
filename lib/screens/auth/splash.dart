import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/auth/login.dart';
import 'package:provider/provider.dart';

import '../../globals/designs/size_config.dart';
import '../../globals/navigation/navigator_services.dart';
import '../../globals/widgets/loader.dart';
import '../../providers/auth_provider.dart';
import '../home/home.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  final NavigatorService _navigatorService = NavigatorService();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoader();
        } else if (!snapshot.hasData || snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const LoginScreen()));
          });

          return const SizedBox();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const LoginScreen()));
          });

          return const SizedBox();
        }
      },
    );
  }
}
