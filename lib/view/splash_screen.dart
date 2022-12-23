// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/my_colors.dart';

import '../gen/assets.gen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => const MainScreen()),
          ),
        ),
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logoo.path,
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: solidColors.primeryColor,
                size: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
