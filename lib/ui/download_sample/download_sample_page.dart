import 'package:download_sample/entity/video_data.dart';
import 'package:download_sample/ui/download_sample/download_sample_view_model.dart';
import 'package:flutter/material.dart';

class DownloadSamplePage extends StatefulWidget {
  @override
  _DownloadSamplePageState createState() => _DownloadSamplePageState();
}

class _DownloadSamplePageState extends State<DownloadSamplePage> {
  final viewModel = DownloadSampleViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: StreamBuilder(
        stream: viewModel.downloadVideos(videoDataList),
        builder: (context, snapshot) {

          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Text(
            snapshot.data.toString() + '%',
            style: TextStyle(fontSize: 20),
          );
        },
      ))),
    );
  }
}
