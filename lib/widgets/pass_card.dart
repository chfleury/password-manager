import 'package:flutter/material.dart';

import '../models/pass.dart';
import '../widgets/pass_dialog.dart';

class PassCard extends StatelessWidget {
  final Pass _pass;
  PassCard(this._pass);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => PassDialog(),
      ),
      child: Card(
        child: Text(_pass.password),
      ),
    );
  }
}
