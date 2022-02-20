import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Modules/XO/WithAi/gameWithAi.dart';
import 'package:flutter_app/Shared/Cubit/AppCubit/states.dart';
import 'package:flutter_app/Shared/reusable/reusable%20components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  String? character = 'x';
  final _random =  Random();
  bool isX=true;
  var isClick = List.filled(9, false);
  final isMyX = List.filled(9, true);
  var filledNum = List.filled(9, 2);
  int xNum=0;
  int oNum=0;
  int draw=0;
  int clickNum=0;
  bool stop=false;
  onRadioChange(value, context) {
    character = value;
    isX=!isX;
    emit(RadioState());
  }
  changeClick  (int num,context,bool isFriend)
  {
    if(isFriend||stop==true){
      stop=false;
      clickNum=clickNum+1;
      if( myCharacter=='x')
      {
        isMyX[num]=true;
        filledNum[num]=0;
        myCharacter='o';
      }
      else
      {
        isMyX[num]=false;
        filledNum[num]=1;
        myCharacter='x';
      }
      isClick[num]=!isClick[num];
      emit(ClickState());
      for(int i =0; i <9;i++)
      {
        if(i<3)
        {
          if(filledNum[i]==filledNum[i+3]&&filledNum[i]==filledNum[i+6])
          {
            if(filledNum[i]==0)
            {
              stop=true;
              xDialog(context);
            }
            if(filledNum[i]==1)  {
              stop=true;
              oDialog(context);
            }
          }
          if(i==0)
          {
            if(filledNum[i]==filledNum[i+4]&&filledNum[i]==filledNum[i+8])
            {
              if(filledNum[i]==0)
              {
                stop=true;
                xDialog(context);
              }
              if(filledNum[i]==1)  {
                stop=true;
                oDialog(context);
              }
            }
          }
          if(i==2)
          {
            if(filledNum[i]==filledNum[i+2]&&filledNum[i]==filledNum[i+4])
            {
              if(filledNum[i]==0)
              {
                stop=true;
                xDialog(context);
              }
              if(filledNum[i]==1)  {
                stop=true;
                oDialog(context);
              }
            }
          }
        }
        if(i==0||i==3||i==6)
        {

          if(filledNum[i]==filledNum[i+1]&&filledNum[i]==filledNum[i+2])
          {
            if(filledNum[i]==0)
            {
              stop=true;
              xDialog(context);
            }
            if(filledNum[i]==1)  {
              stop=true;
              oDialog(context);
            }
          }
        }

      }
      if(clickNum==9)
      {
        stop=true;
        if(draw==0)
        {
          ShowAlertDialog(
            context: context,
            title: 'X & O Draw',
            draw: true,
            again:(){again(character!);
            Navigator.of(context).pop();
            },
          );
        }
      }

    }
    else {

      clickNum = clickNum + 1;
      if (myCharacter == 'x') {
        isMyX[num] = true;
        filledNum[num] = 0;
        myCharacter = 'o';
      }
      else {
        isMyX[num] = false;
        filledNum[num] = 1;
        myCharacter = 'x';
      }
      isClick[num] = !isClick[num];
      emit(ClickState());
      for (int i = 0; i < 9; i++) {
        if (i < 3) {
          if (filledNum[i] == filledNum[i + 3] &&
              filledNum[i] == filledNum[i + 6]) {
            if (filledNum[i] == 0) {
              stop=true;
              xDialog(context);
            }
            if (filledNum[i] == 1) {
              stop=true;
              oDialog(context);
            }
          }
          if (i == 0) {
            if (filledNum[i] == filledNum[i + 4] &&
                filledNum[i] == filledNum[i + 8]) {
              if (filledNum[i] == 0) {
                stop=true;
                xDialog(context);
              }
              if (filledNum[i] == 1) {
                stop=true;
                oDialog(context);
              }
            }
          }
          if (i == 2) {
            if (filledNum[i] == filledNum[i + 2] &&
                filledNum[i] == filledNum[i + 4]) {
              if (filledNum[i] == 0) {
                stop=true;
                xDialog(context);
              }
              if (filledNum[i] == 1) {
                stop=true;
                oDialog(context);
              }
            }
          }
        }
        if (i == 0 || i == 3 || i == 6) {
          if (filledNum[i] == filledNum[i + 1] &&
              filledNum[i] == filledNum[i + 2]) {
            if (filledNum[i] == 0) {
              stop=true;
              xDialog(context);
            }
            if (filledNum[i] == 1) {
              stop=true;
              oDialog(context);
            }
          }
        }
      }
      if (clickNum == 9) {
        stop=true;
        if (draw == 0) {
          ShowAlertDialog(
            context: context,
            title: 'X & O Draw',
            draw: true,
            again: () {
              again(character!);
              Navigator.of(context).pop();
            },
          );
        }
      }
      List? availableFields=[];
      int? nextNum;
      for(int z=0;z<9;z++)
      {

        if (isClick[z]==false)
        {
           availableFields.add(z);
        }
        if(z<3)
        {
          if ((filledNum[z]==filledNum[z+3])&&(filledNum[z]==0||filledNum[z]==1))
          {
            if(isClick[z+6]==false)
            {
              nextNum=z+6;
            }
          }
          if((filledNum[z]==filledNum[z+6])&&(filledNum[z]==0||filledNum[z]==1))
          {
            if(isClick[z+3]==false)
            {
              nextNum=z+3;
            }
          }
          if((filledNum[z+3]==filledNum[z+6])&&(filledNum[z+3]==0||filledNum[z+3]==1))
          {
            if(isClick[z]==false)
            {
              nextNum=z;
            }
          }
          if (z == 0) {
            if ((filledNum[z] == filledNum[z + 4])&&(filledNum[z]==0||filledNum[z]==1) ) {
              if(isClick[z+8]==false)
              {
                nextNum=z+8;
              }

            }
            if((filledNum[z] == filledNum[z + 8])&&(filledNum[z]==0||filledNum[z]==1) )
            {

              if(isClick[z+4]==false)
              {
                nextNum=z+4;
              }
            }
            if((filledNum[z+4] == filledNum[z + 8])&&(filledNum[z+4]==0||filledNum[z+4]==1))
            {

              if(isClick[z]==false)
              {
                nextNum=z;
              }
            }
          }
          if (z == 2) {

            if ((filledNum[z] == filledNum[z + 2])&&(filledNum[z]==0||filledNum[z]==1) ) {
              if(isClick[z+4]==false)
              {
                nextNum=z+4;
              }

            }
            if((filledNum[z] == filledNum[z + 4])&&(filledNum[z]==0||filledNum[z]==1) )
            {

              if(isClick[z+2]==false)
              {
                nextNum=z+2;
              }
            }
            if((filledNum[z+2] == filledNum[z + 4])&&(filledNum[z+2]==0||filledNum[z+2]==1))
            {

              if(isClick[z]==false)
              {
                nextNum=z;
              }
            }

          }
        }
        if (z == 0 || z == 3 || z == 6) {

          if ((filledNum[z] == filledNum[z + 1])&&(filledNum[z]==0||filledNum[z]==1)) {
            if(isClick[z+2]==false)
            {
              nextNum=z+2;
            }

          }
          if((filledNum[z] == filledNum[z + 2])&&(filledNum[z]==0||filledNum[z]==1))
          {

            if(isClick[z+1]==false)
            {
              nextNum=z+1;
            }
          }
          if((filledNum[z+1] == filledNum[z + 2])&&(filledNum[z+1]==0||filledNum[z+1]==1) )
          {

            if(isClick[z]==false)
            {
              nextNum=z;
            }
          }
        }
      }

      if(availableFields.isNotEmpty&&stop==false)
      {
        stop=true;
        nextNum ??= availableFields[_random.nextInt(availableFields.length)];
        Future.delayed(const Duration(seconds: 1), ()
        {
          changeClick(nextNum!, context, false);
        });
      }

    }

//    if(filledNum[0]==filledNum[1]&&filledNum[2]==filledNum[1]&&filledNum[0]==0||filledNum[0]==filledNum[3]&&filledNum[6]==filledNum[3]&&filledNum[0]==0||filledNum[0]==filledNum[4]&&filledNum[8]==filledNum[4]&&filledNum[0]==0)
//    {
//      print ('sasa');
//    }
  }
  bool isDark = false;

  void onStateChanged(bool isDarkModeEnabled) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = isDarkModeEnabled;
    prefs.setBool('idDark', isDark);
    emit(ChangeModeState());
  }

  void getMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('idDark') ?? false;
    emit(GetModeState());
  }
  void again(String character)
  {
    isClick =  List.filled(9, false);
    filledNum = List.filled(9, 2);
    clickNum=0;
    draw=0;
    stop=false;
    myCharacter=character;
    emit(AgainState());
  }

  void restart(String character)
  {
    xNum=0;
    oNum=0;
    again(character);

  }
  void xDialog(context)
  {
    xNum=xNum+1;
    draw=1;

    ShowAlertDialog(
      context: context,
      draw: false,
      title: 'X is the Winner',
      again:(){again(character!);
      Navigator.of(context).pop();
      },
    );
  }
  void oDialog(context)
  {
    oNum=oNum+1;
    draw=1;

    ShowAlertDialog(
      context: context,
      draw: false,
      title: 'O is the Winner',
      again:(){again(character!);
      Navigator.of(context).pop();
      },
    );
  }
}
