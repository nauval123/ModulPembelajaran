import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/widgetcustom.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:modul_pembelajaran_kimia/pages/BabPage.dart';
// import 'package:modul_pembelajaran_kimia/pages/MateriPage.dart';

// import 'QuizPage.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String _usernamedata;
  late AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool _button = false;

  // int _indexnavbar = 0;
  // late  var _halamannavbar = [
  //   DashboardBody(),
  //   Materi(),
  //   Quiz(),
  //   Bab(),
  // ];

  Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String nama = prefs.getString('username') ?? "Anonymous";
    return nama;
  }

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.open(
      Audio(
        'assets/bgm.mp3',
        metas: Metas(
          id: 'Alternative',
          title: 'Bentuk Molekul',
          artist: 'Chempang',
          album: 'Chempang',
        ),
      ),
      showNotification: true,
      notificationSettings: NotificationSettings(stopEnabled: true),
      // loopMode: LoopMode.single,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUsername(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _usernamedata = snapshot.data.toString();
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Center(
                  child: _button == true
                      ? Icon(Icons.play_arrow)
                      : Icon(Icons.pause),
                ),
                onPressed: () {
                  _assetsAudioPlayer.playOrPause();
                  setState(() {
                    _button = _assetsAudioPlayer.isPlaying.value;
                  });
                },
              ),
              // appBar: AppBar(actions: [IconButton(
              //   onPressed: (){Navigator.of(context).pushNamed('/ar');}, icon: Icon(Icons.ac_unit))],),
              extendBodyBehindAppBar: true,
              body: DashboardBody(_usernamedata),
              backgroundColor: Colors.blue[300],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _assetsAudioPlayer.showNotification = false;
    _assetsAudioPlayer.dispose();
  }
}

class DashboardBody extends StatelessWidget {
  late final String _usernamedata;

  DashboardBody(
    this._usernamedata,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FittedBox(
                    child: Text(
                  "Halo  " +
                      (this._usernamedata.isNotEmpty
                          ? this._usernamedata
                          : "anonymous"),
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomCardWidget('Tujuan Pembelajaran', 'Ketahui Tujuan Belajar'),
              CustomCardWidget('Peta Konsep', 'Yuk Lihat Konsepnya'),
              // SizedBox(height: MediaQuery.of(context).size.height/60,),
              CustomCardWidget('Materi', 'Mari Kita Membaca'),
              // SizedBox(height: MediaQuery.of(context).size.height/60,),
              CustomCardWidget('Kuis', 'Uji Pengetahuanmu'),
              // SizedBox(height: MediaQuery.of(context).size.height/60,),
              CustomCardWidget(
                  'AR & Bentuk 3D molekul', 'Lihat bentuk suatu molekul'),
              CustomCardWidget('Lirik', 'Nyanyikan dan pahami lagunya'),
              // SizedBox(height: MediaQuery.of(context).size.height/60,),
              // CustomCardWidget('Daftar Pustaka'),
              // SizedBox(height: MediaQuery.of(context).size.height/50,),
              // CustomCardWidget('Settings'),
            ],
          ),
        ),
      ),
      // )
    );
  }
}
