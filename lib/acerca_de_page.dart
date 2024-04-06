import 'package:flutter/material.dart';

class AcercaDePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca De'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/foto.png', // Ruta de la imagen
              width: 150, // Ancho de la imagen
              height: 150, // Alto de la imagen
            ),
            SizedBox(height: 20),
            Text(
              'Luis Rodolfo Abinader Corona', // Nombre del delegado
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Delegado del Partido Revolucionario Moderno', // Título o cargo del delegado
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Construyendo un futuro de progreso y democracia, donde cada voz cuenta y cada voto importa.', // Frase relacionada
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
