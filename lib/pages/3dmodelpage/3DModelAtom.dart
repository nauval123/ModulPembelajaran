// @dart=2.9
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
          body: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.1,
            maxHeight: MediaQuery.of(context).size.height * 0.35,
            renderPanelSheet: false,
            collapsed: Container(
                padding: EdgeInsets.only(top: 4),
                color: Colors.blue.shade400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        "Informasi Molekul",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            panel: Container(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 20),
              color: Colors.blue.shade300,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama",
                          style: TextStyle(color: Colors.grey.shade300)),
                      Text(informationofmolecule.moleculename,
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Nama IUPAC",
                          style: TextStyle(color: Colors.grey.shade300)),
                      Text(informationofmolecule.fullnameMol,
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Deskripsi",
                          style: TextStyle(color: Colors.grey.shade300)),
                      Text(informationofmolecule.description,
                          style: TextStyle(color: Colors.white)),
                    ]),
              ),
            ),
            body: Stack(
              children: [
                ModelViewer(
                  arScale: "auto",
                  backgroundColor: Colors.teal[50],
                  src: 'assets/molecule/glb/' + informationofmolecule.modelpath,
                  // src: file.path,
                  alt: informationofmolecule.moleculename,
                  cameraControls: true,
                  // ar:true,
                ),
                // Spacer(),
                // DraggableScrollableSheet(
                //   initialChildSize: 0.05,
                //   minChildSize: 0.05,
                //   maxChildSize: 0.5,
                //   builder:
                //       (BuildContext context, ScrollController scrollController) {
                //     return Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(25),
                //             topRight: Radius.circular(25)),
                //         color: Colors.white,
                //       ),
                //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                //       child: SingleChildScrollView(
                //         controller: scrollController,
                //         child: Column(
                //           children: [
                //             Container(
                //               margin: EdgeInsets.only(top: 20, bottom: 30),
                //               height: 10,
                //               width: 150,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(25),
                //                 color: Colors.blue[300],
                //               ),
                //             ),
                //             Center(
                //               child: Text(informationofmolecule.moleculename),
                //             ),
                //             Container(
                //               padding: EdgeInsets.all(20),
                //               child: Text(informationofmolecule.description),
                //             )
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // )
              ],
            ),
          )),
    );
  }
}
