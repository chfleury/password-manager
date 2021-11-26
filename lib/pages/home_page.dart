import 'package:flutter/material.dart';

import '../widgets/add_pass_dialog.dart';
import '../models/pass.dart';
import '../repository/service.dart';
import '../widgets/pass_card.dart';

class HomePage extends StatefulWidget {
  final title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pass> _passList = [];
  bool _listLoaded = false;
  @override
  initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() async {
    _passList = await RepositoryService.getAllPasses();
    setState(() {
      _listLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _listLoaded
          ? buildListView(size)
          : Center(child: LinearProgressIndicator()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            Pass _pass = await showDialog(
              context: context,
              builder: (_) => AddPassDialog(),
            );

            if (_pass.password.length > 0) {
              setState(() {
                _passList.add(_pass);
              });
            }
          }),
    );
  }

  Widget buildListView(size) {
    return _passList.length > 0
        ? ListView.builder(
            itemCount: _passList.length,
            itemBuilder: (ctx, index) => PassCard(_passList[index]),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Center(
                    child: Text(
                      "Nothing here yet!",
                      style: TextStyle(fontSize: size.height * 0.028),
                    ),
                  ),
                ),
                Container(
                    height: size.height * 0.2,
                    child: Image.asset('assets/file.png')),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Center(
                    child: Text(
                      "Please, add a new password",
                      style: TextStyle(fontSize: size.height * 0.021),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
