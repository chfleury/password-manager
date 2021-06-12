import 'package:flutter/material.dart';
import '../constants.dart';

import '../repository/service.dart';

class AddPassDialog extends StatelessWidget {
  final VoidCallback _callBack;
  AddPassDialog(this._callBack);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Constants.of(context).addPass),
            ElevatedButton(
                onPressed: () async {
                  await RepositoryService.addPass(null);
                  Navigator.of(context).pop();
                  _callBack();
                },
                child: Text(Constants.of(context).done)),
          ],
        ),
      ),
    );
  }
}

 // onPressed: () async {
        //   await RepositoryService.addPass(null);

        //   setState(() {
        //     _passList.add((Pass()));
        //   });
        // }