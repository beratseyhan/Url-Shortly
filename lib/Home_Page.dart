import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shortly_url/conts.dart';
import 'package:http/http.dart' as http;

import 'ShortedUrl.dart';
import 'model.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}
List<ShortedUrl> myList = List<ShortedUrl>.empty(growable: true);

class _Home_PageState extends State<Home_Page> {
  String copied = "";
bool isProcces=false;
String orgUrl;
String shortedLink;
String code;
var shortedUrl;
final myController = TextEditingController();
 void addListObject(ShortedUrl shortedUrl){



try{
if(myList.length==0){
  myList.add(shortedUrl);
  print("?????");
}
else {

  var myListFiltered = myList.where((e) => e.orginalLink ==shortedUrl.orginalLink);
  if (myListFiltered.length > 0) {

      showDialog(
          context: context,
          builder: (BuildContext builderContext) {
            _timer = Timer(Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });

            return AlertDialog(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),

                content: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5),
                    color:  Colors.grey.shade900,
                  ),
                  height: 30.h,
                  width: 30.h,
                  child: Text("Entered Url is Invalid",
                    style: GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                    FontWeight.w600,color: Colors.white),textAlign:  TextAlign.center,),
                )
            );
          }
      ).then((val){
        if (_timer.isActive) {
          _timer.cancel();
        }
      });


  } else {
    myList.add(shortedUrl);
  }

}



}
catch (e) {
  print(e.toString());
}
setState(() {
  isProcces=false;
});

 }
 void deleteListObject(ShortedUrl shortedUrl){
   myList.remove(shortedUrl);
 }



  Timer _timer;
  String url;
    Future checkUrl () async{
      setState(() {
        isProcces=true;
      });
    try{

      final response =await http.get(Uri.parse("https://api.shrtco.de/v2/shorten?url=${url}"));
      if(400!=response.statusCode){
        var result = webSiteModelFromJson(response.body);


        if(result.ok==false){
          showDialog(
              context: context,
              builder: (BuildContext builderContext) {
                _timer = Timer(Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                });

                return AlertDialog(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    contentPadding: EdgeInsets.only(top: 10.0),

                    content: Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5),
                        color:  Colors.grey.shade900,
                      ),
                      height: 30.h,
                      width: 30.h,
                      child: Text("Entered Url is Invalid",
                        style: GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                        FontWeight.w600,color: Colors.white),textAlign:  TextAlign.center,),
                    )
                );
              }
          ).then((val){
            if (_timer.isActive) {
              _timer.cancel();
            }
          });
        }
        else {

          print(result.ok);
          print(result.result.code);


           shortedUrl=new ShortedUrl(result.result.originalLink, result.result.code, result.result.fullShortLink);
           addListObject(shortedUrl);
        }
        if(mounted)
          setState(() {


          });

        return result;
      }
      else {
        print(response.statusCode);
        showDialog(
            context: context,
            builder: (BuildContext builderContext) {
              _timer = Timer(Duration(seconds: 2), () {
                Navigator.of(context).pop();
              });

              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  contentPadding: EdgeInsets.only(top: 10.0),

                content: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5),
                    color:  Colors.grey.shade900,
                  ),
                  height: 30.h,
                  width: 30.h,
                  child: Text("Entered Url is Invalid",
                    style: GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                    FontWeight.w600,color: Colors.white),textAlign:  TextAlign.center,),
                )
              );
            }
        ).then((val){
          if (_timer.isActive) {
            _timer.cancel();
          }
        });
      }
      setState(() {
        isProcces=false;
      });
    }


    catch (e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
            inAsyncCall: isProcces,
          child: myList.length ==0 ?Stack(
            children: [
              Positioned(
                top: 25.h,
                left: 91.w,
                right: 91.w,
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
                  top: 100.h,
                  left:25.w,
                  right: 0.w,
                  child: Container(
                    height: 300.h,


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

                  left:25.w,
                  right: 25.w,
                  top: 450.h,
                  child: Container(
                      height: 300.h,
                      width: 396.w,

                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Let's get Started",
                              style: GoogleFonts.solway(fontSize: 35.sp,fontWeight:
                              FontWeight.w800,color: Colors.black),),

                            SizedBox(
                              height: 30.h,
                            ),
                            Text("Paste your firs link into\n the field to shorten it",
                              style: GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                              FontWeight.w600,color: Colors.black),textAlign:  TextAlign.center,),

                          ],
                        ),
                      )


                  )),


              Positioned(
                  top: 600.h,
              child: Container(
                height: 300.h,
                width: 428.w,
                color:const_LightPurpleColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:50.w,vertical:60.h ),
                  child:Container(


                    child: Column(

                      children: [
                        Container(

                            height: 75.h,
                            width: 396.w,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),

                            child:
                            TextFormField(
                              onChanged: (value) {
                                url=value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(10.0.w, 10.h, 10.h, 10.w),


                                hintText: "Enter Url",
                                hintStyle:  GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                                FontWeight.w600,color: Colors.black)),
                              ),
                            ),


                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            height: 75.h,
                            width: 396.w,


                            child: MyButton(textColor: Colors.white,buttonTitle: "SHORTEN IT !",buttonColor: Colors.cyan.shade200,click: (){
                            setState(() {
                            checkUrl();
                            isProcces=true;
                            });
                            },)

                        ),
                      ],
                    ),
                  )
                ),
              ),


              ),

            ],
          ):
          Stack(
            children: [
              Positioned(
                top: 25.h,
                left: 91.w,
                right: 91.w,
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
                  top: 150.h,
                  right: 25.w,
                  left:  25.w,
                  child: Container(
                    height: 400.h,
                    width: 400.w,

                    child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 30.h),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          height: 200.h,
                          width: 400.w,

                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal:20.w,vertical:10.h ),
                            child: Container(

                                child:Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:Row(


                                        children: [
                                          Expanded(
                                              flex:4,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(


                                                    child: Center( child:  Text(myList[index].orginalLink, style: GoogleFonts.solway(fontSize: 17.5.sp,wordSpacing: 2,fontWeight: FontWeight.w700,color: Colors.black),)),

                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex:1,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,

                                                      decoration: BoxDecoration(

                                                        borderRadius: BorderRadius.circular(5),
                                                        image: DecorationImage(

                                                          image: AssetImage(
                                                              'image/del.jpg'),
                                                          fit: BoxFit.fill,
                                                        ), //DecorationImage
                                                      ),
                                                    ),
                                                    onTap: (){
                                                      print("object");
                                                      setState(() {
                                                        myList.removeWhere((element) => element.orginalLink=="${myList[index].orginalLink}");
                                                      });

                                                    },
                                                  ),
                                                ],
                                              )
                                          ),

                                        ],


                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 0),
                                      height: 10.h,
                                      width: 10000.h,
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: const_LightPurpleColor,width: 2.5.h))),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child:Column(


                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(


                                                    child: Text(myList[index].fullShortLink, style: GoogleFonts.solway(fontSize: 17.5.sp,wordSpacing: 2,fontWeight: FontWeight.w700,color: Colors.blue),),

                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Expanded(
                                              flex:3,
                                              child: Container(
                                                width: 1000.h,
                                                child: CopyButton(textColor:Colors.white ,buttonTitle: copied ==myList[index].fullShortLink? "COPIED":"COPY",buttonColor:copied ==myList[index].fullShortLink? const_LightPurpleColor:Colors.cyan.shade200,borderSize: 12,click: (){



                                                  print({myList[index].fullShortLink});
                                                  Clipboard.setData(ClipboardData(text:myList[index].fullShortLink));

                                                  setState(() {
                                                    copied = myList[index].fullShortLink;
                                                  });
                                                },),
                                              )
                                          ),

                                        ],


                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),

                  )),


              Positioned(
                top: 600.h,
                child: Container(
                  height: 300.h,
                  width: 428.w,
                  color:const_LightPurpleColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:50.w,vertical:60.h ),
                      child:Container(


                        child: Column(

                          children: [
                            Container(

                              height: 75.h,
                              width: 396.w,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),

                              child:
                              TextFormField(
                                onChanged: (value) {
                                  url=value;
                                },
                                controller: myController ,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10.0.w, 10.h, 10.h, 10.w),


                                    hintText: "Enter Url",
                                    hintStyle:  GoogleFonts.solway(fontSize: 20.sp,fontWeight:
                                    FontWeight.w600,color: Colors.black)),
                              ),
                            ),


                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                                height: 75.h,
                                width: 396.w,


                                child: MyButton(textColor: Colors.white,buttonTitle: "SHORTEN IT !",buttonColor: Colors.cyan.shade200,click: (){
                                  setState(() {
                                    checkUrl();
                                    isProcces=true;

                                  });
                                },)

                            ),
                          ],
                        ),
                      )
                  ),
                ),


              ),

            ],
          )
        ),
      ),
    );
  }
}
