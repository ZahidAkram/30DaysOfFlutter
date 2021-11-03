import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

final imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB58BsvuPTLrunlFUjAEklp4XXgcKIpFGppQ&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
              accountName: Text("Zahid Akram"),
              accountEmail: Text("zk216440@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
            ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,),
              title: Text("Home",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
                ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,),
              title: Text("Profile",
                textScaleFactor: 1.4,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,),
              title: Text("Email me",
                textScaleFactor: 1.4,
                style: TextStyle(
                    color: Colors.white
                ),),
            )
    ]
        ),
      ),
    );
  }
}
