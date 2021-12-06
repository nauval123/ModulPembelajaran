import 'dart:convert';

class Molecule {
  late int id;
  late String moleculename;
  late String modelpath;

  Molecule({
    required this.id,
    required this.moleculename,
    required this.modelpath,}
  );

Molecule.fromjson(Map<String,dynamic> map){
    id =    map['id'] = this.id;
    moleculename = map['moleculename'] = moleculename;
    modelpath = map['modelpath'] = modelpath;
  }
}

List<Molecule> parsingData(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map['3DMOLECULE'];
  return parsed.map((json) => Molecule.fromjson(json)).toList();
}
