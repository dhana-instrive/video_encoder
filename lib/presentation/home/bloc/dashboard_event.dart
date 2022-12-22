part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class PickVideo extends DashboardEvent {}

class CompressVideo extends DashboardEvent {
  final XFile file;

  CompressVideo({
    required this.file
  });
}
