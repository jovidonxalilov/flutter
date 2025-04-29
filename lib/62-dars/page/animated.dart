import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  bool _isAligned = true;
  List text = [
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
    "salom",
  ];
  final _myListKey = GlobalKey<AnimatedListState>();

  void _alignment() {
    setState(() {
      _isAligned = !_isAligned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              text.add("alik");
              _myListKey.currentState?.insertItem(text.length - 1);
              // _alignment();
            },
          ),
          IconButton(
            icon: Icon(Icons.abc),
            onPressed: () {
              text.removeAt(1);
              _myListKey.currentState?.removeItem(
                1,
                (context, animation) => SlideTransition(
                  position: animation.drive(
                    Tween(
                      begin: Offset(-1, 0),
                      end: Offset(0, 0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      text[1],
                    ),
                  ),
                ),
                duration: Duration(seconds: 1)
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              alignment: _isAligned ? Alignment.topRight : Alignment.bottomLeft,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 50,
              ),
            ),
            AnimatedContainer(
              width: _isAligned ? 200 : 100,
              height: _isAligned ? 200 : 100,
              color: _isAligned ? Colors.blue : Colors.red,
              duration: Duration(
                seconds: 1,
              ),
            ),
            AnimatedDefaultTextStyle(
              style: _isAligned
                  ? TextStyle(fontSize: 50, color: Colors.blue)
                  : TextStyle(fontSize: 30, color: Colors.black38),
              duration: Duration(seconds: 1),
              child: Text("Hello World"),
            ),
            AnimatedOpacity(
              opacity: _isAligned ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 50,
              ),
            ),
            AnimatedPhysicalModel(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              shadowColor: Colors.black,
              duration: Duration(seconds: 1),
              shape: BoxShape.rectangle,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              secondChild: FlutterLogo(
                size: 50,
              ),
              crossFadeState: _isAligned
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(
                seconds: 1,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _isAligned
                  ? Text("Do")
                  : Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
            ),
            AnimatedRotation(
              turns: _isAligned ? 0.5 : 0,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 50,
              ),
            ),
            AnimatedScale(
              scale: _isAligned ? 2 : 1,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 50,
              ),
            ),
            SizedBox(
              height: 700,
              child: AnimatedList(
                key: _myListKey,
                initialItemCount: text.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: Offset(-1, 0),
                        end: Offset(0, 0),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        text[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _alignment,
        child: Icon(Icons.add),
      ),
    );
  }
}
