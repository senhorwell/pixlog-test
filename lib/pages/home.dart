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
  late List<String> languageList;
  late String languageIndex = "EN-G";

  String convertDate(date) {
    return DateFormat('dd/MM/yy').format(DateTime.parse(date).toLocal()).toString();
  }

  loadScreen() async {
    resourceList = await translateService.getResources();
    var returned = TranslateService().organizeFilters(resourceList);
    languageList = returned["languageList"];
    return resourceList;
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
      body: FutureBuilder(
        future: loadScreen(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)
              ),
            );
          }

          return Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: DropdownButtonFormField(
                  value: languageIndex,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    labelText: 'Idiomas',
                    labelStyle: TextStyle(color: AppColors.primary,fontSize: 20)
                  ),
                  isExpanded: true,
                  onChanged: (String? value) {
                  },
                  onSaved: (String? value) {
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Não pode estar vazio";
                    } else {
                      return null;
                    }
                  },
                  items: languageList.map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
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
                ),
              ),
            ],
          );
        }
      )
    );
  }
}