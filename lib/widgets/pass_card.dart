import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../models/pass.dart';
import '../widgets/pass_dialog.dart';

class PassCard extends StatelessWidget {
  final Pass _pass;
  PassCard(this._pass);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> iconsList = new List.from(Constants.iconsList);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (_) => PassDialog(),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
                height: size.height * 0.15,
                child: Row(
                  children: [
                    Icon(
                      iconsList[_pass.icon]['icon'],
                      color: iconsList[_pass.icon]['color'],
                      size: size.width * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _pass.label,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          'example@mail.com',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
