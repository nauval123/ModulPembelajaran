import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/pages/InputNamePage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  List<String> description = [
    "Modul ini disusun untuk peserta didik SMA sederajat kelas 10 jurusan MIPA atau yang sedang mengambil mata pelajaran lintas minat kimia",
    "Materi yang ada dalam modul ini adalah bentuk molekul, di mana  akan dipelajari teori VSEPR, teori domain elektron, serta menggambarkan bentuk  dari suatu molekul sederhana.",
    "Pahami secara berurutan mulai dari peta konsep, tujuan pembelajaran, materi bentuk molekul, kerjakan latihan soal hingga uji kompetensi di akhir pembelajaran",
    "Fitur Augmented Reality (AR) & bentuk 3D molekul yang dapat kalian gunakan dalam modul ini",
  ];
  int index = 0;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        // changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/onboardingImage/first.jpg",
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/onboardingImage/second.jpg",
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/onboardingImage/third.jpg",
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/onboardingImage/fourth.jpg",
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    description[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index != 0
                      ? InkWell(
                          onTap: () => beforePage(),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height / 15,
                            child: Center(
                              child: Text(
                                "Selanjutnya",
                                style: TextStyle(
                                    fontFamily: "QuickSand",
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                  InkWell(
                    onTap: () => nextPage(),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: Center(
                        child: Text(
                          "Selanjutnya",
                          style: TextStyle(
                              fontFamily: "QuickSand",
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    pageController.animateToPage(
        index <= description.length - 1 ? index + 1 : index + 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
    if (index <= description.length - 2) {
      setState(() {
        index = index + 1;
        opacity = opacity == 0 ? 1 : 0;
      });
      changeOpacity();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => InputName(),
        ),
      );
    }
  }

  ///Method beforePage
  ///Digunakan untuk mengurangi  nilai index (index - 1)
  ///memindahkan tampilan pageview ke tampilan sebelumnya
  ///Digunakan pula untuk animasi fade in (dengan dilakukan pengecekan opacity)

  void beforePage() {
    pageController.animateToPage(index != 0 ? index - 1 : index + 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
    setState(() {
      index = index - 1;
      opacity = opacity == 0 ? 1 : 0;
    });
    changeOpacity();
  }
}
