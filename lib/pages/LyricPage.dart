import 'package:flutter/material.dart';

class LirikPage extends StatelessWidget {
  const LirikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lirik Chempang")),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "bilangan koordinasi bentuk molekul\nnilainya dua hingga tujuh\nBK dua bentuknya linear\nrumus molekul AX2\n\nBK tiga segitiga planar\nrumus molekulnya AX3\nada lagi, bentuk huruf V\nrumus molekul AX2E\n\nmari bernyanyi\nlagu ini\nuntuk mengisi\nhati yang sunyi(4x)\n\nBK empat (ada empat bentuk juga)\nAX4 untuk tetrahedral\nAX3E trigonal piramidal\nAX2E2 huruf V AXE3 linear\n\nBK lima ada empat bentuk\ntrigonal bipiramidal AX5\nseesaw AX4E, T bengkok AX3E2\nlagi lagi linear AX2E3\n\nmari bernyanyi\nlagu ini\nuntuk mengisi\nhati yang sunyi(2x)\n\nBK enam ada tiga bentuk\npertama oktahedral rumusnyaAX6\npiramida alas bujursangkar terdistorsi\nrumus molekulnya AX5E\n\nketiga ada bentuk bujursangkar\nAX4E2 itu rumusnya\nBK tujuh adalah yang terakhir\npentagonal bipiramidal AX7\n\nmari bernyanyi\nlagu ini\nuntuk mengisi\nhati yang sunyi(2x)\n\n",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )));
  }
}
