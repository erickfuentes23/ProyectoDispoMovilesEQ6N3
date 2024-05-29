import 'package:app_flutter/View/model.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class Asesoramiento extends StatefulWidget {
  const Asesoramiento({super.key});

  @override
  State<Asesoramiento> createState() => _AsesoramientoState();
}

class _AsesoramientoState extends State<Asesoramiento> {
  TextEditingController promprController = TextEditingController();
  static const apikey = "AIzaSyApA-1EBGJQqR0oqoPm4pMOHAGzEWv8fVM";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);

  final List<ModelMessage> prompt = [];

  Future<void> sendMessage() async {
    final message = promprController.text;
    setState(() {
      promprController.clear();
      prompt.add(
        ModelMessage(
          isPrompt: true,
          message: message,
          time: DateTime.now(),
        ),
      );
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      prompt.add(
        ModelMessage(
          isPrompt: false,
          message: response.text ?? "",
          time: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Asesoramiento con IA"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: prompt.length,
                    itemBuilder: (context, index) {
                      final message = prompt[index];
                      return UserPrompt(
                        isPrompt: message.isPrompt,
                        message: message.message,
                        date: DateFormat('hh:mm a').format(
                          message.time,
                        ),
                      );
                    })),
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    flex: 17,
                    child: TextField(
                      controller: promprController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "¿Necesitas ayuda?"),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container UserPrompt(
      {required bool isPrompt, required String message, required String date}) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 12).copyWith(left: isPrompt ?80:12, right: isPrompt ? 12:80),
        decoration: BoxDecoration(
          color: isPrompt ? Colors.orangeAccent: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontWeight: isPrompt ? FontWeight.normal : FontWeight.normal,
                fontSize: 14,
                color: isPrompt ? Colors.white : Colors.black,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: isPrompt ? Colors.white : Colors.black,
              ),
            )
          ],
        ));
  }
}
