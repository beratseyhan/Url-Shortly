import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortly_url/GuidLine.dart';

import 'conts.dart';
class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key key}) : super(key: key);

  @override
  _Welcome_PageState createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w,vertical:15.h ),
          child: Stack(
            children: [
              Positioned(
                top: 10.h,
                left: 75.w,
                right: 75.w,
                child: Center(child:
                Container(
                  height: 40.h,


                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(

                      image: AssetImage(
                          'image/logo.jpg'),
                      fit: BoxFit.fill,
                    ), //DecorationImage
                  ),


                ),
                ),
              ),
              Positioned(
                  top: 120.h,
                  child: Container(
                    height: 300.h,
                    width: 396.w,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(

                        image: AssetImage(
                            'image/illustration.jpg'),
                        fit: BoxFit.cover,
                      ), //DecorationImage
                    ),


                  )),
              Positioned(
                  top: 450.h,
                  child: Container(
                    height: 300.h,
                    width: 396.w,

                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("More than Just",
                            style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
                            FontWeight.w800,color: Colors.black),),
                          Text("shorter links ",
                            style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
                            FontWeight.w800,color: Colors.black),),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text("Build your brand's recognation and get detailed insighs on how your linkks are proforming ,",
                            style: GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                            FontWeight.w600,color: Colors.black),textAlign:  TextAlign.center,),

                        ],
                      ),
                    )


                  )),
              Positioned(
                  top: 750.h,
                  child: Container(
                      height: 75.h,
                        width: 396.w,


                child: MyButton(textColor: Colors.white,buttonTitle: "START",buttonColor: Colors.cyan.shade200,click: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GuidLine()),
                  );
                },)

                  )),


    ],
    ),
        ),
      ),
    );
  }
}




