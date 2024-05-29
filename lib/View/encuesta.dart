import 'package:flutter/material.dart';

void main() {
  runApp(Encuesta());
}

class Encuesta extends StatelessWidget {
  const Encuesta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonalityTestScreen(),
    );
  }
}

class PersonalityTestScreen extends StatefulWidget {
  @override
  _PersonalityTestScreenState createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen> {
  int _currentQuestionIndex = 0;
  Map<int, int> _selectedAnswers = {};

  List<Map<String, dynamic>> _questions = [
    {
      'question': '¿Cuál es tu estación del año favorita?',
      'options': [
        {
          'text': 'Primavera',
          'colors': [Colors.greenAccent, Colors.lightGreen, Colors.yellowAccent, Colors.pinkAccent, Colors.white],
        },
        {
          'text': 'Verano',
          'colors': [Colors.yellow, Colors.orangeAccent, Colors.red, Colors.deepOrange, Colors.lightBlueAccent],
        },
        {
          'text': 'Otoño',
          'colors': [Colors.orange, Colors.brown, Colors.deepOrange, Colors.amber, Colors.redAccent],
        },
        {
          'text': 'Invierno',
          'colors': [Colors.blue, Colors.lightBlueAccent, Colors.white, Colors.grey, Colors.indigo],
        },
      ],
    },
    {
      'question': '¿Qué tipo de música prefieres?',
      'options': [
        {
          'text': 'Rock',
          'colors': [Colors.red, Colors.black, Colors.grey, Colors.white, Colors.blueGrey],
        },
        {
          'text': 'Pop',
          'colors': [Colors.pink, Colors.purple, Colors.blue, Colors.orange, Colors.yellow],
        },
        {
          'text': 'Electrónica',
          'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.purpleAccent, Colors.pinkAccent],
        },
        {
          'text': 'Hip-hop/Rap',
          'colors': [Colors.redAccent, Colors.deepOrangeAccent, Colors.orangeAccent, Colors.amber, Colors.yellowAccent],
        },
      ],
    },
    {
    'question': '¿Prefieres pasar tiempo al aire libre o en interiores?',
    'options': [
      {
        'text': 'Al aire libre',
        'colors': [Colors.green, Colors.lightGreen, Colors.yellowAccent, Colors.pinkAccent, Colors.white],
      },
      {
        'text': 'En interiores',
        'colors': [Colors.blue, Colors.lightBlueAccent, Colors.white, Colors.grey, Colors.indigo],
      },
    ],
  },
  {
    'question': '¿Cuál es tu color favorito?',
    'options': [
      {
        'text': 'Rojo',
        'colors': [Colors.red, Colors.orange, Colors.yellow, Colors.pink, Colors.white],
      },
      {
        'text': 'Azul',
        'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
      },
      {
        'text': 'Verde',
        'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
      },
      {
        'text': 'Amarillo',
        'colors': [Colors.yellow, Colors.amber, Colors.orange, Colors.lightGreenAccent, Colors.white],
      },
      {
        'text': 'Morado',
        'colors': [Colors.purple, Colors.deepPurpleAccent, Colors.pinkAccent, Colors.indigo, Colors.white],
      },
    ],
  },
  {
    'question': '¿Prefieres trabajar en equipo o de forma independiente?',
    'options': [
      {
        'text': 'Trabajar en equipo',
        'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.green, Colors.white],
      },
      {
        'text': 'De forma independiente',
        'colors': [Colors.red, Colors.orange, Colors.yellow, Colors.brown, Colors.white],
      },
    ],
  },
  {
  'question': '¿Cuál es tu animal favorito?',
  'options': [
    {
      'text': 'Perro',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Gato',
      'colors': [Colors.grey, Colors.blueGrey, Colors.white, Colors.black, Colors.pinkAccent],
    },
    {
      'text': 'Loro',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.yellow, Colors.blue, Colors.red],
    },
    {
      'text': 'Caballo',
      'colors': [Colors.brown, Colors.black, Colors.white, Colors.grey, Colors.amber],
    },
    {
      'text': 'Tigre',
      'colors': [Colors.orange, Colors.black, Colors.white, Colors.grey, Colors.amber],
    },
  ],
},

{
  'question': '¿Prefieres café o té?',
  'options': [
    {
      'text': 'Café',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Té',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.yellow, Colors.blue, Colors.red],
    },
  ],
},
{
  'question': '¿Cuál es tu película favorita?',
  'options': [
    {
      'text': 'Drama',
      'colors': [Colors.blueGrey, Colors.black, Colors.grey, Colors.white, Colors.pinkAccent],
    },
    {
      'text': 'Comedia',
      'colors': [Colors.yellow, Colors.amber, Colors.orange, Colors.brown, Colors.white],
    },
    {
      'text': 'Acción',
      'colors': [Colors.red, Colors.black, Colors.white, Colors.grey, Colors.amber],
    },
    {
      'text': 'Ciencia ficción',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.white, Colors.grey, Colors.amber],
    },
  ],
},
{
  'question': '¿Prefieres leer libros físicos o digitales?',
  'options': [
    {
      'text': 'Libros físicos',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Libros digitales',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.white, Colors.grey, Colors.amber],
    },
  ],
},
{
  'question': '¿Prefieres practicar deportes individuales o en equipo?',
  'options': [
    {
      'text': 'Deportes individuales',
      'colors': [Colors.blueGrey, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Deportes en equipo',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.green, Colors.white],
    },
  ],
},
{
  'question': '¿Qué actividad prefieres para relajarte?',
  'options': [
    {
      'text': 'Meditar',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.green, Colors.white],
    },
    {
      'text': 'Ver películas/series',
      'colors': [Colors.blueGrey, Colors.black, Colors.grey, Colors.white, Colors.pinkAccent],
    },
    {
      'text': 'Hacer ejercicio',
      'colors': [Colors.red, Colors.black, Colors.white, Colors.grey, Colors.amber],
    },
    {
      'text': 'Escuchar música',
      'colors': [Colors.purple, Colors.deepPurpleAccent, Colors.pinkAccent, Colors.indigo, Colors.white],
    },
  ],
},
{
  'question': '¿Qué tipo de clima prefieres?',
  'options': [
    {
      'text': 'Cálido',
      'colors': [Colors.yellow, Colors.orangeAccent, Colors.red, Colors.deepOrange, Colors.lightBlueAccent],
    },
    {
      'text': 'Frío',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.white, Colors.grey, Colors.indigo],
    },
    {
      'text': 'Templado',
      'colors': [Colors.greenAccent, Colors.lightGreen, Colors.yellowAccent, Colors.pinkAccent, Colors.white],
    },
  ],
},
{
  'question': '¿Cuál es tu comida favorita?',
  'options': [
    {
      'text': 'Pizza',
      'colors': [Colors.red, Colors.orange, Colors.yellow, Colors.pink, Colors.white],
    },
    {
      'text': 'Sushi',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Hamburguesa',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Ensalada',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
    },
  ],
},
{
  'question': '¿Prefieres la playa o la montaña para unas vacaciones?',
  'options': [
    {
      'text': 'Playa',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Montaña',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
    },
  ],
},
{
  'question': '¿Qué actividad disfrutas más en tu tiempo libre?',
  'options': [
    {
      'text': 'Leer',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Cocinar',
      'colors': [Colors.red, Colors.orange, Colors.yellow, Colors.pink, Colors.white],
    },
    {
      'text': 'Pintar/Dibujar',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Jugar videojuegos',
      'colors': [Colors.blueGrey, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
  ],
},
{
  'question': '¿Cuál es tu actividad deportiva favorita?',
  'options': [
    {
      'text': 'Fútbol',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.green, Colors.white],
    },
    {
      'text': 'Baloncesto',
      'colors': [Colors.orange, Colors.deepOrangeAccent, Colors.red, Colors.amber, Colors.yellow],
    },
    {
      'text': 'Natación',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Correr',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
    },
  ],
},
{
  'question': '¿Cuál es tu pasatiempo favorito?',
  'options': [
    {
      'text': 'Manualidades',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
    {
      'text': 'Jardinería',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
    },
    {
      'text': 'Bailar',
      'colors': [Colors.pink, Colors.purple, Colors.blue, Colors.orange, Colors.yellow],
    },
    {
      'text': 'Viajar',
      'colors': [Colors.blueGrey, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
  ],
},
{
  'question': '¿Cuál es tu bebida favorita?',
  'options': [
    {
      'text': 'Cerveza',
      'colors': [Colors.amber, Colors.brown, Colors.black, Colors.grey, Colors.white],
    },
    {
      'text': 'Vino',
      'colors': [Colors.red, Colors.purple, Colors.pink, Colors.deepPurpleAccent, Colors.white],
    },
    {
      'text': 'Refresco',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Café',
      'colors': [Colors.brown, Colors.black, Colors.grey, Colors.white, Colors.amber],
    },
  ],
},
{
  'question': '¿Qué lugar prefieres para unas vacaciones?',
  'options': [
    {
      'text': 'Ciudad',
      'colors': [Colors.grey, Colors.blueGrey, Colors.black, Colors.white, Colors.amber],
    },
    {
      'text': 'Playa',
      'colors': [Colors.blue, Colors.lightBlueAccent, Colors.tealAccent, Colors.indigo, Colors.cyan],
    },
    {
      'text': 'Montaña',
      'colors': [Colors.green, Colors.lightGreenAccent, Colors.lime, Colors.teal, Colors.white],
    },
  ],
},


  
    // Agrega más preguntas aquí
  ];

  void _selectAnswer(int optionIndex) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = optionIndex;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test de Personalidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Center(
            child: _currentQuestionIndex < _questions.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      Text(
                        'Pregunta ${_currentQuestionIndex + 1}',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        _questions[_currentQuestionIndex]['question'],
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 20.0),
                      ...(_questions[_currentQuestionIndex]['options'] as List<dynamic>).asMap().entries.map((entry) {
                        final optionIndex = entry.key;
                        final option = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: RadioListTile<int>(
                            title: Text(option['text']),
                            value: optionIndex,
                            groupValue: _selectedAnswers[_currentQuestionIndex],
                            onChanged: _selectedAnswers[_currentQuestionIndex] != null ? null : (value) {
                              _selectAnswer(value!);
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Paleta de colores seleccionada'),
                                    content: SingleChildScrollView(
                                      child: Wrap(
                                        children: (option['colors'] as List<Color>).map((color) {
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            color: color,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    actions: <Widget>[
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
                            },
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 290.0),
                    ],
                  )
                : null,
          ),
        ),
      ),
      floatingActionButton: _currentQuestionIndex < _questions.length - 1
          ? FloatingActionButton(
              onPressed: _nextQuestion,
              child: Icon(Icons.arrow_forward, color: Colors.white,),
              backgroundColor: Colors.orangeAccent,
            )
          : null,
    );
  }

}
