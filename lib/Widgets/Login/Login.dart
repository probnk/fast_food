import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Providers/Login_Provider.dart';
import 'package:fast_food/Widgets/Home/Home_Page.dart';
import 'package:fast_food/Widgets/Signup/Signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  List _hintText = ["Email id or User Name","Password"];
  List _icons1 = [Icons.mail_outline,Icons.lock];
  List _icons2 = [Icons.mail_outline,Icons.lock_open_outlined];
  List _text = ['f','G'];
  List _colors = [Colors.blue,Colors.orange.shade700];

  top(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: ListView(
        children: [
          Image.asset("assets/images/pizza.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Login",
                style: heading2,
              ),
             TextButton(
               onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
               },
               child:Text("New User? Signup Now",
               style: heading1,
              ),
             )
            ],
          ),
          SizedBox(height: 10,),
          ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Consumer<Login_Provider>(
                builder: (context,value,child){
              return Padding(
                padding: const EdgeInsets.only(left:7,right: 7,top: 14),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 8,
                  child: TextFormField(
                    onTap: () {
                      value.toggle(index);
                    },
                    obscureText: index == 1 && value.isTrue ? true : false,
                    controller: value.isCheck == index ? email : password,
                    decoration: InputDecoration(
                        hintText: "${_hintText[index]}",
                        hintStyle: heading1,
                        suffixIcon: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: value.isTrue
                                ? IconButton(
                              onPressed:() {
                                value.obscure();
                              },
                              icon: Icon(_icons1[index],color: grey,size: 30,)
                              )
                            : IconButton(
                                onPressed:() {
                                  value.obscure();
                                },
                                icon: Icon(_icons2[index],color: grey,size: 30,)
                            )
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
              );
            });
          }),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Stack(
              children: [
                Container(
                  height: 70,
                  padding:  EdgeInsets.only(left:50,right: 80,top: 20,bottom:20),
                  margin: const EdgeInsets.only(left:50,right: 7,top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.red.shade900,Colors.orange.shade900]
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Text("Login Now",
                    textAlign: TextAlign.center,
                    style: heading3,
                  ),
                ),
                Positioned(
                  left: 230,
                  top: 16,
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Transform.rotate(
                      angle:1,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(Icons.navigation,color: Colors.pink,size: 30,),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Forgot Password?',
                style: text2,
              ),
              Row(
                children: [
                  Container(
                    height:54,
                    child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                      return InkWell(
                        onTap: () {

                        },
                        child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child:Container(
                              width: 40,
                              height: 54,
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: _colors[index],
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text("${_text[index]}",
                                textAlign: TextAlign.center,
                                style: heading3,
                              ),
                            )
                        ),
                      );
                    }),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 35,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Image.asset("assets/images/kitchen.png",fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: top(context)
    );
  }
}
