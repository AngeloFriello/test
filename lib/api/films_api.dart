import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FilmsApi {

  final String _endpoint = "https://webservice.sballando.it";

  Future<List<dynamic>> fetchFilms() async {

    List<dynamic> films = [];

    try{

      http.Response response = 
        await http.post(
          Uri.parse("$_endpoint/api/event/index")
        );

      if(response.statusCode == 200){
        
        dynamic jsonResponse  = json.decode(response.body);
        bool status           = jsonResponse['status']; 

        if(status){ // Se ok.. recupera i film
          films = jsonResponse['events'];
        }

      }

    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }

    return films;
  }

  Future<Object> fetchEvent(id_) async {
    Object event = {};

      try{

      http.Response response = 
        await http.post(
          Uri.parse("$_endpoint/api/event/show"),
            headers: {
              'Content-Type': 'application/json',
            }, // Imposta l'header
            body: json.encode({
              
              'eventId' : id_,
            }),
        );

      if(response.statusCode == 200){
        
        dynamic jsonResponse  = json.decode(response.body);
        bool status           = jsonResponse['status']; 

        if(status){ // Se ok.. recupera i film
          event = jsonResponse['event'];
        }

      }

    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }

    return event;
  }
}