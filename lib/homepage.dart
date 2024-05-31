import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController txtcep = TextEditingController();
  String resultado = "Seu endereço";

void buscarcep() async {
  String cep = txtcep.text;
  String url = "https://viacep.com.br/ws/$cep/json/";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> dados = json.decode(response.body);
    String formattedData = '';

    // Iterar sobre o mapa de dados e construir uma string formatada
    dados.forEach((key, value) {
      formattedData += '$key: $value\n'; // Adicionar cada chave e valor em uma linha separada
    });

    setState(() {
      resultado = formattedData; // Armazenar a string formatada na variável resultado
    });
  } else {
    setState(() {
      resultado = 'Erro ao buscar o endereço';
    });
  }
}



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
              child: Image.asset("assets/Screenshot_1.png"), // Caminho corrigido
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtcep,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite seu cep",
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: buscarcep, // Ação quando o botão for pressionado
              child: const Text(
                'Consultar',
              ),
            ),
            const SizedBox(height: 15),
            Text(
              resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
