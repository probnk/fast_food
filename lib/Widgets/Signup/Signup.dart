import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Providers/SignUp_Provider.dart';
import 'package:fast_food/Widgets/Home/Home_Page.dart';
import 'package:fast_food/Widgets/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  List _hintText = ["Email id or User Name","Password","Phone Number"];
  List _icons1 = [Icons.mail_outline,Icons.lock,Icons.phone];
  List _icons2 = [Icons.mail_outline,Icons.lock_open_outlined,Icons.phone];

  top(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: ListView(
        children: [
          Image.asset("assets/images/pizza.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Signup",
                style: heading2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child:Text("Account? Login Now",
                  style: heading1,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Consumer<SignUp_Provider>(
                    builder: (context,value,child){
                      return Padding(
                        padding: const EdgeInsets.only(left:7,right: 7,top: 7),
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
                    height: 55,
                    padding:  EdgeInsets.only(left:50,right: 80,top: 7,bottom:10),
                    margin: const EdgeInsets.only(left:50,right: 7,top: 10,bottom: 7),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.red.shade900,Colors.orange.shade900]
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("SignUp",
                      textAlign: TextAlign.center,
                      style: heading3,
                    ),
                  ),
                  Positioned(
                    left: 207,
                    top: 5,
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Transform.rotate(
                        angle:1,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Icon(Icons.navigation,color: Colors.pink,size: 30,),
                        ),
                      ),
                    ),
                  )
                ],
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<SignUp_Provider>(
                builder: (context, val, child) {
                  return Checkbox(
                    value: val.val == 1,
                    activeColor: grey,
                    onChanged: (value) {
                      val.check();
                    },
                  );
                },
              ),
              Text('Accept Terms & Condition',
                style: text2,
              ),
            ],
          ),
          SizedBox(height: 10,),
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