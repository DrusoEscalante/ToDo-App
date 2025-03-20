import 'package:flutter/material.dart';

import 'landingPage.dart';

void main() {
  runApp(const themes());
}

class themes extends StatelessWidget {
  const themes({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: landingPage()
    );
  }
}


