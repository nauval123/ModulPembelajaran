import 'dart:convert';

class Molecule {
  late int id;
  late String moleculename;
  late String modelpath;
  late String modelar;
  late String moderlarflutter;
  late String nameFormula;
  late String shapeFormula;
  late String nameMol;
  late String fullnameMol;
  late String description;

  Molecule({
    required this.id,
    required this.moleculename,
    required this.modelpath,
    required this.modelar,
    required this.moderlarflutter,
    required this.nameFormula,
    required this.shapeFormula,
    required this.nameMol,
    required this.fullnameMol,
    required this.description,
  });

  Molecule.fromjson(Map<String, dynamic> map) {
    id = int.parse(map["id"]);
    moleculename = map["moleculename"];
    modelpath = map["modelpath"];
    modelar = map["modelar"];
    moderlarflutter = map["modelarflutter"];
    nameFormula = map["nameFormula"];
    shapeFormula = map["shapeFormula"];
    nameMol = map["nameMol"];
    fullnameMol = map["fullnameMol"];
    description = map["description"];
  }
}

List<Molecule> parsingData(String? json) {
  if (json == null) {
    return [];
  }
  Map<String, dynamic> map = jsonDecode(json);
  final List parsed = map["3DMOLECULE"];
  return parsed.map((json) => Molecule.fromjson(json)).toList();
}
