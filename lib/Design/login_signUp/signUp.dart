import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rushta_app/Design/home/bottomNavigationBar.dart';
import 'package:rushta_app/Design/login_signUp/login.dart';
import 'package:rushta_app/Design/login_signUp/widget/CustomTextFormFilled.dart';
import 'package:rushta_app/mytheme.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});
  static const routeName ='signUP';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userName='';

  String email='';

  String password='';

  String confirmPassword='';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.1,),
                Text('create an Account!',

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color:MyTheme.primaryColor
                ),),SizedBox(height: MediaQuery.of(context).size.height*.01,),

                CustomTextFormFilled(label: 'userName', iconData: Icons.person, validator: (text ) {
                  if(text ==null || text.isEmpty){
                    return 'user name is required';
                  }
                  return null;
                }, onChanged: (text){
                  userName = text;
                  },
                ),SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  CustomTextFormFilled(
                    label: 'Email',
                    iconData: Icons.email,
                    validator: (text ) {
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
                },
                    onChanged: (text){
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
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),

                 CustomTextFormFilled(label: 'confirm password', iconData: Icons.password, validator: (text ) {
                  if(text ==null || text.isEmpty){
                    return 'confirm password is required';
                  }if(text !=password){
                    return ' password doesnt Match';
                  }
                  return null;;
                }, onChanged: (text){
                  confirmPassword = text;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.07 ,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.primaryColor,

                    ),
                      onPressed: (){
                        if(formKey.currentState!.validate()==true){
                          Navigator.pushNamed(context, BottomNavigationBarScreen.routName);}
                      },
                      child: Text('Sign Up',style: Theme.of(context).textTheme.titleLarge,)),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [ Text('Already Have An Account?',style: Theme.of(context).textTheme.titleMedium,),
                   SizedBox(width: 10,),
                   InkWell(onTap: (){
                     Navigator.pushNamed(context, SignScreen.routeName);
                   },
                     child: Text('Sign in', style: TextStyle(
                       fontWeight: FontWeight.w800,
                       color: MyTheme.primaryColor,
                       fontSize: 20

                     ),),
                   )],)




              ],),
            ),
          ),
        )
        ,
      ),
    );
  }

   void signUp() async{
     if(formKey.currentState!.validate()==true){
       try {
         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email,
           password: password,
         );

       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           print('The password provided is too weak.');
         } else if (e.code == 'email-already-in-use') {
           print('The account already exists for that email.');
         }
       } catch (e) {
         print(e);
       }
   }
}}
