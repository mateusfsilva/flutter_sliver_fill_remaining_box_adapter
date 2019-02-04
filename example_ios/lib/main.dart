import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numItems = 3;

  IconData _getCupertinoIcon(int code) {
    /// The icon font used for Cupertino icons.
    const String iconFont = 'CupertinoIcons';

    /// The dependent package providing the Cupertino icons font.
    const String iconFontPackage = 'cupertino_icons';

    return IconData(code, fontFamily: iconFont, fontPackage: iconFontPackage);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Fill remaining with $numItems boxes"),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  _getCupertinoIcon(0xf48a),
                  color: CupertinoColors.activeBlue
                ),
                onTap: () {
                  print("Added!\n\n\n\n");
                  setState(() => numItems += 1);
                }
              ),
              GestureDetector(
                child: Icon(
                  _getCupertinoIcon(0xf463),
                  color: CupertinoColors.activeBlue
                ),
                onTap: () {
                  print("Added!\n\n\n\n");
                  setState(() => numItems = numItems > 0 ? numItems - 1 : numItems);
                }
              )
            ]
          )
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, val) => Container(
                    height: 300.0,
                    color: Color(0xFF000000 | math.Random(val + 12234443).nextInt(0xFFFFFF)),
                    alignment: Alignment.center,
                    child: Text("Item number $val")
                  ),
                  childCount: numItems
                )
              ),
              SliverFillRemaining(
                // child: Container(
                //   color: Color(0xff000000),
                //   alignment: Alignment.center,
                  child: Container(
                    color: Color(0xff000000),
                    height: 200.0,
                    alignment: Alignment.center,
                    child: Text(
                      "This is filling the remaining or using\nits child's height if no remaining.",
                      style: TextStyle(color: Color(0xffffffff)),
                      textAlign: TextAlign.center
                    )
                  )
                // )
              )
            ]
          )
        )
      )
    );
  }
}  
