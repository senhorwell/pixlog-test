import 'package:flutter/material.dart';
import 'package:pixlog_translater/services/translater_service.dart';
import 'package:pixlog_translater/themes/app_colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  TranslateService translateService = TranslateService();
  TextEditingController search = TextEditingController();
  var resourceList;

  String convertDate(date) {
    return DateFormat('dd/MM/yy').format(DateTime.parse(date).toLocal()).toString();
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              controller: search,
              cursorColor: AppColors.primary,
              onChanged: (text) {
                setState((){
                  resourceList = translateService.searchResource(resourceList,text);
                });
              },
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search,color: AppColors.primary),
                    onPressed: () {
                      setState((){
                        resourceList = translateService.searchResource(resourceList,search.text);
                      });
                    },
                  ),
                  labelText: 'Buscar tradução',
                labelStyle: const TextStyle(color: AppColors.primary)
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: translateService.getResources(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)),
                  );
                }
                resourceList = snapshot.data["resource"];

                return ListView.builder(
                  itemCount: resourceList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const Icon(Icons.translate,size: 40,color: AppColors.searchIcon),
                                    Text(resourceList[index]["resource"]["language_id"]),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(resourceList[index]["resource"]["resource_id"]),
                                    Text(resourceList[index]["resource"]["module_id"]),
                                    Text(resourceList[index]["resource"]["value"]),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(convertDate(resourceList[index]["resource"]["created_at"])),
                                    Text(convertDate(resourceList[index]["resource"]["updated_at"]))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      )
    );
  }
}