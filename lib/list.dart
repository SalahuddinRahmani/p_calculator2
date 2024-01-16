import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class TablePage extends StatefulWidget {
  final List<String> savedData;

  TablePage({required this.savedData});

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<DataModel> tableData = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    for (String dataString in widget.savedData) {
      List<String> dataFields = dataString.split(',');
      final DataModel newData = DataModel(
        name: dataFields[0],
        fatherName: dataFields[1],
        integer: int.tryParse(dataFields[2]) ?? 0,
      );
      tableData.add(newData);
    }
  }

  void deleteData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedData = prefs.getStringList('data') ?? [];
    savedData.removeAt(index);
    await prefs.setStringList('data', savedData);

    setState(() {
      tableData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 43, 46, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 57, 65, 1),

        title: Text('لیست خرید',style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
          itemCount: tableData.length,
          itemBuilder: (context, index) {
            final DataModel data = tableData[index];
            return Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[

                  ],
                  gradient: LinearGradient(colors: [

                    Color.fromRGBO(10, 80, 88, 1.0),
                    Color.fromRGBO(22, 34, 42, 1),
                  ]),
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                title: Center(child: Text('${data.name} ولد ${data.fatherName}',style: TextStyle(color: Colors.white,fontSize: 20),)),
                subtitle: Text(' مقدار :  ${data.integer} کیلو',style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: IconButton(
                  color: Colors.red,
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteData(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}