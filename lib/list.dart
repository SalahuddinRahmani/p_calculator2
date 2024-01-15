import 'package:flutter/material.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table Example'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('City')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('30')),
              DataCell(Text('New York')),
            ]),
            DataRow(cells: [
              DataCell(Text('Alice')),
              DataCell(Text('25')),
              DataCell(Text('London')),
            ]),
            DataRow(cells: [
              DataCell(Text('Bob')),
              DataCell(Text('35')),
              DataCell(Text('Paris')),
            ]),
          ],
        ),
      ),
    );
  }
}