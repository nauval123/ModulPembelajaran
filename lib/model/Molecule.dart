import 'dart:convert';

class Molecule {
  late int id;
  late String moleculename;
  late String modelpath;
  late String modelar;
  late String description;
  late String moderlarflutter;

  Molecule({
    required this.id,
    required this.moleculename,
    required this.modelpath,
    required this.modelar,
    required this.description,
    required this.moderlarflutter,}
  );

Molecule.fromjson(Map<String,dynamic> map){
    id =   int.parse(map["id"]) ;
    moleculename = map["moleculename"];
    modelpath = map["modelpath"] ;
    modelar = map["modelar"];
    description = map["description"] ;
    moderlarflutter = map ["modelarflutter"];
  }
}

List<Molecule> parsingData(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map["3DMOLECULE"];
  return parsed.map((json) => Molecule.fromjson(json)).toList();
}
