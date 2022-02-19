import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Modules/XO/Second/second.dart';
import 'package:flutter_app/Modules/XO/WiteFriend/gameWithFriend.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/cubit.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/states.dart';
import 'package:flutter_app/Shared/reusable/reusable%20components.dart';
import 'package:flutter_app/Style/Colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state)
      {
        var cubit = AppCubit.get(context);
        return Scaffold
          (
          body: SafeArea(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/xo.png',height: 200,width: 250,),
                const SizedBox(
                  height: 20,
                ),
                Text ('Choose your play mode',style:Theme.of(context).textTheme.button!.copyWith(color:color4,fontWeight: FontWeight.w400 ),),
                const SizedBox(
                  height: 40,
                ),
                Card(
                  color: color4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ) ,
                  elevation: 10,
                  child: MaterialButton(onPressed: (){
                    navTo(context, const Second());
                  },child:const Text('With Ai',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),),height: 45,minWidth: 150,),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ) ,
                  elevation: 10,
                  child: MaterialButton(onPressed: (){
                    navToAndFinish(context,GameWithFriend());
                  },child:const Text('With a Friend',style: TextStyle(fontWeight: FontWeight.w300),),height: 45,minWidth: 150,),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    child: DayNightSwitcher(
                      isDarkModeEnabled: cubit.isDark,
                      onStateChanged: cubit.onStateChanged,
                    ),
                    width: 50,
                  ),
                )
              ],
            ),
          )),
        );
      },

    );
  }
}
