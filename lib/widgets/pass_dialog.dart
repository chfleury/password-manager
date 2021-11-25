import 'package:flutter/material.dart';
import 'package:password_manager/models/pass.dart';

class PassDialog extends StatelessWidget {
  final Pass _pass;
  PassDialog(this._pass);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        child: Column(
          children: [
            Text(_pass.label),
          ],
        ),
      ),
    );
  }
}
