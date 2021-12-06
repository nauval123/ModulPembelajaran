import 'dart:convert';

class Molecule {
  late int id;
  late String moleculename;
  late String modelpath;

  Molecule({
   required this.id,
   required this.moleculename,
   required this.modelpath,
   });


  Molecule.fromJson (Map<String,dynamic> moleculedata){
    id= moleculedata['id'];
    moleculename=moleculedata['moleculename'];
    modelpath=moleculedata['modelpath'];
  }

  List<Molecule> parsingData(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map['3DMOLECULE'];
  return parsed.map((json) => Molecule.fromJson(json)).toList();
}

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['id'] = this.id;
    map['moleculename'] = moleculename;
    map['modelpath'] = modelpath;
    return map;
  }

}
