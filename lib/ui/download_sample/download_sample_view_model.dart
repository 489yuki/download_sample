import 'package:download_sample/entity/video_data.dart';
import 'package:download_sample/ui/download_sample/download_sample_model.dart';
import 'package:rxdart/rxdart.dart';

class DownloadSampleViewModel {
  Stream<double> downloadVideos(List<VideoData> downloadVideoDataList) {
    print('test');
    final streamController = BehaviorSubject<double>();
    DownloadSampleModel()
        .downloadVideos(streamController, downloadVideoDataList)
        .onError((error, stackTrace) => print(error));

    return streamController.stream;
  }
}
