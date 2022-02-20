import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizBegin extends StatelessWidget {
  const QuizBegin({Key? key}) : super(key: key);
  static const String _url =
      'https://docs.google.com/forms/d/e/1FAIpQLSccoqpiQA0ZHHQkDTaHV7ZkhXvtg4S4JR3DI24zJs2N4IXBpw/viewform';
  static const String _urlNilai =
      "https://docs.google.com/spreadsheets/d/18IDsz5WKU1JeIlchiJ0troRyqZDPxKxsJxjerWzcrlk/edit?usp=sharing";
  static const String _urlPembahasan =
      "https://drive.google.com/file/d/15cWSPZQwR1hIqdDXlS5ZFXQoMuq7wGcr/view?usp=sharing";

  void _launchURL() async {
    try {
      await launch(_url);
    } catch (e) {
      print(e);
      print('Could not launch $_url');
    }
  }

  void _launchURLNilai() async {
    try {
      await launch(_urlNilai);
    } catch (e) {
      print(e);
      print('Could not launch $_urlNilai');
    }
  }

  void _launchURLPembahasan() async {
    try {
      await launch(_urlPembahasan);
    } catch (e) {
      print(e);
      print('Could not launch $_urlPembahasan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 3
                          : 5),
                  height: MediaQuery.of(context).size.height /
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5
                          : 3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/logo/icons/QUIZ.png"))),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Quiz",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Berikut untuk pengecekan soal,pembahasan soal dan pengecekan nilai murid.Pengembang akan mengupdate nilai secara berkala setiap hari selasa.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " CP: wa.me/6283800667565 (Admin Chempang)",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      "Mulai Uji Komptensi",
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  onTap: () async {
                    // Navigator.of(context).pushReplacementNamed('/QuizStart');
                    _launchURL();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      "Pembahasan Soal",
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  onTap: () async {
                    // Navigator.of(context).pushReplacementNamed('/QuizStart');
                    _launchURLPembahasan();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      "Cek Nilai Murid",
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  onTap: () async {
                    // Navigator.of(context).pushReplacementNamed('/QuizStart');
                    _launchURLNilai();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
