import 'package:flutter/material.dart';
import 'package:pa3_2016313549/vaccinepage.dart';
import 'package:provider/provider.dart';
import 'package:pa3_2016313549/pagelogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (context) => upperGraphProvider(1),
        ),
          ChangeNotifierProvider(
            create: (context) => upperGraphProvider2(1),
          ),
          ChangeNotifierProvider(
            create: (context)=> tableProvider(1),
          ),
          ChangeNotifierProvider(
            create: (context)=> tableProvider2(1),
          ),
          ChangeNotifierProvider(
            create: (context)=> prevPageProvider("Login Page"),
          ),
          ChangeNotifierProvider(
            create: (context)=> GraphProvider(0),
          )
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    )
    );
  }
}
class GraphProvider with ChangeNotifier {
  List<statData> gralist=[];
  int _done = 0;
  get done => _done;

  GraphProvider(this._done);
  void setUpperGraph(List<dynamic> list){
    gralist=list;
    _done=1;
    notifyListeners();
  }
}
class upperGraphProvider with ChangeNotifier {
  int _number=1;
  get number => _number;

  upperGraphProvider(this._number);
  void setUpperGraph(int a){
    _number=a;
    notifyListeners();
  }
}
class upperGraphProvider2 with ChangeNotifier {
  int _number=1;
  get number => _number;

  upperGraphProvider2(this._number);
  void setUpperGraph(int a){
    _number=a;
    notifyListeners();
  }
}
class tableProvider with ChangeNotifier {
  int _tablenumber;
  get tablenumber => _tablenumber;

  tableProvider(this._tablenumber);
  void settable(int a){
    _tablenumber=a;
    notifyListeners();
  }
}
class tableProvider2 with ChangeNotifier {
  int _tablenumber;
  get tablenumber => _tablenumber;

  tableProvider2(this._tablenumber);
  void settable(int a){
    _tablenumber=a;
    notifyListeners();
  }
}
class prevPageProvider with ChangeNotifier {
  String _prev;
  get name => _prev;

  prevPageProvider(this._prev);
  void setPrevPage(String s){
    _prev=s;
    notifyListeners();
  }
}


class MyHomePage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title:"Loginpage",
          home: Scaffold(
            appBar: AppBar(title:
              Text("2016313549 KimDoHwan")
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
                    Text("Login Please...",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      alignment: Alignment.center,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ID:",style: TextStyle(
                                fontSize: 20,
                              ),
                              ),
                              SizedBox(
                                width:200,
                                height: 50,
                                child:
                                TextField(
                                   controller: idController,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("PW:",style: TextStyle(
                                fontSize: 20,
                              ),
                              ),
                              SizedBox(
                                width:200,
                                height: 50,
                                child:
                                TextField(
                                  controller: pwController,
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(onPressed:() {
                            if (idController.text == "SKKU" &&
                                pwController.text == "1234") {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context)=>Pageloginsuccess(idController.text)
                                ),
                              );
                            }
                          },
                            style: ElevatedButton.styleFrom(
                            primary: Colors.blue
                          ),child: Text("Login"))
                        ],
                      ),
                    )
                  ],
              ),
            ),
          )
        );
  }
  
}

