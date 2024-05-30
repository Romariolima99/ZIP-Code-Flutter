import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        title: const Text('Consulta de Cep'),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(50),
        child: const Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: "Digite seu cep",
              ),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
