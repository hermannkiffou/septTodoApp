import 'package:flutter/material.dart';
import 'package:mytodo/homePage.dart';
import 'inscription.dart';
import 'todo.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("CONNEXION"),
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
              

               ElevatedButton(
                onPressed: (){
                   Navigator.push(
                    context, 
                      MaterialPageRoute(
                     builder: (context) =>  Todo(),
                    ),
                   );
                  }, 
                child:Text("CONNEXION"),
              ),

              ElevatedButton(
                onPressed: (){
                   Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Inscription(),
                      ),
              );
                  }, 
                child:Text("JE N'AI PAS DE COMPTE !"),
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