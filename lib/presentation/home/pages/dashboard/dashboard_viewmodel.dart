

import 'package:image_picker/image_picker.dart';

class DashboardViewModel {

  DashboardViewModel._internal();
  static final _instance = DashboardViewModel._internal();
  factory DashboardViewModel() => _instance;


  XFile? pickedFile;
 

}