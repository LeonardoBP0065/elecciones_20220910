import 'package:flutter/material.dart';
import 'registrar_evento_page.dart'; // Importamos la página de registro para acceder a la lista de eventos

class ListaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Eventos'),
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          final evento = eventos[index];
          return ListTile(
            title: Text(evento.titulo),
            onTap: () {
              _mostrarDetallesEvento(context, evento);
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            _limpiarListaEventos(context);
          },
          child: Text('Borrado de emergencia'),
        ),
      ),
    );
  }

  void _mostrarDetallesEvento(BuildContext context, Evento evento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(evento.titulo),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: ${evento.fecha}'),
                SizedBox(height: 10),
                Text('Descripción: ${evento.descripcion}'),
                SizedBox(height: 10),
                if (evento.imagen != null) Image.file(evento.imagen!),
                if (evento.audioPath != null) Text('Audio: ${evento.audioPath}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _limpiarListaEventos(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('¿Estás seguro de que deseas borrar todos los eventos?'),
          actions: [
            TextButton(
              onPressed: () {
                eventos.clear();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Se borraron todos los eventos.'),
                  ),
                );
              },
              child: Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
