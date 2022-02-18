import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Logo.png'),
          const SizedBox(
            height: 150,
            width: 150,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [Colors.purple],
            ),
          ),
        ],
      ),
    );
  }
}
