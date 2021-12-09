import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:model_viewer/model_viewer.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';

class ModelAtomPage extends StatelessWidget {
  const ModelAtomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final informationofmolecule = ModalRoute.of(context)!.settings.arguments as Molecule;

    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: ModelViewer(
                  backgroundColor: Colors.teal[50],
                  src: 'assets/molecule/'+informationofmolecule.modelpath,
                  alt: informationofmolecule.moleculename,
                  autoPlay: true,
                  autoRotate: false,
                  cameraControls: true,
                          ),
                ),
                Spacer(),
                Flexible(child: Container(child: Text('Karbon Dioksida, hasil pemabakaran sangat berbahaya'),))
              ],
            ),
        ),
    );
  }
}