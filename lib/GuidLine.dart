import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortly_url/Home_Page.dart';
class GuidLine extends StatefulWidget {

  const GuidLine({Key key}) : super(key: key);

  @override
  _GuidLineState createState() => _GuidLineState();
}

class _GuidLineState extends State<GuidLine> {
  int currentSliderPage=0;
  List<Widget> pagesArray = [
    Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Brand Recogniton",
              style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
              FontWeight.w800,color: Colors.black),),
              SizedBox(
                height: 20.h,
              ),
            Text("Boss your brand recognition with each click.Generic link "
                "dont'mean a thing .Branded Links Help instil confidence in our content",textAlign:TextAlign.center,
              style: GoogleFonts.solway(fontSize: 17.5.sp,height: 1.5,wordSpacing: 2,fontWeight: FontWeight.w700,color: Colors.black,),),

          ],
        ),
      ),
    ),
    Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Datailed Records",
              style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
              FontWeight.w800,color: Colors.black),),
            SizedBox(
              height: 20.h,
            ),
            Text("Boss your brand recognition with each click.Generic link "
                "dont'mean a thing .Branded Links Help instil confidence in our content",textAlign:TextAlign.center,
              style: GoogleFonts.solway(fontSize: 17.5.sp,height: 1.5,wordSpacing: 2,fontWeight: FontWeight.w700,color: Colors.black,),),

          ],
        ),
      ),
    ),

    Container(
     child: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("Fully Customizable",
             style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
             FontWeight.w800,color: Colors.black),),
           SizedBox(
             height: 20.h,
           ),
  Text("Improve brand awareness and content discoverability throught customizable links,superchargeging audience engagement",textAlign:TextAlign.center,
  style: GoogleFonts.solway(fontSize: 17.5.sp,height: 1.5,wordSpacing: 2,fontWeight: FontWeight.w700,color: Colors.black,),),

         ],
       ),
     ),
    ),

  ];
  @override
  Widget build(BuildContext context) {

    _onPageViewChange(int page) {
      print("Current Page: " + page.toString());

      setState(() {
        currentSliderPage=page;
        print("zzz " + currentSliderPage.toString());
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w,vertical:15.h ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 16.w,
                right: 16.w,
                child: Center(child:
                Text("Shortly",
                  style: GoogleFonts.solway
                    (fontSize: 25.sp,fontWeight:
                  FontWeight.w800,color: Colors.black),),
                ),
              ),


              Positioned(
                  top: 150.h,
                  right: 25.w,
                  left:  25.w,
                  child: Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    height: 350.h,
                    width: 350.w,

                  child:  Padding(
                  padding:EdgeInsets.only(left :25.w,top: 120.h,bottom: 10.h,right: 25.w),
                child:  PageView(
                  children: pagesArray ,

                  onPageChanged: _onPageViewChange,
                )
              ),


                  )),
              Positioned(
                  top: 100.h,

                  right: 25.w,
                  left:  25.w,
                  child:Container(
                    height: 120.h,

                    decoration: BoxDecoration(
                        color: Colors.purple.shade900,
                        shape: BoxShape.circle
                    ),
                  )
              ),
              Positioned(
                  top: 650.h,

                  right: 25.w,
                  left:  25.w,
                  child:Container(
                    height: 50.h,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,

                          decoration: BoxDecoration(
                              color: currentSliderPage == 0
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade500,
                              shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              color: currentSliderPage == 1
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade500,
                              shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              color: currentSliderPage == 2
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade500,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Positioned(
                  top: 700.h,

                  right: 25.w,
                  left:  25.w,
                  child:Container(
                    height: 50.h,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home_Page()),
                          );
                        },
                        child:  Text("Skip",textAlign:TextAlign.center,
                          style: GoogleFonts.solway(fontSize: 17.5.sp,height: 1.5,wordSpacing: 2,fontWeight: FontWeight.w500,color: Colors.black,),),

                      )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
