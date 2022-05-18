import 'package:flutter/material.dart';
import 'package:pixlog_translater/services/translater_service.dart';
import 'package:pixlog_translater/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  TranslateService translateService = TranslateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Tradutor"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: translateService.getResources(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data["resource"].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Card(
                  child: Column(
                    children: [
                      Text(snapshot.data["resource"][index]["resource"]["created_at"]),
                      Text(snapshot.data["resource"][index]["resource"]["updated_at"]),
                      Text(snapshot.data["resource"][index]["resource"]["resource_id"]),
                      Text(snapshot.data["resource"][index]["resource"]["module_id"]),
                      Text(snapshot.data["resource"][index]["resource"]["value"]),
                      Text(snapshot.data["resource"][index]["resource"]["language_id"]),
                    ],
                  ),
                ),
              );
            },
          );
        }
      )
    );
  }
}