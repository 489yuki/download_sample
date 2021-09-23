import 'dart:async';
import 'dart:io';

import 'package:download_sample/entity/video_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DownloadSampleModel {


  Future<void> downloadVideos(
      StreamController<double> stream,
      List<VideoData> downloadVideoDataList,
      ) async {
    //アプリのディレクトリのpathをここで取得
    final _directory = await getApplicationDocumentsDirectory();
    String _localPath = _directory.path;

    //ダウンロードの途中だった場合、Directoryはすでに存在しているので作る必要がないため
    if (await Directory('$_localPath/videos').exists() == false) {
      //rootのディレクトリの配下にディレクトリを新たに作る
      var _newDirectory = Directory('$_localPath/videos');
      await _newDirectory.create(recursive: true);
    }

    double _progress = 0;
    final List<double> _progressList = [];

    for (int i = 0; i < downloadVideoDataList.length; i++) {
      //urlは動画が置いてあるurl,fileNameは保存する動画のファイル名(拡張子も含める),directoryは動画を保存したdirectory名
      var _req =
      http.Request('GET', Uri.parse(downloadVideoDataList[i].videoUrl));
      final http.StreamedResponse response =
      await http.Client().send(_req).timeout(Duration(seconds: 10));
      final _contentLength = response.contentLength;

      late bool _isDownloaded;

      //i番目の動画がすでにダウンロード済かどうか確認
      _isDownloaded =
      await File('$_localPath/videos/${downloadVideoDataList[i].videoName}')
          .exists();
      //ダウンロード済だった場合
      if (_isDownloaded == true &&
          //_isDownloadedだけではダウンロード済みでも前回のダウンロードが完全でなかった場合、動画として不完全な物になってしまうため、データ量で判定
          File('$_localPath/videos/${downloadVideoDataList[i].videoName}')
              .lengthSync() ==
              _contentLength) {
        _progress = 0;
        _progressList.add(0);
        _progressList[i] = 100;
        _progressList.forEach((element) {
          _progress = _progress + element / downloadVideoDataList.length;
        });
        stream.sink.add(_progress);
      }
      //ダウンロード済でなかった場合
      else {
        List<int> bytes = [];

        //$_localPath/$directory/はダウンロードするファイルを保存する場所のpath
        File file = new File(
            '$_localPath/videos/${downloadVideoDataList[i].videoName}');

        //i番目のダウンロードの進捗情報を追加
        _progressList.add(0);

        try {
          response.stream.listen(
                (List<int> newBytes) {
              bytes.addAll(newBytes);
              final downloadLength = bytes.length;
              _progressList[i] = 100 * downloadLength / _contentLength!;
              _progress = 0;
              _progressList.forEach((element) {
                _progress = _progress + element / downloadVideoDataList.length;
              });
              stream.sink.add(_progress);
            },
            onDone: () async {
              await file.writeAsBytes(bytes);
            },
          );
        } catch (e) {
          print(e);
        }
      }
    }
  }
}