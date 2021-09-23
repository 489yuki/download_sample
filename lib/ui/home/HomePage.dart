import 'package:download_sample/ui/download_sample/download_sample_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) {
                        return DownloadSamplePage();
                      })
              );

            },
            child: Text('Download!'),
          ),
        ),
      ),
    );
  }
}
