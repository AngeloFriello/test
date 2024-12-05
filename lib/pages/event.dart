import 'dart:io';

import 'package:flutter/material.dart';

class Event extends StatefulWidget{

  const Event({super.key});

   @override
  EventState createState () => EventState();
}

class EventState extends State<Event> {



  void initState() { // Punto di partenza
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          width: 400,
          height: 400,
          color: const Color.fromARGB(255, 106, 92, 91),
          child: const Column(
            children: [
              Text('capocchia')
            ],
          ),
        ),
      ),
    );
  }
}
