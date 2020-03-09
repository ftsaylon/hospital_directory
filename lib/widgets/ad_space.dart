import 'package:flutter/material.dart';
import 'package:hospital_directory/widgets/video_app.dart';
import 'package:hospital_directory/widgets/video_panel.dart';

class AdSpace extends StatelessWidget {
  const AdSpace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: VideoPanel(),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
    // return VideoApp();
  }
}
