import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';

class ModelList extends StatefulWidget {
  @override
  _ModelListState createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    //  if (listofmolecule == null) {
    //   listofmolecule = <Molecule>[];
    // }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Flutter Model Viewer Demo"),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.black,
      // ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/moleculemodel.json'),
        builder: (context,AsyncSnapshot<dynamic> snapshot){
          final List<Molecule> listofmolecule = parsingData(snapshot.data);
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: listofmolecule.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap:(){ Navigator.of(context).pushNamed("/moleculemodel",arguments: listofmolecule[index]);},
                  child: Card(
                    child: ListTile(
                      title: Text(listofmolecule[index].moleculename),
                      leading: Text(listofmolecule[index].id.toString()),
                    ),
                  ),
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