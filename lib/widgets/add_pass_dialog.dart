import 'package:flutter/material.dart';

import '../models/pass.dart';
import '../constants.dart';
import '../repository/service.dart';

class AddPassDialog extends StatefulWidget {
  @override
  State<AddPassDialog> createState() => _AddPassDialogState();
}

class _AddPassDialogState extends State<AddPassDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String _password;
    String _label;
    String _login;

    List<Map<String, dynamic>> iconsList = new List.from(Constants.iconsList);

    List<bool> selecteds = [];

    iconsList.forEach((element) {
      selecteds.add(false);
    });

    return Dialog(
      child: SingleChildScrollView(
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

                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.035),
                  child: Align(
                    // alignment: Alignment.centerLeft,
                    child: Text(
                      'Pick an Icon',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  height: 80,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: new ListWheelScrollView(
                      offAxisFraction: 1,
                      onSelectedItemChanged: (int a) =>
                          print(a.toString() + 'ds'),
                      itemExtent: 100,
                      physics: FixedExtentScrollPhysics(),
                      children: List<Widget>.generate(
                        iconsList.length,
                        (index) => Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(blurRadius: 0.5, color: Colors.grey)
                            ],
                            shape: BoxShape.circle,
                            color: !selecteds[index]
                                ? darken(Theme.of(context).backgroundColor, 1)
                                : Colors.green, // inner circle color
                          ),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              iconsList[index]['icon'],
                              color: iconsList[index]['color'],
                            ),
                          ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }
}
