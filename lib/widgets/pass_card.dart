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
