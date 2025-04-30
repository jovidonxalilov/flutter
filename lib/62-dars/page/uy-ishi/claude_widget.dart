import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudWidget extends StatelessWidget {
  final Animation<double> animation;

  const CloudWidget({required this.animation});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          return Stack(
            children: List.generate(4, (i) {
              double offset =
                  (animation.value * 300 + i * 150) % 400;
              return Transform.translate(
                offset: Offset(-offset, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: i * 15.0),
                    child: Icon(
                      Icons.cloud,
                      size: 40,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
