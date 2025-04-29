import 'package:flutter/material.dart';

class ExternalAnimation extends StatefulWidget {
  const ExternalAnimation({super.key});

  @override
  State<ExternalAnimation> createState() => _ExternalAnimationState();
}

class _ExternalAnimationState extends State<ExternalAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _setAnimation(); // initial animation
  }

  void _setAnimation() {
    final begin = _isLoading ? 0.0 : 300.0;
    final end = _isLoading ? 300.0 : 0.0;
    _animation = Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleAnimation() {
    setState(() {
      _isLoading = !_isLoading;
      _setAnimation();
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              color: Colors.blue,
              child: child,
            );
          },
          child: const FlutterLogo(size: 100),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

