import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/model/Molecule.dart';

class ModelList extends StatefulWidget {
  @override
  _ModelListState createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  int count = 0;
  late List <Molecule> _listofmolecule;
  late Future  _future;
  late List <Molecule> _list;

  Future makealist () async{
   var json = await DefaultAssetBundle.of(context).loadString('assets/moleculemodel.json');
   setState(() {
     _listofmolecule = parsingData(json);
     _list = parsingData(json);
   });

   return _listofmolecule;
  }

  @override
  void initState() {
    super.initState();
    _future = makealist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Molekul'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context,AsyncSnapshot<dynamic> snapshot){
          
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: _listofmolecule.length+1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ?_searchBar() : _listmolecule(_listofmolecule, index-1);
              },
            );
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
        ),
    );
  }

  Widget _searchBar(){
       return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100,width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue.shade300
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              // contentPadding: EdgeInsets.all(10),
              fillColor: Colors.blue[100],
              hintText: 'Cari Model Atom...',
              hintStyle: TextStyle(color: Colors.white),
            //   focusedBorder:OutlineInputBorder(
            //   borderSide: const BorderSide( width: 0.5),
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            ),
            onChanged: _filter,
          ),
        ),
    );
  }

  Widget _listmolecule(List<Molecule> listofmolecule,int index){
     return InkWell(
                  onTap:(){ Navigator.of(context).pushNamed("/moleculemodel",arguments: listofmolecule[index]);},
                  child: Card(
                    child: ListTile(
                      title: Text(listofmolecule[index].moleculename),
                      leading: Text(listofmolecule[index].id.toString()),
                    ),
                  ),
                );
    }

    void _filter(String word){
       List<Molecule> results = [];
        if (word.isEmpty) {
          results = _list;
          setState(() {
          print(results.toString());
          _listofmolecule = results;
        });

        } else {
          results = _listofmolecule
              .where((mol) =>
                  mol.moleculename.toLowerCase().contains(word.toLowerCase()))
              .toList();
      setState(() {
          print(results.toString());
          _listofmolecule = results;
        });
        }
    }
  }

