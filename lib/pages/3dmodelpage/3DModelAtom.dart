import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';

class ModelAtomPage extends StatelessWidget {
  const ModelAtomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final informationofmolecule = ModalRoute.of(context)!.settings.arguments as Molecule;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Model Atom 3D'),
          ),
            body: Stack(
              children: [
              ModelViewer(
                  arScale: "auto",
                  backgroundColor: Colors.teal[50],
                  src: 'assets/molecule/'+informationofmolecule.modelpath,
                  alt: informationofmolecule.moleculename,
                  cameraControls: true,
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.5,
                builder:  (BuildContext context,ScrollController scrollController){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      child: SingleChildScrollView(
                        controller:  scrollController,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20,bottom: 30),
                              height: 10,width: 150,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue[300],
                              ),
                            ),
                            Center(child: Text(informationofmolecule.moleculename),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(informationofmolecule.description)
                            ,)
                          ],
                        ),
                      ),
                    );
                  },                
                )
              ],
            )
            
        ),
    );
  }
}