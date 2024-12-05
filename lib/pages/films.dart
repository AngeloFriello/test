import 'package:flutter/material.dart';
import 'package:test/api/films_api.dart';
import 'package:test/components/film_card.dart';

class Films extends StatefulWidget{

  const Films({super.key});

  @override
  FilmsState createState () => FilmsState();

}

class FilmsState extends State<Films>{

  bool loading        = true;
  List<dynamic> films = [];

  @override
  void initState() { // Punto di partenza

    WidgetsBinding.instance.addPostFrameCallback((timestamp) async { // Ha disegnato il primo frame!
      films = await FilmsApi().fetchFilms();
      if(mounted){
        setState(() {
          loading = false;
        });
      }
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: 
          loading ? 
            const Center(
              child: CircularProgressIndicator(),
            )
          :
            ListView.builder( // cicla tutti gli elementi e renderizza solo gli elementi a video
              itemCount: films.length,
              itemBuilder: (context, index){
                return FilmCard(
                  key           : Key("FILM_$index"),
                  title         : films[index]['title'], 
                  description   : films[index]['description_extended'],
                  background    : films[index]['cover']
                );
              }
            )
      ),
      
      
    );
  }

}