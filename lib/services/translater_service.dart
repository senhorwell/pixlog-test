import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslateService {
  getResources() async {
    var client = http.Client();
    try {
      var response = await http.get(
        Uri.parse('http://portal.greenmilesoftware.com/get_resources_since'),
      );

      return {
        "result": true,
        "resource": jsonDecode(response.body)
      };
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }

    return {
      "result": false,
    };
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
}