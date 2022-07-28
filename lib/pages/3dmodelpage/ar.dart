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
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
// import 'dart:math';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_archive/flutter_archive.dart';

class LocalAndWebObjectsWidget extends StatefulWidget {
  LocalAndWebObjectsWidget({Key? key}) : super(key: key);
  @override
  _LocalAndWebObjectsWidgetState createState() =>
      _LocalAndWebObjectsWidgetState();
}

class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  bool notification = false;
  //String localObjectReference;
  ARNode? localObjectNode;
  //String webObjectReference;
  // ARNode? webObjectNode;
  // ARNode? fileSystemNode;
  ARAnchorManager? arAnchorManager;
  // HttpClient httpClient;
  Molecule? molecule;
  // List<ARNode> nodes = [];
  // List<ARAnchor> anchors = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        molecule = ModalRoute.of(context)!.settings.arguments as Molecule;
      });
    });
    Future.delayed(Duration.zero, () {
      setState(() {
        notification = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    arSessionManager?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    molecule = ModalRoute.of(context)!.settings.arguments as Molecule;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(molecule?.moleculename ?? "Model 3D atom"),
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
                    Text("Nama", style: TextStyle(color: Colors.grey.shade300)),
                    Text(molecule!.moleculename,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Nama IUPAC",
                        style: TextStyle(color: Colors.grey.shade300)),
                    Text(molecule!.fullnameMol,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Deskripsi",
                        style: TextStyle(color: Colors.grey.shade300)),
                    Text(molecule!.description,
                        style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          body: Container(
              child: notification == false
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(children: [
                      ARView(
                        onARViewCreated: onARViewCreated,
                        planeDetectionConfig:
                            PlaneDetectionConfig.horizontalAndVertical,
                      ),
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // ElevatedButton(
                                    //     onPressed: onLocalObjectAtOriginButtonPressed,
                                    //     child: Text("Add/Remove Local\nObject at Origin")),
                                  ],
                                ),
                              ]))
                    ])),
        ));
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    File file = File("assets/molecule/" + molecule!.moderlarflutter);
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(
          showAnimatedGuide: false,
          showFeaturePoints: false,
          showPlanes: false,
          // handlePans: true,
          // handleRotation: true,
          // customPlaneTexturePath: "assets/Images/triangle.png",
          showWorldOrigin: false,
          handleTaps: false,
        );
    this.arObjectManager!.addNode(ARNode(
        type: NodeType.localGLTF2,
        uri: file.path,
        scale: vector.Vector3(0.25, 0.25, 0.25),
        position: vector.Vector3(0.0, -0.1, -0.2),
        rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0)));
  }

//ini
  Future<void> onLocalObjectAtOriginButtonPressed() async {
    File file = File("assets/molecule/" + molecule!.moderlarflutter);
    print(file.path);
    // print(file.existsSync());
    if (this.localObjectNode != null) {
      this.arObjectManager!.removeNode(this.localObjectNode!);
      this.localObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: file.path,
          scale: vector.Vector3(0.25, 0.25, 0.25),
          position: vector.Vector3(0.0, -0.1, -0.2),
          rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0));
      // bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode);
      this.localObjectNode = newNode;
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