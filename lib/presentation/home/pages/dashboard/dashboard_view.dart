

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_encoder/app/app_routes.dart';
import 'package:video_encoder/presentation/home/bloc/dashboard_bloc.dart';
import 'package:video_encoder/presentation/home/pages/dashboard/dashboard_viewmodel.dart';
import 'package:video_encoder/presentation/widgets/buttonWL.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  late DashboardViewModel _viewModel;

  @override
  void initState() {
    _viewModel = DashboardViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            BlocConsumer<DashboardBloc, DashboardState>(
              listener: (_,state){
                if(state is CompressionSuccess){
                  Navigator.pushNamed(context, Routes.videoView, arguments: state.filePath);
                }else if(state is CompressionFailed){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Compression failure"))
                  );
                }
              },
              builder: (_, state){
                if(state is VideoPicked){
                  _viewModel.pickedFile = state.file;
                }
                
                return ButtonWL(
                  text: state is VideoPicked ? "Compress Video" :   "Pick Video",
                  isLoading: state is VideoPicking || state is Compressing, 
                  onPressed: ()=>context.read<DashboardBloc>().add(
                    state is VideoPicked
                    ? CompressVideo(file: _viewModel.pickedFile!)
                    : PickVideo())
                );
              },
            ),

            
          ],
        ),
      ),
    );
  }
}