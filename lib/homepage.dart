import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert";



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consultar Cep',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child:
                  Image.asset("assets/Screenshot_1.png"), // Caminho corrigido
            ),
            const SizedBox(height: 20),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite seu cep",
              ),
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação quando o botão for pressionado
              },
              child: const Text(
                'Consultar',
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Resultado',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
