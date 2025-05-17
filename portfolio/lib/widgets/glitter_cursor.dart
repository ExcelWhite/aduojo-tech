import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GlitterTrail extends StatefulWidget {
  final Offset cursorPosition;
  final bool isMoving;

  const GlitterTrail({super.key, required this.cursorPosition, required this.isMoving});

  @override
  State<GlitterTrail> createState() => _GlitterTrailState();
}

class _GlitterTrailState extends State<GlitterTrail> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Queue<_TrailParticle> _trail = Queue();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..addListener(() {
        _updateTrail();
        setState(() {});
      })
      ..repeat();
  }

  void _updateTrail() {
    final now = DateTime.now();
    _trail.removeWhere((p) => now.difference(p.timestamp).inMilliseconds > 600);
    if (widget.isMoving) {
      _trail.add(_TrailParticle(widget.cursorPosition));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: _trail.map((particle) {
          final age = DateTime.now().difference(particle.timestamp).inMilliseconds / 600;
          final opacity = (1.0 - age).clamp(0.0, 1.0);
          final size = particle.size;

          return Positioned(
            left: particle.position.dx - size / 2,
            top: particle.position.dy - size / 2,
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow.withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.yellow.withOpacity(0.4),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _TrailParticle {
  final Offset position;
  final DateTime timestamp;
  final double size;

  _TrailParticle(this.position)
      : timestamp = DateTime.now(),
        size = Random().nextDouble() * 4 + 2;
}
