import 'package:flutter/material.dart';
import 'package:flutter_app/Modules/XO/WiteFriend/gameWithFriend.dart';
import 'package:flutter_app/Modules/XO/WithAi/gameWithAi.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/cubit.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/states.dart';
import 'package:flutter_app/Shared/reusable/reusable%20components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column (
                    children:  [

                      const  Text('Pick your side '),
                      const   SizedBox(height: 50,),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/x.png',width: 100,color: cubit.isX? const Color.fromRGBO(255, 255, 255, 1): const Color.fromRGBO(255, 255, 255, .5),
                                    colorBlendMode: BlendMode.modulate),
                              const  SizedBox(
                                  height: 20,
                                ),
                                Radio(

                                  value: 'x',
                                  groupValue:cubit.character ,
                                  activeColor:const Color(0xFF6200EE),
                                  onChanged:(value)
                                  {
                                    cubit.onRadioChange(value, context);
                                  }  ,
                                ),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/o.png',width: 100, color: cubit.isX?const Color.fromRGBO(255, 255, 255, .5):const Color.fromRGBO(255, 255, 255, 1),
                                    colorBlendMode: BlendMode.modulate),
                              const  SizedBox(
                                  height: 20,
                                ),
                                Radio(
                                  value: 'o',
                                  groupValue: cubit.character,
                                  activeColor:const Color(0xFF6200EE),
                                  onChanged:(value)
                                  {

                                    cubit.onRadioChange(value, context);
                                  }  ,
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      const   SizedBox(
                        height: 40,
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ) ,
                        elevation: 10,
                        child: MaterialButton(onPressed: (){
                          navToAndFinish(context, GameWithAi(character: cubit.character,));
                        },child:const Text('Continue',style: TextStyle(fontWeight: FontWeight.w300),),height: 45,minWidth: 150,),
                      ),
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
}
