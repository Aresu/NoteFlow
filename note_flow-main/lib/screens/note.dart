import 'package:flutter/material.dart';
import '../helper/functionMethodClass.dart';

class Note_Screen extends StatefulWidget {
  const Note_Screen({super.key});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<Note_Screen> {
  String appBarStatus = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStatus == '0' ? const AppBarText1() : const AppBarText2(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                autofocus: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Untitled',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                maxLines: null,
                style:
                    const TextStyle(color: Color.fromARGB(255, 223, 223, 223)),
                decoration: const InputDecoration(
                  hintText: 'Tap here to continue...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onTap: () {
                  setState(() {
                    appBarStatus = '1';
                  });
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
    );
  }
}