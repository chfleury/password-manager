import 'package:flutter/material.dart';

import '../models/pass.dart';
import '../constants.dart';
import '../repository/service.dart';

class AddPassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _password;
    String _label;
    String _login;
    final _formKey = GlobalKey<FormState>();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Constants.of(context).addPass),
              TextFormField(
                decoration: InputDecoration(labelText: 'Label *'),
                onSaved: (input) => _label = input,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username (optional)'),
                onSaved: (input) => _login = input,
              ),
              TextFormField(
                validator: (input) => input.length < 3
                    ? 'Password must contain at least 3 characters'
                    : null,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password *'),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                    child: TextButton(
                        onPressed: () {}, child: Text("Press to pick an Icon")),
                  )),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // Save the form
                        _formKey.currentState.save();

                        final pass = _login == null
                            ? new Pass(
                                isProtected: false,
                                icon: 1,
                                hasLogin: false,
                                label: _label,
                                password: _password,
                              )
                            : new Pass(
                                isProtected: false,
                                icon: 1,
                                hasLogin: true,
                                login: _login,
                                label: _label,
                                password: _password,
                              );

                        // Add new pass to DB
                        await RepositoryService.addPass(pass);

                        // Then pop dialog with new password to add in _passList
                        Navigator.of(context).pop(pass);
                      }
                    },
                    child: Text(Constants.of(context).done)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
