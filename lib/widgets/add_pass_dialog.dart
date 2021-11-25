import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';

import '../models/pass.dart';
import '../constants.dart';
import '../repository/service.dart';

class AddPassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Text(
                Constants.of(context).addPass,
                style: TextStyle(fontSize: 18),
              ),
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
              // Row(
              //   children: [Icon(BrandIcons.windows)],
              // ),

              Container(
                height: 100,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: new ListWheelScrollView(
                    itemExtent: 100,
                    physics: FixedExtentScrollPhysics(),
                    children: List<Widget>.generate(
                      20,
                      (index) => Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .backgroundColor, // inner circle color
                        ),
                        child: RotatedBox(
                            quarterTurns: 1, child: Icon(BrandIcons.netflix)),
                      ),
                    ),
                  ),
                ),
              ),
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 8.0, bottom: 4),
              //       child: TextButton(
              //           onPressed: () {}, child: Text("Press to pick an Icon")),
              //     )),
              Container(
                width: double.infinity,
                height: size.height * 0.065,
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
