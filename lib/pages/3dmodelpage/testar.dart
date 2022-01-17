// @dart=2.9
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARPage extends StatefulWidget {
  const ARPage({ Key key }) : super(key: key);

  @override
  _ARPageState createState() => _ARPageState();
}

class _ARPageState extends State<ARPage> {
  ArCoreController arCoreController;
 Molecule modelofmolecule;

 @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      setState(() {
        modelofmolecule = ModalRoute.of(context).settings.arguments as Molecule;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final informationofmolecule = ModalRoute.of(context).settings.arguments as Molecule;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(informationofmolecule.moleculename),
          ),
          body: ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
            enableTapRecognizer: true,
          ),
        ),
      ),
    );
  }


  

  void _onArCoreViewCreated(ArCoreController controller) {
    
    arCoreController = controller;
    // arCoreController.onPlaneDetected=;
    // arCoreController.onPlaneTap=_onHandleTap;
    // arCoreController.onPlaneDetected=;
    _modelMolecule(arCoreController);
    _addCube(arCoreController);
    
  }

  // void _onHandleTap(List<ArCoreHitTestResult> hits){
  //   final hit = hits.first;
  //   _modelMolecule(hit);
  // } 

    void _modelMolecule (ArCoreController controller){
    final model = ArCoreReferenceNode(
      scale: vector.Vector3(0.8,0.8,0.8),
      object3DFileName: modelofmolecule.modelar,
      position: vector.Vector3(0.0, 0.0, -0.35),
      rotation:vector.Vector4(0, 0, 0, 0),
      // position:  plane.pose.translation+vector.Vector3(0.0,0.0,0.0),
      // rotation: plane.pose.rotation,
      );
      
      controller.addArCoreNode(model);
      // arCoreController.addArCoreNode(model);
      // arCoreController.onTrackingImage;
  }

    void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }
  
  
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}

