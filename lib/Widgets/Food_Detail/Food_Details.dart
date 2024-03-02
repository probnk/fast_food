import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Const/Foods.dart';
import 'package:fast_food/Widgets/Home/Home_Page.dart';
import 'package:flutter/material.dart';

class Food_Details extends StatelessWidget {
  final foods food;
   Food_Details({super.key, required this.food});

   _body(BuildContext context) {
     return ListView(
       children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                color: Colors.grey.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal:5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(
                                onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                icon: Icon(Icons.arrow_back_ios,size: 28,color: Colors.grey.shade900,)
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite,size: 28,color: Colors.red.shade300,)
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  color: Colors.grey.shade50,
                  height: 200,
                  width: 300,
                  margin: EdgeInsets.only(top: 100,left: 35),
                  child: Image.asset("assets/images/${food.url}")
              ),
              Container(
                margin: EdgeInsets.only(top: 300),
                padding: EdgeInsets.only(left: 15,right: 15,top: 40),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Text("${food.title}",
                            style: heading2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.alarm,color: Colors.red.shade200,size: 20,),
                            Text(" 10-15 Mins",
                              style: heading1,
                            ),
                          ],
                        )
                      ],
                    ),
                    Text("\nSpicy Cheezy Chicken Zinger Burger with Extra Cheeze and Fresh Salad",
                      style: subtitle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\nToping for you",
                          style: heading2,
                        ),
                        Text("\nClear",
                          style: clear,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
       ],
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey.shade50,
        body: _body(context)
    );
  }
}
