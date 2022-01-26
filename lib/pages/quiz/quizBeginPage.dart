import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizBegin extends StatelessWidget {
  const QuizBegin({Key? key}) : super(key: key);
  static const String _url =
      'https://docs.google.com/forms/d/e/1FAIpQLSccoqpiQA0ZHHQkDTaHV7ZkhXvtg4S4JR3DI24zJs2N4IXBpw/viewform';

  void _launchURL() async {
    try {
      await launch(_url);
    } catch (e) {
      print(e);
      print('Could not launch $_url');
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
                          image: AssetImage("assets/logo/icons/Quiz.png"))),
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
                  "Selamat Kalian Menyelesaikan Pembelajaran Mandiri Materi Bentuk Molekul !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Untuk Menguji Pemahanmu,Yuk Coba Uji Kompetensi! \nUjian Ini Hanya Bisa Dilakukan Sekali Jadi Selesaikan Dengan Maksimal Ya!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  onTap: () async {
                    // Navigator.of(context).pushReplacementNamed('/QuizStart');
                    _launchURL();
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
