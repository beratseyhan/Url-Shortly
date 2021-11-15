import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const const_PurpleLabelTextColor = Color(0xFF431AA1);
const const_LightPurpleColor = Color(0xFF4B3F6B);
const const_GreyLabelTextColor = Color(0xFFFAF8FC);



class MyButton extends StatelessWidget {
  final String buttonTitle;
  final Function click;
   Color buttonColor;
   Color textColor;
  final double  borderSize;

   MyButton({ this.buttonTitle, this.click, this.borderSize,this.buttonColor,this.textColor}) ;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor, // background
        onPrimary: textColor, // foreground
      ),
      onPressed: click,
      child:
      Text(buttonTitle,
        style: GoogleFonts.solway
          (fontSize: 25.sp,fontWeight:
        FontWeight.w800,color: textColor),),
    );
  }
}
class CopyButton extends StatelessWidget {
  bool pressed=false;
  String buttonTitle;
  Function click;
  Color buttonColor;
  Color textColor;
  final double  borderSize;

  CopyButton({ this.buttonTitle, this.click, this.borderSize,this.buttonColor,this.textColor,this.pressed}) ;

  deneme(){
    buttonColor=Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        primary: buttonColor, // background
        onPrimary: textColor, //

      ),
      onPressed: click,
      child: Text(buttonTitle,
        style: GoogleFonts.solway
          (fontSize: 25.sp,fontWeight:
        FontWeight.w800,color: textColor),),
    );
  }


}
