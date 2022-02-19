
import 'package:flutter/material.dart';

void navTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navToAndFinish(context, Widget) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => Widget), (route) {
    return false;
  });
}


Widget customTextFormField(
    {required TextEditingController controller,
      required TextInputType inputType,
      Widget? prefixIcon,
      Widget? suffixIcon,
      String? labelText,
      TextStyle? labelStyle,
      required TextStyle style,
      Color? borderColor,
      BorderRadius? borderRadius,
      BorderRadius? focusedBorderRadius,
      Color? focusedBorderColor,
      FormFieldValidator<String>? validator,
      bool? obscureText}) {
  return Container(
    height: 70,
    child: TextFormField(

      style: style,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon?? SizedBox(),
        suffixIcon: suffixIcon ?? SizedBox(),
        labelText: labelText,
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderRadius: borderRadius!,
          borderSide: BorderSide(
            color: borderColor!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: focusedBorderRadius!,
          borderSide: BorderSide(
            color: focusedBorderColor!,
          ),
        ),
      ),
      validator: validator ??
              (val) {
            return null;
          },
      obscureText: obscureText ?? false,
    ),
  );
}
ShowAlertDialog(
    {required context, required title, required again ,required bool draw}) {
  AlertDialog alert = AlertDialog(
      title: Column(
        textDirection: TextDirection.rtl,
        children: [
         draw? Row(
            children: [
              Expanded(child: Image.asset('assets/images/x.png' )),
              SizedBox(width: 5,),
              Expanded(child: Image.asset('assets/images/o.png' )),
            ],
          ): Image.asset('assets/images/winner.jpg',width: double.infinity,fit: BoxFit.cover,),
         const SizedBox(
            height: 12,
          ),
          Text('$title', style: Theme.of(context).textTheme.bodyText2),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: again,
                child:const Text(
                  'Play Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoKufi',
                  ),
                ),
                color: Colors.lightBlueAccent,
              )),
          TextButton(
            child: Text(
              "ok",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
//
              Navigator.of(context).pop();
//
            },
          )
        ],
      ));

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
