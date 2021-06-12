import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _listLoaded
          ? buildListView()
          : Center(child: LinearProgressIndicator()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await RepositoryService.addPass(null);

            setState(() {
              _passList.add((Pass()));
            });
          }),
    );
  }

  Widget buildListView() {
    // return StreamBuilder(builder: builder);
    return _passList.length > 0
        ? ListView.builder(
            itemCount: _passList.length,
            itemBuilder: (ctx, index) => PassCard(),
          )
        : Center(
            child: Text("nothing here yet"),
          );
  }
}
