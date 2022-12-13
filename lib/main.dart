import 'package:flutter/material.dart';
import 'login.dart';
 
 
 void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Tela1(),
    );
  }
}


class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Native Talk"),
      ),
      body: Stack(       
        children: [
          MyGridView(),

          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width*0.8,
            child: Container(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyLogin()));
                },
                child: Icon(Icons.login)
              ),
            ),
          ),

          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width*0.6,
            child: Container(
              child: FloatingActionButton(
                onPressed: () {
                  
                },
                child: Icon(Icons.add_link)
              ),
            ),
          ),
        ],
        
      )
    );
  }
}

 
class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
              Container(
                width: double.infinity,
                child: Image.asset("assets/images/batepapo.jpeg"),
              ),
        
              Container(
                alignment: Alignment.center, 
                width: 30,
                  child:Text("NOVA MANEIRA DE CONHECER E CONVERSAR COM OS NATIVOS"),
              ),

              Container(
                alignment: Alignment.center, 
                width: 30,
                  child:Text("FAZER NOVAS AMIZADES, APRENDER NOVOS IDIOMAS DA MANEIRA MAIS DIVERTIDA"),
              ),

              Container( 
                width: double.infinity,
                child: Image.asset("assets/images/virtual.jpeg"),
              ),

              Container( 
                width: double.infinity,
                child: Image.asset("assets/images/nativetalk.jpeg"),
              ),
              
              Container(
                  alignment: Alignment.center, 
                  child:Text("VENHA CONHECER O NOSSO SITE"),
              ), 
              
           
            ],
          );
  }
}