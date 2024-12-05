import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserApi {

    
  final String _endpoint = "https://webservice.sballando.it";
  String email;
  String password;
  Map<String, dynamic> data = {};

  UserApi({required this.email, required this.password});

  Future<Map<String, dynamic>> login() async {

    try{
      http.Response response = 
        await http.post(
          Uri.parse("$_endpoint/api/user/login"),
            headers: {
              'Content-Type': 'application/json',
            }, // Imposta l'header
            body: json.encode({
              'email' : email,
              'password' : password,
            }), // Converte la mappa in JSON
            
        );
        
      if(response.statusCode == 200){
        
        dynamic jsonResponse  = json.decode(response.body);
        bool status           = jsonResponse['status']; 
        
        if(status){ // Se ok.. recupera l'utente
          data = jsonResponse;
        }

      }

    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }

    return data;
  }

}