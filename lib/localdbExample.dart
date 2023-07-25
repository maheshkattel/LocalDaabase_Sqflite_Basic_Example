import 'package:flutter/material.dart';
import 'package:localdb/dbhelper.dart';

class LocalDBExample extends StatelessWidget {
  final dbhelper = DBHelper();
  void insertData() async {
    Map<String, dynamic> row = {DBHelper.name: 'Mahesh', DBHelper.age: 13};
    final id = await dbhelper.insert(row);
    print(id);
  }

  void queryData() async {
    var values = await dbhelper.query();
    values.forEach((element) {
      print(element);
    });
  }

  void deleteData() async {
    // var delete = await dbhelper.deleteData();
    var delete = await dbhelper.deleteData(1);
    print(delete);
  }

  void querySpecific() async {
    var specific = await dbhelper.querySpecific(12);
    print(specific);
  }

  void updateData() async {
    var update = dbhelper.update(5);
    print(update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                insertData();
              },
              child: Text('Insert'),
              color: Colors.green,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                queryData();
              },
              child: Text('View'),
              color: Colors.blue,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                deleteData();
              },
              child: Text('Delete'),
              color: Colors.red,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                querySpecific();
              },
              child: Text('Query Specific'),
              color: Colors.yellow,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                updateData();
              },
              child: Text('Update'),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
