import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/helpers/dbhelpers.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:model_viewer/model_viewer.dart';

class ModelList extends StatefulWidget {
  @override
  _ModelListState createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  late DbHelper _dbhelper =DbHelper();
  int count = 0;
  late List<Molecule> listofmolecule;


  @override
  void initState() {
    super.initState();
    getListOfMolecule();
    //  print(listofmolecule);
  }
   void getListOfMolecule()async{
     await _dbhelper.initDb();
    //  print(await _dbhelper.moleculemodel()); 
  }

  @override
  Widget build(BuildContext context) {
    //  if (listofmolecule == null) {
    //   listofmolecule = <Molecule>[];
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Model Viewer Demo"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: _dbhelper.moleculemodel(),
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var item = snapshot.data[index];
                return ListTile(
                  title: Text(item.moleculename),
                  leading: Text(item.id.toString()),
                );
              },
            );
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
        ),
      // body: ModelViewer(
      //   backgroundColor: Colors.teal[50],
      //   src: 'assets/molecule/co2.glb',
      //   alt: "A 3D model of an table soccer",
      //   autoPlay: true,
      //   autoRotate: false,
      //   cameraControls: true,
      // ),
    );
  }
}