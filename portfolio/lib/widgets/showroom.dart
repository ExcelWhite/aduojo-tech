import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/apps/apps.dart';
import 'package:portfolio/apps/kiddiegram/kiddiegram.dart';
import 'package:portfolio/apps/nutribot/nutribot.dart';
import 'package:portfolio/apps/scheduly/scheduly.dart';
import 'package:portfolio/apps/volt_valut/volt_vault.dart';
import 'dart:ui';
import 'package:portfolio/screens/app_show_screen.dart';

class ShowroomCarousel extends StatefulWidget {
  final List<Widget> phoneWidgets;
  final Size phoneSize;

  const ShowroomCarousel({
    super.key,
    required this.phoneWidgets,
    required this.phoneSize
  });

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

  void _navigateToApp(Apps app) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppShowScreen(
          app: app,
          phoneSize: widget.phoneSize,
        ),
      ),
    );
  }

  void _showComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Updates coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showNotAvailable() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select a phone from the carousel.'),
        duration: Duration(seconds: 2),
      ),
    );
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
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swipe Right
            if (_currentIndex > 1) {
              _currentIndex--;
              _controller.animateToPage(
                _currentIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            // Swipe Left
            if (_currentIndex < _itemCount) {
              _currentIndex++;
              _controller.animateToPage(
                _currentIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
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
                            switch (adjustedIndex) {
                              case 0:
                                _navigateToApp(Scheduly(widget.phoneSize));
                                break;
                              case 1:
                                _navigateToApp(VoltVault(widget.phoneSize));
                                break;
                              case 2:
                                _navigateToApp(Kiddiegram(widget.phoneSize));
                                break;
                              case 3:
                                _navigateToApp(Nutribot(widget.phoneSize));
                                break;
                              case 4:
                                _showComingSoon();
                                break;
                              default:
                                _showNotAvailable();
                                break;
                            }
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
