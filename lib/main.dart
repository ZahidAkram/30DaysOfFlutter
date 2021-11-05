import 'package:firstproject/pages/cart_page.dart';
import 'package:firstproject/pages/login_page.dart';
import 'package:firstproject/utils/routes.dart';
import 'package:firstproject/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
 void main()
 {
   runApp(const MyApp());
 }
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       themeMode: ThemeMode.system,
       theme: MyTheme.lightTheme,
       darkTheme: MyTheme.darkTheme,

        debugShowCheckedModeBanner: false, //debug ka banner hatany ka code

        initialRoute:MyRoutes.loginRoute,
       routes: {
       "/" : (context) => LoginPage(),
         MyRoutes.homeRoute: (context)=> HomePage(),
         MyRoutes.loginRoute:(context)=> LoginPage(),
         MyRoutes.cartRoute:(context)=> CartPage()
       },
     );

   }


 }
