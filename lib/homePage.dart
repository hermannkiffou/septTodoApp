import 'package:flutter/material.dart';
import 'package:mytodo/inscription.dart';
import 'connexion.dart';
import 'inscription.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("BIENVENUE SUR VOTRE TODO APP"),
          ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Connexion(),
                ),
              );
          },
          child: Text("Connexion"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Inscription(),
                  ),
                );
            },
              child: Text("Creer un compte"),
              ),
          ),
          ],
        ),
    );
  }
}