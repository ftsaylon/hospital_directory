import 'package:flutter/material.dart';
import 'package:hospital_directory/widgets/video_app.dart';
import 'package:video_player/video_player.dart';

class AdSpace extends StatelessWidget {
  const AdSpace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: VideoApp());
  }
}