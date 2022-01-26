import 'package:flutter/material.dart';

class Materi extends StatefulWidget {
  Materi({Key? key}) : super(key: key);

  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: 21,
            itemBuilder: (context, index) {
              return Image.asset(
                "assets/Materi/" + (index + 1).toString() + ".png",
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      ),
    );
  }
}
