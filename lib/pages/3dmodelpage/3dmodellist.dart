import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class ModelList extends StatefulWidget {
  @override
  _ModelListState createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  int count = 0;
  late bool arstatus;
  bool guideStatus = true;
  late bool arcore;
  late List<Molecule> _listofmolecule;
  late Future _future;
  late List<Molecule> _list;

  Future makealist() async {
    var json = await DefaultAssetBundle.of(context)
        .loadString('assets/moleculemodel.json');
    setState(() {
      _listofmolecule = parsingData(json);
      _list = parsingData(json);
    });

    return _listofmolecule;
  }

  void checkar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    late bool ars = prefs.getBool('arstatus') ?? false;
    late bool arc = prefs.getBool('arcore') ?? false;
    print(ars);
    if (ars == true || arc == true) {
      setState(() {
        arstatus = ars;
        arcore = arc;
      });
    } else {
      //  var arstat =await ArCoreController.checkArCoreAvailability();
      //  var arinstalled = await ArCoreController.checkIsArCoreInstalled();
      var arstat = false;
      var arinstalled = false;
      prefs.setBool('arstatus', arstat);
      prefs.setBool('arcore', arinstalled);
      print("status ar nya adalah ?");
      print(arstat);
      print("arcore terinstall?");
      print(arinstalled);
      setState(() {
        arstatus = arstat;
        arcore = arinstalled;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkar();
    _future = makealist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Molekul'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _listofmolecule.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? _searchBar()
                    : _listmolecule(_listofmolecule, index - 1, arstatus);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue.shade300),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            fillColor: Colors.blue[100],
            hintText: 'Cari Model Atom...',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: _filter,
        ),
      ),
    );
  }

  Widget _listmolecule(
      List<Molecule> listofmolecule, int index, bool arstatus) {
    return InkWell(
      // onTap:(){arstatus==true && arcore==true?
      // Navigator.of(context).pushNamed('/ar',arguments: listofmolecule[index])
      // :Navigator.of(context).pushNamed("/moleculemodel",arguments: listofmolecule[index]);},
      child: Card(
        child: ListTile(
          title: Text(listofmolecule[index].moleculename),
          leading: Text(listofmolecule[index].id.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/ar', arguments: listofmolecule[index]);
                  },
                  icon: Icon(Icons.view_in_ar)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/moleculemodel",
                        arguments: listofmolecule[index]);
                  },
                  icon: Icon(Icons.view_comfy_rounded)),
            ],
          ),
        ),
      ),
    );
  }

  void _filter(String word) {
    List<Molecule> results = [];
    if (word.isEmpty) {
      results = _list;
      setState(() {
        print(results.toString());
        _listofmolecule = results;
      });
    } else {
      results = _listofmolecule
          .where((mol) =>
              mol.moleculename.toLowerCase().contains(word.toLowerCase()))
          .toList();
      setState(() {
        print(results.toString());
        _listofmolecule = results;
      });
    }
  }
}
