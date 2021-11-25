import 'package:flutter/material.dart';

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
    final icon = _pass.icon != null
        ? iconsList[_pass.icon]
        : {'icon': Icons.vpn_key, "color": Colors.black};

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
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 0.5, color: Colors.grey)
                          ],
                          shape: BoxShape.circle,
                          color: Theme.of(context).backgroundColor),
                      child: Icon(
                        icon != null ? icon['icon'] : Icons.ac_unit,
                        color: icon != null ? icon['color'] : Colors.purple,
                        size: size.width * 0.08,
                      ),
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
                          _pass.hasLogin ? _pass.login : '',
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
