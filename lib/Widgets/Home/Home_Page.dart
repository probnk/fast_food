import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Widgets/Home/Tabs/Burger.dart';
import 'package:fast_food/Widgets/Home/Tabs/Deals.dart';
import 'package:fast_food/Widgets/Home/Tabs/Fries.dart';
import 'package:fast_food/Widgets/Home/Tabs/Pizza.dart';
import 'package:fast_food/Widgets/Home/Tabs/Soft_Drinks.dart';
import 'package:fast_food/Widgets/Pizza%20Adds/Adds.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: DefaultTabController(
          initialIndex: 0,
          length: 5,
          child: ListView(
            children: [
              appbar(),
              SizedBox(height: 20,),
              SizedBox(
                  height:250,
                  child: Pizza_Adds()
              ),
              FoodbuttonsList(),
              SizedBox(
                height: 260,
                child: TabBarView(
                    children: [
                      Pizza(),
                      Burger(),
                      Fries(),
                      Soft_Drinks(),
                      Deal()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  appbar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: white,
                child: IconButton(
                  padding: EdgeInsets.all(5),
                    onPressed: () {},
                    icon: Icon(Icons.menu,color:black,)),
              ),
              Text('Food Cafe',
                  style: main_heading,
              ),
              Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/men1.jpg")),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  height: 60,
                  width: 250,
                  child: TextField(
                   decoration: InputDecoration(
                     prefixIcon: IconButton(
                         onPressed: () {},
                         icon: Icon(Icons.search),color: grey,),
                     hintText: 'Healthy Food',
                     hintStyle: heading1,
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Colors.transparent)
                     ),
                     fillColor: Color(0xffF9F9F9),
                     filled: true,
                   ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                elevation: 3,
                color: white,
                child: Container(
                  margin: EdgeInsets.all(4),
                  child: IconButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {},
                      icon: Icon(Icons.sort,color:black,size: 30,)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  FoodbuttonsList(){
    return ButtonsTabBar(
      splashColor: Colors.yellow,
      elevation: 3,
      buttonMargin: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
      unselectedBackgroundColor: Color(0xffF9F9F9),
      physics: ClampingScrollPhysics(),
      radius: 40,
      height: 60,
      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
        color: yellow,
        borderRadius: BorderRadius.circular(40)
      ),
        tabs: [
          Tab(
            child: Row(
                children: [
                  Container(
                      margin:EdgeInsets.all(2),
                      padding:EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("assets/images/piz.png",height: 40,width: 40,)),
                  SizedBox(width: 3,),
                  Text("Pizza",
                    style: heading1,
                  )
                ],
              ),
            ),
          Tab(
              child: Row(
                children: [
                  Container(
                      padding:EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("assets/images/burger.png",height: 40,width: 40,)),
                  SizedBox(width: 8,),
                  Text("Burgers",
                    style: heading1,
                  )
                ],
              ),
            ),
          Tab(
              child: Row(
                children: [
                  Container(
                      padding:EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("assets/images/fries.png",height: 40,width: 40,)),
                  SizedBox(width: 7),
                  Text("Fries",
                    style: heading1,
                  )
                ],
              ),
          ),
          Tab(
              child: Row(
                children: [
                  Container(
                      padding:EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("assets/images/drink.png",height: 40,width: 40,)),
                  SizedBox(width: 7),
                  Text("Drinks",
                    style: heading1,
                  )
                ],
              ),
            ),
          Tab(
              child: Row(
                children: [
                  Container(
                      padding:EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("assets/images/deals.png",height: 40,width: 40,)),
                  SizedBox(width: 7),
                  Text("Deals",
                    style: heading1,
                  )
                ],
              ),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: _body()
    );
  }
}
