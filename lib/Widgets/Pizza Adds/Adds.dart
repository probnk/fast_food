import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Providers/HomePage_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pizza_Adds extends StatelessWidget {
  const Pizza_Adds({super.key});

  List<Widget> adds() {
    List<Widget> items = [];
    for (int i = 0; i < 5; i++) {
      items.add(
        InkWell(
          onTap: () {},
          child: Card(
            color: yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Container(
              width: 320,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 10,),
                   Text("Limited Offer!",style: heading),
                   Container(
                       width: 150,
                       child: Text("Grab This Mega Deal Now",style: heading1)
                   ),
                   Container(
                       width: 150,
                       child: Text("\n3x Large Pizza, 1x 1.5 Liter Soft Drink, Regular Fries",style: subtitle)
                   ),
                  ],
                 ),
                  Column(
                    children: [
                      Image.asset("assets/images/piz.png",height: 140,width: 118),
                      Text("In Just \$49.99",style: title)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }
  carosile(){
    return Consumer<HomePage_Provider>(
        builder: (context,value,child){
          return Column(
            children: [
              Container(
                child: CarouselSlider(
                  items: adds(),
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds:800),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      value.update(index);
                    },
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Center(
                  child:
                  AnimatedSmoothIndicator(
                    activeIndex: value.selected,
                    count: 5,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.blue.shade900,
                        dotHeight: 12,
                        dotWidth: 12
                    ),
                  )
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: carosile()
    );
  }
}
