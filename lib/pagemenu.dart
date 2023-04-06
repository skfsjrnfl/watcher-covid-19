import 'package:flutter/material.dart';
import 'package:pa3_2016313549/vaccinepage.dart';
import 'package:pa3_2016313549/casedeathpage.dart';
import 'package:provider/provider.dart';
import 'package:pa3_2016313549/main.dart';

class PageMenu extends StatelessWidget {
  String name_menu;
  PageMenu(this.name_menu);

  @override
  Widget build(BuildContext context){
    prevPageProvider prevPage = Provider.of<prevPageProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Menu"),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          children: [
            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=>casedeathpage(name_menu)
              ),
              );
            }, child: Row(
              children: [
                Icon(Icons.coronavirus_outlined),
                Text("         Cases/Deaths"),
              ],
            )
            ),
            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=>vaccinepage(name_menu)
              ),
              );
            }, child: Row(
              children: [
                Icon(Icons.local_hospital),
                Text("         Vaccine"),
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 450),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome! ${name_menu}",style: TextStyle(
                    fontSize: 18,
                    color: Colors.black26,
                  ),),
                  Consumer<upperGraphProvider>(
                    builder: (context, upperGraph, child)=> Text(
                      "Previous: ${prevPage.name}",
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}