import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';

class ShowroomCarousel extends StatefulWidget {
  final List<Widget> phoneWidgets;

  const ShowroomCarousel({super.key, required this.phoneWidgets});

  @override
  State<ShowroomCarousel> createState() => _ShowroomCarouselState();
}

class _ShowroomCarouselState extends State<ShowroomCarousel> {
  late PageController _controller;
  Timer? _timer;
  int _currentIndex = 1;
  final int _itemCount = 5;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.5, initialPage: _currentIndex);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_isHovered) return; // ⛔ Don't scroll if hovered

      if (_currentIndex < _itemCount + 1) {
        _currentIndex++;
      } else {
        _currentIndex = 1;
        _controller.jumpToPage(_currentIndex);
      }

      _controller.animateToPage(
        _currentIndex,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _isHovered = true;
      },
      onExit: (_) {
        _isHovered = false;
      },
      child: SizedBox(
        height: 932,
        child: PageView.builder(
          controller: _controller,
          itemCount: _itemCount + 2,
          itemBuilder: (context, index) {
            int adjustedIndex = index == 0 ? _itemCount - 1 : (index == _itemCount + 1 ? 0 : index - 1);

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double value = 0.0;
                if (_controller.position.haveDimensions) {
                  value = _controller.page! - index;
                }

                value = (1 - (value.abs() * 0.3)).clamp(0.6, 1.0);
                final angle = (value < 1 ? value : 1) * 0.2;

                return Center(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(value)
                      ..rotateY(angle),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to detail screen
                          },
                          child: Opacity(
                            opacity: value,
                            child: widget.phoneWidgets[adjustedIndex],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
