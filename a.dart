import 'package:flutter/material.dart';

const String kTitle = 'Horizontal ListWheelScrollView Sample';

void main() => runApp(new ListWheelScrollViewSample());

class ListWheelScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: kTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.headline2;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(kTitle),
      ),
      body: new RotatedBox(
        quarterTurns: 3,
        child: new ListWheelScrollView(
          itemExtent: 100,
          physics: FixedExtentScrollPhysics(),
          children: List<Widget>.generate(
              20,
              (index) => Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text('${index + 1}',
                          textAlign: TextAlign.center, style: _style),
                    ),
                  )),
        ),
      ),
    );
  }
}
