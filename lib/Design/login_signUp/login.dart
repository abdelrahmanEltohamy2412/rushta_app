import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rushta_app/Design/login_signUp/signUp.dart';
import 'package:rushta_app/Design/login_signUp/widget/CustomTextFormFilled.dart';

import 'package:rushta_app/mytheme.dart';

import '../home/bottomNavigationBar.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  static const String routeName = 'signIn_screen';

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {

  var formKey = GlobalKey<FormState>();
  String email = 'tohamy@route.com';
  String password = '1234567';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back !',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
            ),
            Form(
              key: formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormFilled(label: 'Email', iconData: Icons.email, validator: (text ) {
                    if(text ==null || text.isEmpty){
                      return 'email is required';
                    }
                    bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    if(!emailValid){
                      return 'email not valid';
                    }
                    return null;
                  }, onChanged: (text){
                    email = text;
                  },
                  ),SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  CustomTextFormFilled(label: 'password', iconData: Icons.password, validator: (text ) {
                    if(text ==null || text.isEmpty){
                      return 'password is required';
                    }if(text.length<6){
                      return 'password must be 6 charcters';
                    }
                  }, onChanged: (text){
                    password = text;
                  },
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width*.5,
                  height: MediaQuery.of(context).size.height*.07 ,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        backgroundColor: MyTheme.primaryColor ,
                        padding: EdgeInsets.all(15),

                      ),
                      onPressed: () {
                            if(formKey.currentState!.validate()==true){
                            Navigator.pushNamed(context, BottomNavigationBarScreen.routName);}
                      },
                      child: Text(
                        'sign in ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.whiteColor),
                      )),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('dont have an account? '),
                    InkWell(onTap:(){
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    } ,
                        child: Text('Sign UP',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: MyTheme.primaryColor
                        ),))

                  ],)
              ],),
            )
          ],
        ),
      ),
    );
  }

  void login()async {
    if(formKey.currentState!.validate()==true){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        print('sucsssssesssssssssssssssssssssssfffffullllly');
        print('رككككككككككككككككككز${credential.user?.uid??''}');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }catch(e){
        print(e);
      }
    }
  }


}
