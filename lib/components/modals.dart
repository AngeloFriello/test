import 'package:flutter/material.dart';
class Modals {

  void showMessage(BuildContext context, String title, String body){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/films');
              }, 
              child: const Text("Ok")
            )
          ],
        );
      }
    );
  }

  void loader(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text("Attendi..."),
          content: SingleChildScrollView(
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: const CircularProgressIndicator()
            ),
          ),
        );
      }
    );
  }

}