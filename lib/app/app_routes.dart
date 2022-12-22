import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/home/pages/video/video_view.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String videoView = "/video_view";


}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
       case Routes.videoView :

        var path = settings.arguments as String;
        return getPage(
          settings: settings, 
          child: VideoView(videoPath: path));
      default :
        return unDefinedRoute();
    }
  }


  static PageRouteBuilder getPage({required RouteSettings settings, required Widget child}){
    return PageRouteBuilder(
      pageBuilder: (_,__,___)=>child,
      settings: settings,
      transitionsBuilder: (_,animation,secondaryAnimation,child)=>FadeTransition(opacity: animation, child: child,)
    );
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
      const Scaffold(
        body: Center(
          child: Text("No Routes Found"),
        ),
      )
    );
  }

}
