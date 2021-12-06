// @dart=2.9
import 'package:flutter/services.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
//mendukug pemrograman asinkron
import 'dart:io';


//kelass Dbhelper
class DbHelper {
 static DbHelper dbHelper;
 static Database database; 


  DbHelper._createObject();

  factory DbHelper() {
    if (dbHelper == null) {
      dbHelper = DbHelper._createObject();
    }
    return dbHelper;
  }

  // var database;
// late final database;
  Future<Database>initDb() async {

    var dbDir = await getDatabasesPath();
    var path = join(dbDir, "Modul.db");
    

    final exist = await databaseExists(path);
    if(exist){
      print("databses sudah ada");
    }
    else{
      print("creating copy of database");
      try{
        await Directory(dirname(path)).create(recursive: true);
      }catch(_){}
       ByteData data = await rootBundle.load(join('assets/dbsqlite',"Modul.db"));
        List <int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.offsetInBytes);

        await  File(path).writeAsBytes(bytes,flush: true);

        print("db sudah tersalin!");
    }
     var data= await openDatabase(path);
     return data;
  }

    //buat tabel baru dengan nama contact
  // void _createDb(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE Molecules (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       moleculename TEXT,
  //       modelpath TEXT
  //     )
  //   ''');
  // }

  Future<List<Molecule>> moleculemodel() async {
    
  // Get a reference to the database.
   var dbDir = await getDatabasesPath();
  var path = join(dbDir, "Modul.db");
  final db =  await openDatabase(path);

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('Moleculemodel');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Molecule(id: maps[i]['id'], modelpath:  maps[i]['modelpath'], moleculename: maps[i]['modelname'],);
    // return Molecule(
    //   // id: maps[i]['id'],
    //   // moleculename: maps[i]['name'],
    //   // modelpath: maps[i]['age'],
    // );
  });
}

  // Future<Database> get database async {
  //   if (_database == null) {
  //     _database = await initDb();
  //   }
  //   else if(_database != null){
  //     print('berhasil');
  //   }
  //   return _database;
  // }

//   Future<List<Map<String, dynamic>>> selectMolecule() async {
//     Database db = await this.database;
//     var mapList = await db.query('molecules', orderBy: 'name');
//     return mapList;
//   }

// //create databases
//   Future<int> insert(Molecule object) async {
//     Database db = await this.database;
//     int count = await db.insert('molecules', object.toMap());
//     return count;
//   }
//update databases
  // Future<int> update(Contact object) async {
  //   Database db = await this.database;
  //   int count = await db.update('contact', object.toMap(), 
  //                               where: 'id=?',
  //                               whereArgs: [object.id]);
  //   return count;
  // }

//delete databases
  // Future<int> delete(int id) async {
  //   Database db = await this.database;
  //   int count = await db.delete('contact', 
  //                               where: 'id=?', 
  //                               whereArgs: [id]);
  //   return count;
  // }
  
  // Future<List<Contact>> getContactList() async {
  //   var contactMapList = await select();
  //   int count = contactMapList.length;
  //   List<Contact> contactList = List<Contact>();
  //   for (int i=0; i<count; i++) {
  //     contactList.add(Contact.fromMap(contactMapList[i]));
  //   }
  //   return contactList;
  // }

}