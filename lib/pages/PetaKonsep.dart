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
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: PhotoView(
                imageProvider: AssetImage("assets/Peta Konsep/petakonsep.png"),
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage("assets/Peta Konsep/petakonsep.png"),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
