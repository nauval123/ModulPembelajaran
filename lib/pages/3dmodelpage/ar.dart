// @dart=2.9
import 'dart:io';

import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
// import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';
// import 'dart:math';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_archive/flutter_archive.dart';

class LocalAndWebObjectsWidget extends StatefulWidget {
  LocalAndWebObjectsWidget({Key key}) : super(key: key);
  @override
  _LocalAndWebObjectsWidgetState createState() =>
      _LocalAndWebObjectsWidgetState();
}

class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
  ARSessionManager arSessionManager;
  ARObjectManager arObjectManager;
  //String localObjectReference;
  ARNode localObjectNode;
  //String webObjectReference;
  ARNode webObjectNode;
  ARNode fileSystemNode;
    ARAnchorManager arAnchorManager;
  // HttpClient httpClient;
  Molecule molecule;
  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];
  
  @override
  void initState() {
    super.initState();
      Future.delayed(Duration.zero,(){
      setState(() {
        molecule = ModalRoute.of(context).settings.arguments as Molecule;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(molecule.moleculename.isNotEmpty?molecule.moleculename:""),
        ),
        body: Container(
            child: Stack(children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontal,
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
                        child: Text("Add/Remove Local\nObject at Origin")),
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
     this.arAnchorManager = arAnchorManager;

    this.arSessionManager.onInitialize(
          showAnimatedGuide: true,
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/Images/triangle.png",
          showWorldOrigin: true,
          handleTaps: false,
        );
    this.arObjectManager.onInitialize();
      // this.arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
      // this.arObjectManager.onNodeTap = onNodeTapped;
  }

 

//ini
  Future<void> onLocalObjectAtOriginButtonPressed() async {
    
    // print(file.existsSync());
    if (this.localObjectNode != null) {
      this.arObjectManager.removeNode(this.localObjectNode);
      this.localObjectNode = null;
    } else {
      File file = File("assets/molecule/"+molecule.moderlarflutter);
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

  //   Future<void> onNodeTapped(List<String> nodes) async {
  //   var number = nodes.length;
  //   this.arSessionManager.onError("Tapped $number node(s)");
  // }

  // Future<void> onPlaneOrPointTapped(List<ARHitTestResult> hitTestResults) async {
  //    File file = File("assets/molecule/"+molecule.moderlarflutter);
  //   var singleHitTestResult = hitTestResults.firstWhere(
  //       (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
  //   if (singleHitTestResult != null) {
  //     var newAnchor =
  //         ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
  //     bool didAddAnchor = await this.arAnchorManager.addAnchor(newAnchor);
  //     if (didAddAnchor) {
  //       this.anchors.add(newAnchor);
  //       // Add note to anchor
        
  //       var newNode = ARNode(
  //           type: NodeType.localGLTF2,
  //           uri:file.path,
  //           scale: Vector3(3, 3, 3),
  //           position: Vector3(0.2, 0.2, 0.0),
  //           rotation: Vector4(1.0, 0.0, 0.0, 0.0));
  //       bool didAddNodeToAnchor =
  //           await this.arObjectManager.addNode(newNode, planeAnchor: newAnchor);
  //       if (didAddNodeToAnchor) {
  //         this.nodes.add(newNode);
  //       } else {
  //         this.arSessionManager.onError("Adding Node to Anchor failed");
  //       }
  //     } else {
  //       this.arSessionManager.onError("Adding Anchor failed");
  //     }
      
      // To add a node to the tapped position without creating an anchor, use the following code (Please mind: the function onRemoveEverything has to be adapted accordingly!):
    //   var newNode = ARNode(
    //       type: NodeType.localGLTF2,
    //       uri: file.path,
    //       scale: Vector3(2, 2, 2),
    //       transformation: singleHitTestResult.worldTransform);
    //   bool didAddWebNode = await this.arObjectManager.addNode(newNode);
    //   if (didAddWebNode) {
    //     this.nodes.add(newNode);
    //   }
    // }
  }



// }
