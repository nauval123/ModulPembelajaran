// @dart=2.9
import 'dart:io';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:vector_math/vector_math_64.dart';

class LocalAndWebObjectsWidget extends StatefulWidget {
  final Molecule molecule;
  LocalAndWebObjectsWidget(this.molecule);  

  @override
  _LocalAndWebObjectsWidgetState createState() =>
      _LocalAndWebObjectsWidgetState();
}

class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
  ARSessionManager arSessionManager;
  ARObjectManager arObjectManager;
  ARNode localObjectNode;
  Molecule molecule;
  
  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.molecule.moleculename),
        ),
        body: Container(
            child: Stack(children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: onLocalObjectAtOriginButtonPressed,
                        child: Text("Add/Remove Local Object at Origin")),
                  ],
                ),
              ]))
        ])));
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
          showAnimatedGuide: true,
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/Images/triangle.png",
          showWorldOrigin: true,
          handleTaps: false,
        );
    this.arObjectManager.onInitialize();
  }


//ini
  Future<void> onLocalObjectAtOriginButtonPressed() async {
    if (this.localObjectNode != null) {
      this.arObjectManager.removeNode(this.localObjectNode);
      this.localObjectNode = null;
      imageCache.clear();
    } else {
      File file = File("assets/molecule/"+widget.molecule.moderlarflutter);
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: file.path,
          scale: Vector3(0.25, 0.25, 0.25),
          position: Vector3(0.0,-0.1, -0.2),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0));
      bool didAddLocalNode = await this.arObjectManager.addNode(newNode);
      this.localObjectNode = (didAddLocalNode) ? newNode : null;
    }
  }
}
