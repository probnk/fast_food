import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Const/Foods.dart';
import 'package:fast_food/Widgets/Food_Detail/Food_Details.dart';
import 'package:flutter/material.dart';

class Soft_Drinks extends StatelessWidget {
  Soft_Drinks({Key? key});

  List<foods> _list = [
    foods(9.99, "Coca Cola", "Soft Drink", "Coca Cola.png"),
    foods(9.99, "Fanta", "Soft Drink", "fanta.png"),
    foods(9.99, "Pepsi", "Soft Drink", "pepsi.png"),
    foods(9.99, "Suprite", "Soft Drink", "suprite.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: _list.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (context) => Food_Details(food: _list[index])
                  )
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/${_list[index].url}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            "${_list[index].title}",
                            style: title,
                          ),
                          Text(
                            "${_list[index].subTitle}",
                            style: subtitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${_list[index].price}",
                                style: text,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_outlined, color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}