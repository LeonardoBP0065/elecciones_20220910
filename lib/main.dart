import 'package:flutter/material.dart';
import 'registrar_evento_page.dart';
import 'lista_page.dart';
import 'acerca_de_page.dart';

// Realizado por Leonardo Pérez, matrícula 2022-0910
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Eventos - PRM',
      theme: ThemeData(
        primaryColor: Colors.blue, // Color azul como color principal
        scaffoldBackgroundColor: Colors.white, // Fondo blanco para todas las páginas
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestor de Eventos - PRM',
          style: TextStyle(color: Colors.white), // Color blanco para el título
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue, // Color azul para el encabezado
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Gestor de Eventos - PRM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200, // Espacio para el logo del partido
            child: Center(
              child: Image.asset(
                'lib/assets/logo.png', // Ruta de la imagen del logo
                width: 200, // Ancho del logo
                height: 200, // Alto del logo
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrarEventoPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color azul para el botón
                      foregroundColor: Colors.white, // Color blanco para el texto
                    ),
                    child: Text(
                      'Agregar Evento',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListaPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color azul para el botón
                      foregroundColor: Colors.white, // Color blanco para el texto
                    ),
                    child: Text(
                      'Lista de Eventos',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AcercaDePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color azul para el botón
                      foregroundColor: Colors.white, // Color blanco para el texto
                    ),
                    child: Text(
                      'Acerca De',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
