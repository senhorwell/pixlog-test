import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pixlog_translater/pages/home.dart';
import 'package:pixlog_translater/themes/app_colors.dart';
import 'package:pixlog_translater/themes/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween(
      begin: 3.0,
      end: 0.0,
    ).animate(_controller);
    super.initState();

    _mockCheckForSession();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    _navigateToHome();

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        child: Center(
            child: Hero(
          tag: "heroLogo",
          child: FadeTransition(
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(_controller),
            child: Center(
              child: Image.asset(
                AppImages.logo,
                width: 200,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
