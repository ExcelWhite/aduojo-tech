import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KiddiegramScreen extends StatefulWidget {
  final void Function(String screenKey) onNavigate;
  final VoidCallback onPop;
  final Size size;

  const KiddiegramScreen({
    super.key,
    required this.onNavigate,
    required this.onPop,
    required this.size
  });

  @override
  _KiddiegramScreenState createState() => _KiddiegramScreenState();
}

class _KiddiegramScreenState extends State<KiddiegramScreen> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Load the video from the assets
    _controller = VideoPlayerController.asset('assets/videos/kdg.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    // Looping video
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPlayPauseButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          // Toggle play/pause
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: widget.size.width,
          height: widget.size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Video player ready
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // Loading spinner while video is initializing
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        )
      ),
      floatingActionButton: _buildPlayPauseButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


}