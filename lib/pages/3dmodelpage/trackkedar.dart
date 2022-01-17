// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArMarker extends StatefulWidget {

  @override
  _ArMarkerState createState() => _ArMarkerState();
}

class _ArMarkerState extends State<ArMarker> {
  ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: const Text(''),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          type: ArCoreViewType.AUGMENTEDIMAGES,
          
          enableTapRecognizer: true,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;
    loadSingleImage();
    //OR
    // loadImagesDatabase();
  }

  loadSingleImage() async {
    final ByteData bytes =
        await rootBundle.load('assets/earth_augmented_image.jpg');
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  // loadImagesDatabase() async {
  //   final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
  //   arCoreController.loadAugmentedImagesDatabase(
  //       bytes: bytes.buffer.asUint8List());
  // }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      _addSphere(augmentedImage);
    }
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {
    final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');
    final model = ArCoreReferenceNode(
      // scale: vector.Vector3(0.15,0.15,0.15),
      object3DFileName: "BeH2.sfb",
      position:  augmentedImage.centerPose.translation+vector.Vector3(0.0,1.0,0.0),
      rotation: augmentedImage.centerPose.rotation,
      );

      final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: augmentedImage.extentX / 2,
    );
    final node = ArCoreNode(
      shape: sphere,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
    arCoreController.addArCoreNodeWithAnchor(model);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}