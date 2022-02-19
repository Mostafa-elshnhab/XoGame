import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Style/Icons/icon_broken.dart';
class Stone extends StatefulWidget {
  const Stone({Key? key}) : super(key: key);

  @override
  State<Stone> createState() => _HomeState();
}

class _HomeState extends State<Stone> {
  int im1=2;
  int im2=1;
  var rng = Random();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Image.asset('assets/images/${im1}a.png')),
                    Expanded(child: Image.asset('assets/images/$im2.png')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(onPressed: (){

                  setState(() {
                    im1= rng.nextInt(3)+1;
                    im2= rng.nextInt(3)+1;
                    print (im1);
                    print (im2);
                  });
                },child: const Icon(IconBroken.Play),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
