import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Materi extends StatefulWidget {
  Materi({Key? key}) : super(key: key);

  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          // height: double.infinity,
          child: Scrollbar(
            child: PhotoViewGallery.builder(
              itemCount: 27,
              scrollDirection: Axis.vertical,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  initialScale: PhotoViewComputedScale.contained * 0.9,
                  imageProvider: AssetImage(
                      "assets/Materi/" + (index + 1).toString() + ".png"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
