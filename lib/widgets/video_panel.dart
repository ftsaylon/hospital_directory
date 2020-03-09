import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

VideoPlayerController _controller;
ChewieController _chewieController; // custom ui
Future<void> _initializeVideoPlayerFuture;

class VideoPanel extends StatefulWidget {
  VideoPanel({Key key}) : super(key: key);

  @override
  _VideoPanelState createState() => _VideoPanelState();
}

class _VideoPanelState extends State<VideoPanel> {
  var _clips = List<String>(); // video list
  int _playingIndex = -1;
  bool _disposed = false;
  var _isPlaying = false;
  var _isEndPlaying = false;

  @override
  void dispose() {
    _disposed = true;
    // By assigning Future is null,
    // prevent the video controller is using in widget before disposing that.
    _initializeVideoPlayerFuture = null;
    // In my case, sound is playing though controller was disposed.
    _controller?.pause()?.then((_) {
      // dispose VideoPlayerController.
      _controller?.dispose();
    });
    super.dispose();
  }

  Future<bool> _clearPrevious() async {
    await _controller?.pause();
    _controller?.removeListener(_controllerListener);
    return true;
  }

  Future<void> _startPlay(int index) async {
    print("play ---------> $index");
    setState(() {
      _initializeVideoPlayerFuture = null;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(index);
      });
    });
  }

  Future<void> _initializePlay(int index) async {
    // final file = await _localStorage.localFile(_clips[index].filePath());
    // print("file.exists: ${file.existsSync()}");
    // print("file.path: ${file.path}");
    // _controller = VideoPlayerController.file(file);
    _controller.addListener(_controllerListener);
    _chewieController = ChewieController(videoPlayerController: _controller);
    _initializeVideoPlayerFuture = _controller.initialize();

    setState(() {
      _playingIndex = index;
    });
  }

// tracking status
  Future<void> _controllerListener() async {
    if (_controller == null || _disposed) {
      return;
    }
    if (!_controller.value.initialized) {
      return;
    }
    final position = await _controller.position;
    final duration = _controller.value.duration;
    final isPlaying = position.inMilliseconds < duration.inMilliseconds;
    final isEndPlaying =
        position.inMilliseconds > 0 && position.inSeconds == duration.inSeconds;

    if (_isPlaying != isPlaying || _isEndPlaying != isEndPlaying) {
      _isPlaying = isPlaying;
      _isEndPlaying = isEndPlaying;
      print(
          "$_playingIndex -----> isPlaying=$isPlaying / isCompletePlaying=$isEndPlaying");
      if (isEndPlaying) {
        final isComplete = _playingIndex == _clips.length - 1;
        if (isComplete) {
          print("played all!!");
        } else {
          _startPlay(_playingIndex + 1);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _playView(),
    );
  }
}

// play view area
Widget _playView() {
  // FutureBuilder to display a loading spinner until finishes initializing
  return FutureBuilder(
    future: _initializeVideoPlayerFuture,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        _chewieController.play();
        return AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Chewie(controller: _chewieController),
        );
      } else {
        return SizedBox(
          height: 300,
          child: Center(child: CircularProgressIndicator()),
        );
      }
    },
  );
}
