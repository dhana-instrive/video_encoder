part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class VideoPicking extends DashboardState {}

class VideoPicked extends DashboardState {
  final XFile file;
  VideoPicked({
    required this.file
  });
}

class VideoPickFailed extends DashboardState {}

class Compressing extends DashboardState {}

class CompressionFailed extends DashboardState {}

class CompressionSuccess extends DashboardState {
  final String filePath;

  CompressionSuccess({
    required this.filePath
  });
}
