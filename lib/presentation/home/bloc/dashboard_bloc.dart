import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/statistics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<PickVideo>(_onPickVideo);
    on<CompressVideo>(_onCompressVideo);
  }

  void _onCompressVideo(CompressVideo event, Emitter emit)async{
    emit(Compressing());

    try{

      Directory? tempDir = await getApplicationDocumentsDirectory();
      String tempPath = tempDir.path;
      var outputFile = "$tempPath/${DateTime.now().millisecondsSinceEpoch}.mp4";
      Stopwatch s = Stopwatch();
      s.start();
      var session = await FFmpegKit.executeAsync('-i "${event.file.path}" -vf scale=100:-1 -c:v libx264 $outputFile');

      final returnCode = await session.getReturnCode();
      final startTime = session.getStartTime();
      final endTime = await session.getEndTime();
      final duration = await session.getDuration();

      print(s.elapsedMilliseconds);
      s.stop();

      await uploadToStorage(File(outputFile));

      // Console output generated for this execution
      final output = await session.getOutput();
      emit(CompressionSuccess(filePath: outputFile));
      print(output);
    }catch(e){
      print(e);
    }
  }


  Future<void> uploadToStorage(File file) async {
    try {

      Reference ref = FirebaseStorage.instance.ref().child("video").child(DateTime.now().millisecondsSinceEpoch.toString());
      TaskSnapshot taskSnapshot = await ref.putFile(file, SettableMetadata(contentType: 'video/mp4'));

      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print(downloadUrl);

    } catch (error) {
      print(error);
    }

    return;
}

  void _onPickVideo(PickVideo event, Emitter emit) async{
    emit(VideoPicking());

    try{
      final ImagePicker picker = ImagePicker();
      final XFile? file =  await picker.pickVideo(source: ImageSource.gallery);
      if(file!=null){
        emit(VideoPicked(file: file));
      }else{
        emit(VideoPickFailed());
      }
    }catch(e){
      emit(VideoPickFailed());
    }

  }
}
