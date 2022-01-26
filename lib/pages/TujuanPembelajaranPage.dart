import 'package:flutter/material.dart';

class TujuanPembelajaranPage extends StatelessWidget {
  const TujuanPembelajaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tujuan Pembelajaran",
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
                image: AssetImage(
                    "assets/Tujuan Pembelajaran/Tujuan Pembelajaran.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
