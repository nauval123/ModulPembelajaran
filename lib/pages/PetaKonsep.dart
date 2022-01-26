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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/Peta Konsep/petakonsep.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
