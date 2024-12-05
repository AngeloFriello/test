import 'package:flutter/material.dart';
import 'package:test/api/user_api.dart';
import 'package:test/components/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{

  const Login({super.key});

  @override
  LoginState createState () => LoginState();

}

class LoginState extends State<Login>{

  TextEditingController controllerUsername  = TextEditingController();
  TextEditingController controllerPassword  = TextEditingController();
  TextEditingController controllerEmail     = TextEditingController();


  Future<void> readFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username'); // null se non esiste
    String? password = prefs.getString('password'); // null se non esiste
    print(username);
    print(password);

  }

  


  bool rememberMe                           = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: 200,
              child: TextField(
                controller: controllerUsername,
                decoration: const InputDecoration(
                  label: Text("Username")
                ),
              ),
            ),

            const SizedBox(height: 10), //usato per dare spazzio tra gli input

            SizedBox(
              width: 200,
              child: TextField(
                controller: controllerPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
            ),

            const SizedBox(height: 20), //usato per dare spazzio tra gli input

            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton( //pulsante login
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 49, 39, 38)
                ),
                onPressed: () async { // proprietà al click

                  String username = controllerUsername.text;
                  String password = controllerPassword.text;
                  Map<String, dynamic> data;
                  bool status;

                  if(username.isEmpty || password.isEmpty){
                    Modals().showMessage(context, "Attenzione", "Compilare username e password");
                    return;
                  }

                    
                  data = await UserApi(email: username, password: password).login();     
                  // VERIFICA SE TORNA UNA RISPOSTA LA CHIAMATA              
                  if(data.isNotEmpty){
                    // CONTROLLA SE LO STATUS è TRUE
                    if(data['status'] == true){
                      // SALVA I DATI NEL LOCALSTORAGE
                      Future<void> saveToLocalStorage() async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('username', username);
                        await prefs.setString('password', password);
                      }

                      Modals().showMessage(context, "loggato", "congratulazioni ${data['user']['name']} ${data['user']['surname']} ti sei loggato con successo");
                    }
                
                    
                    //Navigator.pop(context);
                    
                  }else{
                    Modals().showMessage(context, "Errore", "non ti sei loggato");
                  }
                    return;
                }, 
                child: const Text("Login", style: TextStyle(color: Colors.white))
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: CheckboxListTile(
                    value: rememberMe, 
                    onChanged: (bool? newValue){
                      if(mounted){
                        setState(() {
                          rememberMe = newValue!;
                        });
                      }
                    },
                    title: const Text("Ricordami"),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

}
