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
  var resourceList = [];
  var resourceListFiltered = [];
  late List<String> languageList;
  late List<String> moduleList;
  late String languageIndex;
  late String moduleIndex;
  var initialized = false;

  String convertDate(String date) {
    if(date.isNotEmpty && date != "null") {
      return DateFormat('dd/MM/yy').format(DateTime.parse(date).toLocal()).toString();
    } else {
      return DateFormat('dd/MM/yy').format(DateTime.parse(DateTime.now().toString()).toLocal()).toString();
    }
  }

  loadScreen() async {
    if (!initialized) {
      resourceList = await translateService.getResources();
      resourceListFiltered = resourceList;
      var returned = TranslateService().organizeFilters(resourceList);
      moduleIndex = returned["moduleList"][0];
      moduleList = returned["moduleList"];
      languageIndex = returned["languageList"][0];
      languageList = returned["languageList"];
      initialized = true;
    }
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: search,
                  cursorColor: AppColors.primary,
                  onChanged: (text) {
                    setState((){
                      languageIndex = languageList[0];
                      moduleIndex = moduleList[0];
                      resourceListFiltered = translateService.searchResource(resourceList,text,"value");
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
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search,color: AppColors.primary),
                        onPressed: () {
                          setState((){
                            languageIndex = languageList[0];
                            moduleIndex = moduleList[0];
                            resourceListFiltered = translateService.searchResource(resourceList,search.text,"value");
                          });
                        },
                      ),
                      labelText: 'Buscar tradução',
                      labelStyle: const TextStyle(color: AppColors.primary)
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                          setState((){
                            search.clear();
                            moduleIndex = moduleList[0];
                            if (value != "Selecione") {
                              resourceListFiltered = TranslateService().searchResource(resourceList, value, "language_id");
                            } else {
                              resourceListFiltered = TranslateService().searchResource(resourceList, "", "language_id");
                            }
                          });
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButtonFormField(
                        value: moduleIndex,
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
                            labelText: 'Módulos',
                            labelStyle: TextStyle(color: AppColors.primary,fontSize: 20)
                        ),
                        isExpanded: true,
                        onChanged: (String? value) {
                          setState((){
                            search.clear();
                            languageIndex = languageList[0];
                            if (value != "Selecione") {
                              resourceListFiltered = TranslateService().searchResource(resourceList, value, "module_id");
                            } else {
                              resourceListFiltered = TranslateService().searchResource(resourceList, "", "module_id");
                            }
                          });
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
                        items: moduleList.map((String val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: resourceListFiltered.length,
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
                                    Text(resourceListFiltered[index]["resource"]["language_id"].toUpperCase()),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(resourceListFiltered[index]["resource"]["value"],style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    Text(resourceListFiltered[index]["resource"]["resource_id"],textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(convertDate(resourceListFiltered[index]["resource"]["updated_at"].toString()))
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          TranslateService().cleanLocalResources();
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (c, a1, a2) => const HomePage(),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 500),
          ),);
        },
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}