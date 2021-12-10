import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardWidget extends StatelessWidget {
late String judulcard;
late String imagepath;
late String deskripsi;

final String imagepaths ='assets/Image/Bab2.jpg' ;


CustomCardWidget(
  this.judulcard,
  // this.deskripsi,
  // this.imagepath
);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(judulcard);
        Navigator.of(context).pushNamed('/'+judulcard);
      },
      child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child:
           ListTile(
              leading: Icon(Icons.accessibility_new_rounded,color: Colors.green,),
              title: Text(
                this.judulcard,
                style: TextStyle(fontSize: 12,
                fontWeight: FontWeight.bold),
              ),
              subtitle: Text('easy',style: TextStyle(color: Colors.grey),),
              trailing:  Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,),
              ),   
            ),
            //  Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     Flexible(
            //       flex: 3,
            //       child:Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(15)),
            //         color: Colors.blue[200],
            //         image:  DecorationImage(
            //           colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.7), BlendMode.dstATop),
            //           image: AssetImage((imagepaths),),
            //           fit: BoxFit.fitWidth
            //           )
            //       ),
            //     ),
            //     ),
            //     Flexible(
            //       flex:4,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(
            //             child: Text(judulcard,
            //               style: TextStyle(
            //                 fontSize: MediaQuery.of(context).size.height/40,
            //                 fontWeight: FontWeight.bold
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //       )
            //   ],
            // ),
        ),
      );
  }
}
