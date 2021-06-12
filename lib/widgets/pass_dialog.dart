import 'package:flutter/material.dart';

class PassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        child: Column(
          children: [
            Text("Pass X"),
          ],
        ),
      ),
    );
  }
}
