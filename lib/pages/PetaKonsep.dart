import 'package:flutter/material.dart';

class PetaKonsepPage extends StatelessWidget {
  const PetaKonsepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Peta Konsep",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/Peta Konsep/petakonsep.png"),
            ),
          ),
        ),
      ),
    );
  }
}
