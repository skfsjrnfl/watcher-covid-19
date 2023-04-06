import 'package:flutter/material.dart';
import 'package:pa3_2016313549/pagemenu.dart';
import 'package:provider/provider.dart';
import 'package:pa3_2016313549/main.dart';

class Pageloginsuccess extends StatelessWidget {

  String imagepath = "assets/images/corona.png";
  String name;
  Pageloginsuccess(this.name);
  @override
  Widget build(BuildContext context){
    prevPageProvider prevPage = Provider.of<prevPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("2016313549 KimDoHwan"),automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CORONA LIVE",
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
              ),
            ),
            Text("Login Success, Hello $name!!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 50),
              width: 350,
              height: 150,
              child:Image.asset(imagepath),
            ),
            ElevatedButton(onPressed: () {
                prevPage.setPrevPage("Login Page");
                Navigator.push(context, MaterialPageRoute(
                   builder: (BuildContext context)=>PageMenu(name)
               ),
                );
                }, child: Text("start CORONA LIVE"))
          ],
        ),
      ),
    );
  }
}