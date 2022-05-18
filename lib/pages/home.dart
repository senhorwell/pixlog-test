import 'package:flutter/material.dart';
import 'package:pixlog_translater/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Tradutor"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Tradutor'),
      ),
    );
  }
}