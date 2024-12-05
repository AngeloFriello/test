import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget{

  final String baseUrl = "https://webservice.sballando.it/storage/";
  String title;
  String description;
  String background;

  FilmCard({required this.title, required this.description, required this.background, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.pushNamed(context, '/event');
      },
      child:Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Material(
          elevation: 2.00,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              children: [

                Positioned(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network("$baseUrl$background", fit: BoxFit.cover)
                  )
                ),

                Positioned(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: const Color.fromARGB(125, 0, 0, 0),
                  )
                ),

                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

}