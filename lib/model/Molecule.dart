class Molecule {
  int id;
  String moleculename;
  String modelpath;

  Molecule(
    this.id,
    this.moleculename,
    this.modelpath,
  );


  // int get id => id;
  // String get moleculename => moleculename;
  // String get modelpath=> modelpath;

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['id'] = this.id;
    map['moleculename'] = moleculename;
    map['modelpath'] = modelpath;
    return map;
  }

}
