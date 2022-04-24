import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

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
        body: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Expanded(
              child: PhotoView(
                imageProvider: AssetImage("assets/Peta Konsep/petakonsep.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
