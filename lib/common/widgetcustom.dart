import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardWidget extends StatelessWidget {
late String judulcard;
late String imagepath;
final String imagepaths ='assets/Image/Bab2.jpg' ;


CustomCardWidget(
  this.judulcard,
);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(judulcard);
        Navigator.pushNamed(context,'/'+judulcard);
      },
      child: Container(
        height: MediaQuery.of(context).size.height/4,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // color: Colors.blue.shade200,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(15)),
                    color: Colors.blue[200],
                    image:  DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.7), BlendMode.dstATop),
                      image: AssetImage((imagepaths),),
                      fit: BoxFit.fitWidth
                      )
                  ),
                ),
                ),
                Flexible(
                  flex:4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.only(top: 10,left: 10),
                      //   child: Text("Bab 1",
                      //     style: TextStyle(
                      //       fontSize: MediaQuery.of(context).size.height/50,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        // padding: EdgeInsets.only(top: 10,left: 10),
                        child: Text(judulcard,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height/40,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  )
                  )
              ],
            ),
          ),
        ),
      );
  }
}
