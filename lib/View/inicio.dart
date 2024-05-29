import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

void main() {
  runApp(Inicio());
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Palette Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorAnalyzer(),
    );
  }
}

class ColorAnalyzer extends StatefulWidget {
  @override
  _ColorAnalyzerState createState() => _ColorAnalyzerState();
}

class _ColorAnalyzerState extends State<ColorAnalyzer> {
  File? _image; // Aquí se inicializa con null
  PaletteGenerator? _paletteGenerator;
  Color? _selectedColor;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _generatePalette();
    }
  }

  Future<void> _generatePalette() async {
    if (_image != null) {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(FileImage(_image!));
      setState(() {
        _paletteGenerator = paletteGenerator;
      });
    }
  }

  void _showColorDialog(Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Color seleccionado'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Valor hexadecimal: ${color.value.toRadixString(16)}'),
                SizedBox(height: 10),
                Container(
                  color: color,
                  height: 50,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extractor de paleta en imagenes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _image != null
              ? Image.file(
                  _image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                )
              : Placeholder(
                  fallbackHeight: 200,
                  fallbackWidth: 200,
                ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _getImage(ImageSource.camera),
            child: Text('Capturar Imagen'),
          ),
          ElevatedButton(
            onPressed: () => _getImage(ImageSource.gallery),
            child: Text('Seleccionar de Galería'),
          ),
          SizedBox(height: 20),
          if (_paletteGenerator != null)
            Column(
              children: [
                Text(
                  'Colores Dominantes:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _paletteGenerator!.colors
                        .map(
                          (color) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = color;
                              });
                              _showColorDialog(color);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: 50,
                              height: 50,
                              color: color,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
