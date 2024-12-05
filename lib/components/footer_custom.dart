import 'package:flutter/material.dart';

class FooterCustom extends StatelessWidget {

  const FooterCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
        Container(
          height: 50,
          width: 200,
          color: Colors.red,
          child: const Column(
            
          ),
        )
    );
  }
}