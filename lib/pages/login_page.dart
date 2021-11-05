import 'package:firstproject/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool onchangeButton= false;
  final _formkey= GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        onchangeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onchangeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                "assets/images/login_image.png",
             fit: BoxFit.cover,),
            SizedBox(
              height: 20,

            ),
            Text( "Welcome $name",
              style: const TextStyle(
              fontSize: 25,
                fontWeight:  FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              key: _formkey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText:"Enter Username",
                    labelText: "Username",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return"Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name= value;
                    setState(() {

                    });
                  },
                ),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText:"Enter password",
                    labelText: "Password",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return"Password cannot be empty";
                    }
                   else if(value.length<6){
                      return"Password length should be atleast 6.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
               Material(
                 color: context.theme.buttonColor,
                 borderRadius: BorderRadius.circular(onchangeButton?50:8),
                 child: InkWell(

                   onTap: () => moveToHome(context),
                   child: AnimatedContainer(
                     duration: const Duration(seconds: 1),
                     height: 50,
                     width: onchangeButton?50:150,

                     alignment: Alignment.center,
                     child:onchangeButton?const Icon(Icons.done,
                     color: Colors.white,):const Text(
                       "Login",
                       style:
                       TextStyle(
                         color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold
                       ),
                     ),

                   ),
                 ),
               ),

              ],),
            ),
          )
          ],
        ),
      )
    );
  }
}
