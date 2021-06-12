import 'package:flutter/material.dart';

import '../widgets/pass_dialog.dart';

class PassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => PassDialog(),
      ),
      child: Card(
        child: Text('a'),
      ),
    );
  }
}

// showDialog(context: context, child:
//     new AlertDialog(
//       title: new Text("My Super title"),
//       content: new Text("Hello World"),
//     )
// );