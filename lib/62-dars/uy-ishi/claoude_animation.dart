import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:loggy/62-dars/uy-ishi/claude_widget.dart';

import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class ClaudeAnimation extends StatefulWidget {
  const ClaudeAnimation({super.key});

  @override
  _ClaudeAnimationState createState() => _ClaudeAnimationState();
}

class _ClaudeAnimationState extends State<ClaudeAnimation>
    with SingleTickerProviderStateMixin {
  bool isFlying = false;
  late AnimationController _cloudController;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    _cloudController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _cloudController.dispose();
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 250 ,
                  child: Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        final color = _colors[index % _colors.length];
                        return Container(
                          color: color,
                          child: Center(
                            child: Text(
                              'Page ${(index % _colors.length) + 1}',
                              style: const TextStyle(fontSize: 32, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => setState(() => isFlying = !isFlying),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 240,
                  height: 95,
                  decoration: BoxDecoration(
                    color: isFlying ? Colors.blue : Colors.black54,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isFlying)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CloudWidget(animation: _cloudController), // to‘g‘rilandi
                        ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: isFlying
                              ? const SizedBox.shrink(key: ValueKey("flying"))
                              : Column(
                            key: const ValueKey("landed"),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    12,
                                        (_) => Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 245,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    11,
                                        (_) => Container(
                                      width: 13,
                                      height: 4,
                                      margin: const EdgeInsets.symmetric(horizontal: 4),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    12,
                                        (_) => Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 500),
                        alignment: isFlying
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 47.5,
                          backgroundColor: Colors.white,
                          child: FittedBox(
                            child: Transform.rotate(
                              angle: math.pi / 2,
                              child: Icon(
                                Icons.flight,
                                color: isFlying ? Colors.blue : Colors.grey[900],
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

