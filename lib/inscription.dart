import 'package:flutter/material.dart';
import 'package:mytodo/homePage.dart';
import 'connexion.dart';
import 'todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  TextEditingController _name = TextEditingController();
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("INSCRIPTION"),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                labelText: "Nom",
              ),
              ),

            TextFormField(
              controller: _login,
              decoration: InputDecoration(
                labelText: "login",
              ),
              ),

                          TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
              ),
              ),

                                        TextFormField(
              controller: _confirmPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmation de mot de passe",
                
              ),
              ),
              

               ElevatedButton(
                onPressed: (){
                   Navigator.push(
                    context, 
                      MaterialPageRoute(
                     builder: (context) =>  Todo(),
                    ),
                   );
                  }, 
                child:Text("INCRIPTION"),
              ),

              ElevatedButton(
                onPressed: (){
                   Navigator.push(
                    context, 
                      MaterialPageRoute(
                     builder: (context) =>  Connexion(),
                    ),
              );
                  }, 
                child:Text("J'AI DEJA UN COMPTE"),
              ),

              ElevatedButton(
                onPressed: (){
                   Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => HomePage(),
                ),
              );
                  }, 
                child:Text("RETOUR A L'ACCUEIL !"),
              ),
          ],
        ),
        ),
        );
  }
}