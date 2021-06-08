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

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    _passList = await RepositoryService.getAllPasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: buildListView(),
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
    return ListView.builder(
      itemCount: _passList.length,
      itemBuilder: (ctx, index) => PassCard(),
    );
  }
}
