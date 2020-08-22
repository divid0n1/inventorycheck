import 'dart:async';
import 'dart:io';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';


class Recordermn extends StatefulWidget {

  final LocalFileSystem localFileSystem;

  Recordermn({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  RecordermnState createState() => RecordermnState();
}

class RecordermnState extends State<Recordermn> {



  FlutterAudioRecorder Rrecorder;
  Recording Rcurrent;
  RecordingStatus RcurrentStatus = RecordingStatus.Unset;
//  _RecordermState({t})


  Recinit() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions
      ) {
        String customPath = '/flutter_audio_recorder_';
        Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (Platform.isIOS) {
          appDocDirectory = await getTemporaryDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
//          getExternalStorageDirectory
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        Rrecorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await Rrecorder.initialized;
        // after initialization
        var current = await Rrecorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          Rcurrent = current;
          RcurrentStatus = current.status;
          print(RcurrentStatus);
        });
      } else {
        print('ou must accept permission');
//        Scaffold.of(context).showSnackBar(
//            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  Recstart() async {
    try {
      await Rrecorder.start();
      var recording = await Rrecorder.current(channel: 0);
      setState(() {
        Rcurrent = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (RcurrentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await Rrecorder.current(channel: 0);
        // print(current.status);
        setState(() {
          Rcurrent = current;
          RcurrentStatus = Rcurrent.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Recstop() async {
    var result = await Rrecorder.stop();
    print("Stop recording: ${result.path}");
    print("Stop recording: ${result.duration}");
    File file = widget.localFileSystem.file(result.path);
    print("File length: ${await file.length()}");
    setState(() {
      Rcurrent = result;
      RcurrentStatus = Rcurrent.status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
