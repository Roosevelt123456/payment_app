
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widget/button.dart';
import 'package:payment_app/widget/large_buttons.dart';
import 'package:payment_app/widget/text_size.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundcolor
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        width: w,
        child: Stack(
children: [
//call your function()
_headSection(),
  _listBills(),
  _payButton(),

],
        ),
      ),
    );
  }
  //create a function()
_headSection(){
//return a container
return Container(
  height: 250,
//color: Colors.red,
child: Stack(
  children: [
    //call the function for mainBackground()
    _mainBackground(),
    //for the curve image on the header
    _curveImageContainer(),
    //button container function()
    _buttonContainer(),
    _textContainer(),
  ],
),
);
}

_buttonContainer(){
   return Positioned(
     bottom: 13,
     right: 51,
     child: GestureDetector(
       onTap: (){
         showModalBottomSheet<dynamic>(
           isScrollControlled: true,
           backgroundColor: Colors.transparent,
             barrierColor: Colors.transparent,
             
             context: context, 
             builder: (BuildContext bc){

           //return something
           return Container(
             height: MediaQuery.of(context).size.height-180,
             child: Stack(
               children: [
                 Positioned(bottom: 0,

                     child: Container(
                       //color:Colors.cyan ,
                   color: Color(0xFFeeF1f4).withOpacity(0.7),
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height-240,
                 )),
                 Positioned(
                   top: 0,
                     right: 52,
                     child: Container(
                       padding: const EdgeInsets.only(top: 5,bottom: 25),
                    width: 60,
                   height: 250,
                   decoration: BoxDecoration(
                     color: AppColor.mainColor,
                     borderRadius: BorderRadius.circular(29)
                   ),
                       child: Column(
                         mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                         children: [
                           AppButtons(icon: Icons.cancel,
                             iconColor: AppColor.mainColor,
                             backgroundColor: Colors.white,
                             onTap: (){
                             Navigator.pop(context);
                             },
                           ),

                           AppButtons(icon: Icons.add,
                             iconColor: AppColor.mainColor,
                             textColor: Colors.white,
                             backgroundColor: Colors.white,
                             onTap: (){},
                             text: "Add Bill",
                           ),
                           AppButtons(icon: Icons.history,
                             iconColor: AppColor.mainColor,
                             textColor: Colors.white,
                             backgroundColor: Colors.white,
                             onTap: (){},
                               text: " History",
                           ),
                         ],
                       ),
                 ))
               ],
             ),
           );
         });
       },
       child: Container(
         height: 60,
         width: 60,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage(
               "images/lines.png"
             )
           ),
           boxShadow: [
             BoxShadow(
               blurRadius: 15,
               offset: Offset(0,1),
               color: Color(0xFF11324d).withOpacity(0.2)
             )
           ]
         ),
       ),
     ));
}

_mainBackground(){
return Positioned(
  bottom: 10,
    left: 0,
    child: Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
   //use boxfit.fill to arrange the item
fit: BoxFit.cover,
          image: AssetImage(
            "images/momo.jpg"
          )
        )
      ),
    ),
);
}
_curveImageContainer(){
    return Positioned(
      left: 0,
        right: -2,
        bottom: 10,
        child:Container(
          height: MediaQuery.of(context).size.height*0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                //use boxfit.fill to arrange the item
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/curve.png"
                  )
              )
          ),
        ), );
}
_listBills(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 250,
        child: MediaQuery.removePadding(
        removeTop: true,
          context: context,
          child: ListView.builder(
           itemCount: 3,
            itemBuilder: (_,index){
             return Container(
              //margin
              margin: const EdgeInsets.only(top:20,right: 20),
              height: 110,
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              ),
              //Apply shadow
              boxShadow: [
              BoxShadow(
              color: Color(0xFFd8dbe0),
              offset: Offset(1,1),
              blurRadius: 20.0,
              spreadRadius: 10
              )
              ]
              ),
//puting text in to the card
              child: Container(
              margin: const EdgeInsets.only(top:10,left: 18),
              //The Row for items(the main row)

              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              //first column for items
              Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
              children: [
              Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //set border for pizza.jpg
              border: Border.all(
              width: 3,
              color: Colors.grey,
              ),
              image: DecorationImage(
              //use boxfit.fill to arrange the item
              fit: BoxFit.cover,
              image: AssetImage(
              "images/pizza.jpg"
              )
              )
              ),
              ),


              //space between text
              SizedBox(width: 10,),
              Column(
              //place items at the beginning
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
              Text(
              "Pizza Food",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.mainColor,
              ),
              ),
              Text(
              "ID:34526",
              style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColor.idColor,
              ),
              )
              ],
              ),
              //Call the text_size class
              ],
              ),
              SizedText(text: "auto Pay on 24th May 18",color:AppColor.green),
              SizedBox(height: 5,),
              ],
              ),
              //The Right side items
              Row (
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.selectBackground
              ),
              child: Center(
              child: Text(
              "Select",
              style: TextStyle(
              fontSize: 16,
              color: AppColor.selectColor

              ),
              ),
              ),
              ),
              Expanded(child: Container()),
              Text(
              "\$1235.00",
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColor.mainColor

              ),
              ),
              Text(
              "due in 3 days",
              style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColor.idColor

              ),
              ),
              SizedBox(height: 10,)
              ],

              ),

              SizedBox(width: 5,),

              Container(
              width: 5,
              height: 35,
              decoration: BoxDecoration(
              color: AppColor.halfOval,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30)
              )
              ),
              )
              ],
              )
              ],
              ),
              ),

             );
            },

          ),
        ));

}

_payButton(){

    return Positioned(
      bottom: 20,
        child: AppLargeButton(text: "Pay all bills",
          textColor: Colors.white,onTap: (){
          Get.to(()=>PaymentPage());
          },));
}
_textContainer(){
    return Stack(
children: [
  Positioned(
      left: 0,
      top: 100,
      child: Text(
        "My Bills",
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: Color(0xFF293952).withOpacity(0.5),
        ),
      )),
  //_textContainer(),
  Positioned(
      left: 40,
      top: 80,
      child: Text(
        "My Bills",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )),
],
    );
}
}
