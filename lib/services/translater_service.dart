import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslateService {
  getResources() async {
    var client = http.Client();
    try {
      var response = await http.get(
        Uri.parse('http://portal.greenmilesoftware.com/get_resources_since'),
      );

      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }
  }

  searchResource(resources,searchName) {
    var filteredResources = [];
    for(int i=0;i<resources.length;i++){
      if(resources[i]["resource"]["resource_id"].toLowerCase().contains(searchName.toLowerCase())) {
        filteredResources.add(resources[i]);
      }
    }
    return filteredResources;
  }

  organizeFilters(resources) {
    List<String> languageList = [];
    List<String> moduleList = [];
    for(int i=0;i<10;i++){
      languageList.add(resources[i]["resource"]["language_id"].toUpperCase());
      moduleList.add(resources[i]["resource"]["module_id"].toUpperCase());
    }
    return {
      "languageList": languageList,
      "moduleList": moduleList
    };
  }
}