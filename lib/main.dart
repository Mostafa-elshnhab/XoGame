import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/cubit.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/XO/First/first.dart';
import 'Shared/Cubit/cubit_observe.dart';
import 'Style/Themes/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider(
      create: (context)=>AppCubit()..getMode(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
              title: 'XO Game',
              debugShowCheckedModeBanner: false,
              theme: Themes.themeData(AppCubit.get(context).isDark),
              home:const First());
        },

      ),
    );
  }
}
