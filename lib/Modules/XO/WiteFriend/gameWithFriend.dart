import 'package:day_night_switcher/day_night_switcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/Modules/XO/First/first.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/cubit.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/states.dart';
import 'package:flutter_app/Shared/reusable/reusable%20components.dart';
import 'package:flutter_app/Style/Colors/colors.dart';
import 'package:flutter_app/Style/Icons/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class GameWithFriend extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit= AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [
                      Row (

                        children: [
                       const   Expanded(
                            child: Center(
                              child: Text(
                                'X Player',
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ) ,
                            color:cubit.isDark? Colors.black:Colors.white,
                            elevation: 5,
                            child: SizedBox(
                              width: 70,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${cubit.xNum}',style: Theme.of(context).textTheme.caption,),
                                  Text('-',style: Theme.of(context).textTheme.caption,),
                                  Text('${cubit.oNum}',style: Theme.of(context).textTheme.caption,),
                                ],
                              ),
                            )

                          ),
                         const Expanded(child: Center(child: Text('O Player'))),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ) ,
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          color:cubit.isDark? Colors.black:Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                         child: Container(
                                        height: 90,
                                        color: cubit.isDark? Colors.black:Colors.white,
                                        child:cubit.isClick[0]?   Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child:cubit.isMyX[0]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                        ):const SizedBox(),
                                      ),
                                      onTap:cubit.isClick[0]?null:()
                                      {


                                        cubit.changeClick(0,context,true);
                                      },


                                    )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color:cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[1]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[1]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[1]?null:()
                                          {


                                            cubit.changeClick(1,context,true);
                                          },


                                        )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color: cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[2]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[2]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[2]?null:()
                                          {

                                            cubit.changeClick(2,context,true);
                                          },


                                        )),
                                  ],
                                ),
                                Container(
                                  height: 1.2,
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color: cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[3]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[3]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[3]?null:()
                                          {


                                            cubit.changeClick(3,context,true);
                                          },


                                        )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color:cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[4]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[4]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[4]?null:()
                                          {


                                            cubit.changeClick(4,context,true);
                                          },


                                        )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color:cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[5]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[5]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[5]?null:()
                                          {

                                            cubit.changeClick(5,context,true);
                                          },


                                        )),
                                  ],
                                ),
                                Container(

                                  height: 1.2,
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color: cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[6]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[6]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[6]?null:()
                                          {


                                            cubit.changeClick(6,context,true);
                                          },


                                        )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color: cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[7]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[7]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[7]?null:()
                                          {


                                            cubit.changeClick(7,context,true);
                                          },


                                        )),
                                    Container(
                                      width: 1.2,
                                      height: 90,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                          child: Container(
                                            height: 90,
                                            color:cubit.isDark? Colors.black:Colors.white,
                                            child:cubit.isClick[8]?   Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child:cubit.isMyX[8]? Image.asset('assets/images/x.png'):Image.asset('assets/images/o.png'),
                                            ):const SizedBox(),
                                          ),
                                          onTap:cubit.isClick[8]?null:()
                                          {

                                            cubit.changeClick(8,context,true);
                                          },


                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: FloatingActionButton(onPressed:  (){
                          modalBottomSheetMenu(context,cubit);
                        },child:  Icon(IconBroken.Setting,color:color4 ,)  ,backgroundColor: Colors.white,mini: true,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

  }
   void modalBottomSheetMenu( context,cubit) {
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
backgroundColor:cubit.isDark? Colors.black:Colors.white,
       shape: const RoundedRectangleBorder(

           borderRadius: BorderRadius.all(
              Radius.circular(40.0),



           )
         //  borderRadius: BorderRadius.circular(30.0),
       ),
       builder: (BuildContext context) {
         return FractionallySizedBox(
             heightFactor: 0.4,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
               const  SizedBox(height: 10,),
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   shape:RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40.0),
                   ) ,
                   elevation: 10,
                   child: MaterialButton(onPressed: (){
                      cubit.again(cubit.character);
                   },child:const Text('Again',style: TextStyle(fontWeight: FontWeight.w300),),height: 45,minWidth: 150,),
                 ),
           const      SizedBox(height: 10,),
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   shape:RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40.0),
                   ) ,
                   elevation: 10,
                   child: MaterialButton(onPressed: (){
                    cubit.restart(cubit.character);
                   },child:const Text('Restart',style: TextStyle(fontWeight: FontWeight.w300),),height: 45,minWidth: 150,),
                 ),
                 const SizedBox(height: 10,),
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   shape:RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40.0),
                   ) ,
                   elevation: 10,
                   child: MaterialButton(onPressed: (){
                     cubit.restart(cubit.character);
                     navTo(context,const  First());
                   },child:const Text('New Challenge',style: TextStyle(fontWeight: FontWeight.w300),),height: 45,minWidth: 150,),
                 ),
                const SizedBox(
                   height: 10,
                 ),
                SizedBox(
                   child: DayNightSwitcher(
                     isDarkModeEnabled: cubit.isDark,
                     onStateChanged: cubit.onStateChanged,
                   ),
                   width: 80,
                 ),
               ],
             )
         );
       },
     );
   }

}
