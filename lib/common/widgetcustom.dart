import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardWidget extends StatelessWidget {
late String judulcard;
late String imagepath;
late String deskripsi;

final String imagepaths ='assets/Image/Bab2.jpg' ;

CustomCardWidget(
  this.judulcard,
  this.deskripsi,
  // this.imagepath
);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(judulcard);
        Navigator.of(context).pushNamed('/'+judulcard);
      },
      child: Card(
            color: Colors.blue[800],
            shadowColor: Colors.blueGrey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 10,
            child:
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade400,
                      Colors.blue.shade300,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.only(top:10,left:10,right: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_outline_rounded,size: 30,color: Colors.blue[50],),
                        Text(
                          this.judulcard,
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.deskripsi,
                          style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          fit: BoxFit.fill,
                          image:  AssetImage("assets/logo/icons/$judulcard.png")
                        )
                      ),
                    ),
                  ],
                ),
              ),
              // ListTile(

              //   leading: 
              // Container(
              //     //  padding: EdgeInsets.only(top: 20,left: 10),
              //     width: 50,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       image:DecorationImage(
              //         fit: BoxFit.fill,
              //         image:  AssetImage("assets/logo/icons/$judulcard.png"))
              //         ),
              //         ),
              //   title: 
              //      Text(
              //       this.judulcard,
              //       style: TextStyle(fontSize: 15,
              //       fontWeight: FontWeight.bold),
              //     ),
              //     // subtitle: Text('easy',style: TextStyle(color: Colors.grey),),
              //     trailing:  Icon(Icons.play_circle_filled_rounded,size: 50,),
              // ),   
            ),
      );
  }
}
