// @dart=2.9
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';

class ModelAtomPage extends StatelessWidget {
  const ModelAtomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final informationofmolecule =
        ModalRoute.of(context).settings.arguments as Molecule;
    // File file = File('assets/molecule/glb/'+informationofmolecule.modelpath);
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
                backgroundColor: Colors.teal.shade50,
                src: 'assets/molecule/glb/' + informationofmolecule.modelpath,
                // src: file.path,
                alt: informationofmolecule.moleculename,
                cameraControls: true,
                // ar:true,
              ),
            ],
          )),
    );
  }
}
