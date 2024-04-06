import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class Evento {
  String titulo;
  String fecha;
  String descripcion;
  File? imagen;
  String? audioPath;

  Evento({
    required this.titulo,
    required this.fecha,
    required this.descripcion,
    this.imagen,
    this.audioPath,
  });
}

class RegistrarEventoPage extends StatefulWidget {
  @override
  _RegistrarEventoPageState createState() => _RegistrarEventoPageState();
}

class _RegistrarEventoPageState extends State<RegistrarEventoPage> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();
  File? _imagen;
  String? _audioPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Evento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _fechaController,
              decoration: InputDecoration(
                labelText: 'Fecha',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            SizedBox(height: 20),
            _buildImagePicker(),
            SizedBox(height: 20),
            _buildAudioPicker(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _guardarEvento();
              },
              child: Text('Guardar Evento'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seleccionar Foto:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        _imagen != null
            ? Image.file(
          _imagen!,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        )
            : ElevatedButton(
          onPressed: _seleccionarFoto,
          child: Text('Seleccionar desde Galería'),
        ),
      ],
    );
  }

  Future<void> _seleccionarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagen = File(pickedFile.path);
      });
    }
  }

  Widget _buildAudioPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grabar Audio:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        _audioPath != null
            ? Text('Audio seleccionado: $_audioPath')
            : ElevatedButton(
          onPressed: _grabarAudio,
          child: Text('Grabar Audio'),
        ),
      ],
    );
  }

  Future<void> _grabarAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowCompression: true,
    );
    if (result != null) {
      setState(() {
        _audioPath = result.files.single.path;
      });
    }
  }

  void _guardarEvento() {
    String titulo = _tituloController.text;
    String fecha = _fechaController.text;
    String descripcion = _descripcionController.text;

    // Creamos una instancia de Evento con los datos ingresados
    Evento evento = Evento(
      titulo: titulo,
      fecha: fecha,
      descripcion: descripcion,
      imagen: _imagen,
      audioPath: _audioPath,
    );

    // Añadimos el evento a la lista de eventos
    eventos.add(evento);

    // Limpiamos los campos después de guardar el evento
    _limpiarCampos();
  }

  void _limpiarCampos() {
    _tituloController.clear();
    _fechaController.clear();
    _descripcionController.clear();
    setState(() {
      _imagen = null;
      _audioPath = null;
    });
  }
}

// Lista global para almacenar eventos
List<Evento> eventos = [];

