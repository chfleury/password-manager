import 'package:flutter/material.dart';
import 'package:password_manager/constants.dart';
import 'package:password_manager/models/pass.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PassDialog extends StatefulWidget {
  final Pass _pass;
  PassDialog(this._pass);

  @override
  State<PassDialog> createState() => _PassDialogState();
}

class _PassDialogState extends State<PassDialog> {
  String passText = '********';

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget._pass.password));

    Fluttertoast.showToast(
      msg: "Password copied to clipboard",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showPass() {
    copyToClipboard();

    setState(() {
      passText = widget._pass.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> iconsList = new List.from(Constants.iconsList);
    final icon = widget._pass.icon != null
        ? iconsList[widget._pass.icon]
        : {'icon': Icons.vpn_key, "color": Colors.black};

    return Dialog(
      child: Form(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.05,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    width: size.width * 0.05,
                  ),
                  Text(
                    widget._pass.label,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                bottom: size.height * 0.03,
                left: size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget._pass.hasLogin
                      ? Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.01),
                          child: Text(
                            widget._pass.login,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Text(
                        passText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: _showPass,
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
