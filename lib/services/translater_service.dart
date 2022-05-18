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

  getResourceFake() {
    return jsonDecode('[{"resource":{"created_at":"2021-08-14T20:49:32Z","updated_at":"2021-08-14T20:49:32Z","resource_id":"textfile.combineOrders","module_id":"GreenMileTrack","value":"Merge orders in the same stop","language_id":"en-g"}},{"resource":{"created_at":"2021-01-19T13:12:36Z","updated_at":"2021-01-19T13:12:36Z","resource_id":"Survey.Question.Operation.fields","module_id":"GreenMileTrack","value":"Arithmetische Operation","language_id":"de"}},{"resource":{"created_at":"2021-01-19T13:12:38Z","updated_at":"2021-01-19T13:12:38Z","resource_id":"Survey.Operation.haveFieldsEmpty","module_id":"GreenMileTrack","value":"Completare tutti i campi per una domanda su unoperazione aritmetica","language_id":"it"}},{"resource":{"created_at":"2021-01-19T13:12:39Z","updated_at":"2021-01-19T13:12:39Z","resource_id":"Survey.Question.Operation.additon","module_id":"GreenMileTrack","value":"Somme","language_id":"fr"}},{"resource":{"created_at":"2021-01-19T13:12:39Z","updated_at":"2021-01-19T13:12:39Z","resource_id":"Survey.Question.Operation.additon","module_id":"GreenMileTrack","value":"การเพิ่ม","language_id":"th"}},{"resource":{"created_at":"2021-01-19T13:12:40Z","updated_at":"2021-01-19T13:12:40Z","resource_id":"Survey.Question.Operation.subtraction","module_id":"GreenMileTrack","value":"Sustracción","language_id":"es"}},{"resource":{"created_at":"2021-01-19T13:12:42Z","updated_at":"2021-01-19T13:12:42Z","resource_id":"Survey.Question.Operation.multiplication","module_id":"GreenMileTrack","value":"การคูณ","language_id":"th"}},{"resource":{"created_at":"2021-01-19T13:12:43Z","updated_at":"2021-01-19T13:12:43Z","resource_id":"Survey.Question.Operation.division","module_id":"GreenMileTrack","value":"แผนก","language_id":"th"}},{"resource":{"created_at":"2021-01-19T13:12:44Z","updated_at":"2021-01-19T13:12:44Z","resource_id":"Greenmile.Grid.Button.deleteSelected","module_id":"GreenMileTrack","value":"Seleccione al menos un elemento para eliminar","language_id":"es"}},{"resource":{"created_at":"2021-01-19T13:12:45Z","updated_at":"2021-01-19T13:12:45Z","resource_id":"users.changePasswordHeader.label","module_id":"GreenMileTrack","value":"รีเซ็ตรหัสผ่านของคุณ","language_id":"th"}},{"resource":{"created_at":"2021-01-19T13:12:48Z","updated_at":"2021-01-19T13:12:48Z","resource_id":"Greenmile.Grid.Button.helpPage","module_id":"GreenMileTrack","value":"Ayuda","language_id":"es"}},{"resource":{"created_at":"2021-01-19T13:12:49Z","updated_at":"2021-01-19T13:12:49Z","resource_id":"survey.operation.orderException","module_id":"GreenMileTrack","value":"Non è possibile utilizzare operandi con un ordine uguale o maggiore di quello delloperazione che si sta creando","language_id":"it"}},{"resource":{"created_at":"2021-06-17T16:16:16Z","updated_at":"2021-06-17T16:16:16Z","resource_id":"whatsnew","module_id":"GreenMileTrack","value":"Whats New","language_id":"en"}},{"resource":{"created_at":"2021-06-17T16:21:38Z","updated_at":"2021-06-17T16:21:38Z","resource_id":"users.createpass","module_id":"GreenMileTrack","value":"Create password","language_id":"en"}},{"resource":{"created_at":"2021-08-14T20:49:26Z","updated_at":"2021-08-14T20:49:26Z","resource_id":"driver.time.day","module_id":"GreenMileDriver","value":"day","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:26Z","updated_at":"2021-08-14T20:49:26Z","resource_id":"equipment.button.edit","module_id":"GreenMileTrack","value":"Save","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:26Z","updated_at":"2021-08-14T20:49:26Z","resource_id":"pod.photo.comment","module_id":"GreenMileDriverGeneric","value":"Picture comments","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:26Z","updated_at":"2021-08-14T20:49:26Z","resource_id":"TextFile.route.stops.stopType.key","module_id":"GreenMileTrack","value":"Stop type key","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"TextFile.route.lastStopIsDestination","module_id":"GreenMileTrack","value":"Last Stop is Destination","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"driver.integration.error.sd.card.not.avaliable","module_id":"GreenMileDriverGeneric","value":"Memory card is not available","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"TextFile.route.stops.plannedArrival","module_id":"GreenMileTrack","value":"Stop planned arrival","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"TextFile.route.stops.location.longitude","module_id":"GreenMileTrack","value":"Stop location longitude","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"TextFile.location.taxType","module_id":"GreenMileTrack","value":"Location tax type","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"GeotabSyncConfiguration.saved","module_id":"GreenMileTrack","value":"Configuration was saved successfully!","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:27Z","updated_at":"2021-08-14T20:49:27Z","resource_id":"permission.survey.release_survey","module_id":"GreenMileTrack","value":"Release","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"driver.new.order.remaining","module_id":"GreenMileDriver","value":"Remaining:","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"stop.serviceMobileGPSProvider","module_id":"GreenMileTrack","value":"Service Mobile GPS Provider","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"bulkarrive.departAll","module_id":"GreenMileDriverGeneric","value":"Depart from all stops?","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"driver.hoscountdown.driver.positivebutton","module_id":"GreenMileDriverGeneric","value":"Do the request for everyone","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"report.actual.departure","module_id":"GreenMileReport","value":"Actual Departure","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"DELIVERYPERFORMANCE.OUTOFSEQUENCE","module_id":"GreenMileTrack","value":"Stops out of Sequence","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"Stop.Transfer.CannotTransferStopsInProgress","module_id":"GreenMileCommons","value":"Cannot transfer stop(s) currently in progress.","language_id":"en-g"}},{"resource":{"created_at":"2021-08-14T20:49:28Z","updated_at":"2021-08-14T20:49:28Z","resource_id":"users.non_metric","module_id":"GreenMileTrack","value":"Non-Metric","language_id":"en-g"}}]');
  }

  searchResource(resources,searchName,filterName) {
    var filteredResources = [];
    for(int i=0;i<resources.length;i++){
      if(resources[i]["resource"][filterName].toLowerCase().contains(searchName.toLowerCase())) {
        filteredResources.add(resources[i]);
      }
    }
    return filteredResources;
  }

  organizeFilters(resources) {
    List<String> languageList = [];
    List<String> moduleList = [];
    for(int i=0;i<resources.length;i++){
      languageList.add(resources[i]["resource"]["language_id"].toUpperCase());
      moduleList.add(resources[i]["resource"]["module_id"]);
    }
    return {
      "languageList": languageList.toSet().toList(),
      "moduleList": moduleList.toSet().toList()
    };
  }
}