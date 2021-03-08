import 'package:ecofinder/services/api.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de testes'),
      ),
      body: FutureBuilder(
        future: ApiService.loadDashboardInfo(),
        builder: (context, snapshot) {
          print('entrou');
          final users = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            print(users);
            return Text('dssad');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
