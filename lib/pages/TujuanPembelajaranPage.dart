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
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "assets/Tujuan Pembelajaran/TUJUANPEMBELAJARAN.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
