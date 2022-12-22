import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_encoder/presentation/home/bloc/dashboard_bloc.dart';
import 'package:video_encoder/presentation/home/pages/dashboard/dashboard_view.dart';

import '../presentation/resources/theme_manager.dart';
import 'app_routes.dart';
import 'cubits/themes_cubit.dart';

class App extends StatelessWidget {

  const App._internal();
  static const _instance = App._internal();
  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(
      widget: BlocProvider(
        create: (_)=>DashboardBloc(),
        child: const DashboardView()
      ), 
      title: 'Instrive', buildContext: context);
  }

  Widget getMaterialApp({required Widget widget, required String title, required BuildContext buildContext}){
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>ThemesCubit()..getTheme())
        ],
        child: BlocBuilder<ThemesCubit, String>(
                builder: (_, theme){
                  return MaterialApp(
                      title: title,
                      debugShowCheckedModeBanner: false,
                      home: widget,
                      onGenerateRoute: RouteGenerator.getRoute,
                      theme: getApplicationTheme(theme)
                  );
                }
        )
    );
  }

  Future<void> navigateTo({required BuildContext context, required String routeName})async{
    await Navigator.of(context).pushNamed(routeName);
    return;
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

}
