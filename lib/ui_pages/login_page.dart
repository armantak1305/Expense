import 'package:expense/data/local_data/dbhelper.dart';
import 'package:expense/ui_pages/bottomnav_page.dart';
import 'package:expense/utils/custom_widget.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            myTextFields(hinttxt: "Enter the mail",controller: emailController,mIcons: Icon(Icons.mail),keyBoardType: TextInputType.emailAddress,),
            SizedBox(height: 10,),
            myTextFields(hinttxt: "Enter the password",controller: passController,mIcons: Icon(Icons.lock),),
            SizedBox(height: 20,),
            RoundedBatton(btnName: "Login", callback:()async{
              if(emailController.text.isNotEmpty&&passController.text.isNotEmpty){
                DBhelper myDB = DBhelper.getInstance();
                bool isAuth =await myDB.authUser(emailController.text, passController.text);
                if(isAuth){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNavPage(),));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:Text("Invalid Email or Password",style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.red,
                      )

                  );
                }
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:Text("Field are required!!",style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.red,
                    )

                );
              }
            }),
            SizedBox(height: 12,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
            }, child: Text("New User?Create Account",))
          ],
        ),
      ),
    );
  }
}