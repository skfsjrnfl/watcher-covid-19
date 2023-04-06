import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pa3_2016313549/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class cdData {
  String _date;
  double _total_cases;
  double _total_deaths;
  double _new_cases;


  cdData(this._date, this._total_cases, this._total_deaths,this._new_cases);

  factory cdData.fromJson(dynamic json){
    return cdData(
      json['date'],
      json['total_cases'],
      json['total_deaths'],
      json['new_cases'],
    );
  }
}

class countryData2 {
  String location;
  List<dynamic> datalist;

  countryData2(this.location, this.datalist);

  factory countryData2.fromJson(dynamic json){
    return countryData2(
       json['location'],
        json['data']
    );
  }
}
Widget fetchGragph(int a, List<cdData> items) {
  List<FlSpot> spots =[];
  List<String> dates =[];
  int num=7;
  int count =0;
  if (items.isEmpty){
    return CircularProgressIndicator();
  }

  if (a == 1) {
    num=7;
    while(count<7){
      spots.add(FlSpot((6-count).toDouble(),items[26-count]._total_cases.toDouble()));
      dates.add(items[26-count]._date.substring(5,));
      count++;
    }
    return SizedBox(
        height: 150,
        width: 250,
        child:LineChart(
            LineChartData(
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 1000000,
                    getDrawingHorizontalLine: (value){
                      return FlLine(
                        color:  Colors.black,
                        strokeWidth: 1,
                      );
                    }

                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 10,
                    getTitles: (value) {
                      return dates[num-1-value.toInt()];
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 1000000,
                    getTitles: (value) {
                      return (value/1000000).toStringAsFixed(0)+"M";
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: spots
                  )
                ]
            )
        )
    );
  }
  else if (a==2){
    num=7;
    while(count<7) {
      spots.add(FlSpot((6-count).toDouble(),items[26-count]._new_cases.toDouble()));
      dates.add(items[26-count]._date.substring(5,));
      count++;
    }
    //makeGraph
    return SizedBox(
        height: 150,
        width: 250,
        child:LineChart(
            LineChartData(
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 100000,
                    getDrawingHorizontalLine: (value){
                      return FlLine(
                        color:  Colors.black,
                        strokeWidth: 1,
                      );
                    }
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 10,
                    getTitles: (value) {
                      return dates[num-1-value.toInt()];
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 100000,
                    getTitles: (value) {
                      return (value/1000000).toStringAsFixed(2)+"M";
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: spots
                  )
                ]
            )
        )
    );
  }
  else if (a==3){
    num=27;
    while(count<27) {
      spots.add(FlSpot((26-count).toDouble(),items[26-count]._total_cases.toDouble()));
      dates.add(items[26-count]._date.substring(5,));
      count++;
    }
    //makeGraph
    return SizedBox(
        height: 150,
        width: 250,
        child:LineChart(
            LineChartData(
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 5000000,
                    getDrawingHorizontalLine: (value){
                      return FlLine(
                        color:  Colors.black,
                        strokeWidth: 1,
                      );
                    }

                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 10,
                    getTitles: (value) {
                      if (value%7==0||value==26)
                        return dates[num-1-value.toInt()];
                      else
                        return "";
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 5000000,
                    getTitles: (value) {
                      return (value/1000000).toStringAsFixed(0)+"M";
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: spots
                  )
                ]
            )
        )
    );
  }
  else if (a==4){
    num=27;
    while(count<27) {
      spots.add(FlSpot((26-count).toDouble(),items[26-count]._new_cases.toDouble()));
      dates.add(items[26-count]._date.substring(5,));
      count++;
    }
    //makeGraph
    return SizedBox(
        height: 150,
        width: 250,
        child:LineChart(
            LineChartData(
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 200000,
                    getDrawingHorizontalLine: (value){
                      return FlLine(
                        color:  Colors.black,
                        strokeWidth: 1,
                      );
                    }

                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 10,
                    getTitles: (value) {
                      if (value%7==0||value==26)
                        return dates[num-1-value.toInt()];
                      else
                        return "";
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 200000,
                    getTitles: (value) {
                      return (value/1000000).toStringAsFixed(2)+"M";
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: spots
                  )
                ]
            )
        )
    );
  }
  return Text("NULL");
}

class cdentry{
  String Country;
  double total;
  double daily;
  double deaths;
  cdentry(this.Country,this.total,this.daily,this.deaths);
}


Widget makeTable(int tablebit, List<dynamic> items){
  List<cdentry> vacclist=[];
  int count=0;
  int j=0;
  while (count<7){
    countryData2 country = items[j];
    if (country.location!=null){
      int length = country.datalist.length;
      cdData temp = cdData.fromJson(country.datalist[length - 1]);
      if (temp._total_cases!=null){
        vacclist.add(cdentry(country.location, temp._total_cases, temp._new_cases, temp._total_deaths));
        count++;
      }
    }
    j++;
  }
  if(tablebit==1){
    vacclist.sort((a,b)=>b.total.compareTo(a.total));
  }else{
    vacclist.sort((a,b)=>b.deaths.compareTo(a.deaths));
  }

  return ListView.builder(
    itemCount: 8,
    shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index){
      if (index==0){
        return Container(
            width: 300,
            height: 40,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Country"),
                Text("total cases"),
                Text("daily cases"),
                Text("total deaths"),
              ],
            )
        );
      }else{
        return Container (
            width:300,
            height: 40,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(vacclist[index-1].Country),
                Text(vacclist[index-1].total.toString()),
                Text(vacclist[index-1].daily.toString()),
                Text(vacclist[index-1].deaths.toString()),
              ],
            )
        );
      }
    },
  );
}
class casedeathpage extends StatelessWidget {
  String name_cd;
  casedeathpage(this.name_cd);
  List<cdData> stat = [];

  List<cdData> fetchdata(List<dynamic> items) {
    stat=[];
    for (int i=0;i<27;i++) {
      stat.add(cdData("0", 0, 0, 0));
    }
    int itemlen=items.length.toInt()-1;

    while (true){
      countryData2 country = items[itemlen];
      if (country.location!=null&&country.location=="South Korea"){
        int length = country.datalist.length;
        cdData temp = cdData.fromJson(country.datalist[length - 1]);
        stat[26]._date=temp._date;
        break;
      }else{
        itemlen--;
        if(itemlen<0)
          return null;
      }
    }

    for (int i =0; i<items.length; i++) {
      countryData2 country = items[i];
      int length = country.datalist.length;
      cdData temp = cdData.fromJson(country.datalist[length - 1]);
      int k=0;
      int when=0;

      while(true){
        if(stat[26]._date.compareTo(temp._date)==-1) {
          temp =cdData.fromJson(country.datalist[length - 1 - k]);
          k++;
        }else if(stat[26]._date.compareTo(temp._date)==1&&(length - 1 - k<0)){
          temp = cdData.fromJson(country.datalist[length - 1]);
          when=length-1;
          break;
        }else {
          when=length - 1 - k;
          break;
        }
      }
      for (int d=26;d>=0;d--) {
        if (when-(26-d)<0){
          break;
        }
        temp=cdData.fromJson(country.datalist[when-(26-d)]);
        if (country.location=="South Korea"){
          stat[d]._date=temp._date;
        }
        if (temp._total_cases != null) {
          stat[d]._total_cases = stat[d]._total_cases + temp._total_cases;
        } else if (when-(26-d)-1>=0) {
          if (cdData.fromJson(country.datalist[when-(26-d)-1])._total_cases != null) {
            stat[d]._total_cases = stat[d]._total_cases + cdData.fromJson(country.datalist[when-(26-d)-1])._total_cases;
          }
        }

        if (temp._total_deaths != null) {
          stat[d]._total_deaths = stat[d]._total_deaths + temp._total_deaths;
        } else if (when-(26-d)-1>=0) {
          cdData tempbefore = cdData.fromJson(country.datalist[when-(26-d)-1]);
          if (tempbefore._total_deaths != null) {
            stat[d]._total_deaths = stat[d]._total_deaths + tempbefore._total_deaths;
          }
        }

        if (temp._new_cases != null) {
          stat[d]._new_cases = stat[d]._new_cases + temp._new_cases;
        } else if (when-(26-d)-1>=0) {
          cdData tempbefore = cdData.fromJson(country.datalist[when-(26-d)-1]);
          if (tempbefore._new_cases != null) {
            stat[d]._new_cases = stat[d]._new_cases + tempbefore._new_cases;
          }
        }
      }
    }
    return stat;
  }

  Future<List<dynamic>> getResponse() async{
    String url= "https://covid.ourworldindata.org/data/owid-covid-data.json";
    final response = await http.get(url);
    Map<String,dynamic> code = json.decode(response.body) as Map<String,dynamic>;
    List<dynamic> items=code.values.toList();
    List<countryData2> clist= [];
    for (int i =0; i<items.length; i++){
      countryData2 country = countryData2.fromJson(items[i]);
      clist.add(country);
    }
    fetchdata(clist);
    return clist;
  }


  @override
  Widget build(BuildContext context) {
    upperGraphProvider2 upperGraph2 = Provider.of<upperGraphProvider2>(context);
    tableProvider2 table2 = Provider.of<tableProvider2>(context);
    prevPageProvider prevPage = Provider.of<prevPageProvider>(context);
    Future<List<dynamic>> items = getResponse();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              alignment: Alignment.center,
              child: FutureBuilder<List<dynamic>>(
                future: items,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Cases."),
                            Text(stat[26]._total_cases.toInt().toString()+" people"),
                            Text("Total Deaths"),
                            Text(stat[26]._total_deaths.toInt().toString()+" people"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Parsed latest data"),
                            Text(stat[26]._date),
                            Text("Dally Cases"),
                            Text(stat[26]._new_cases.toInt().toString()+" people"),
                          ],
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            upperGraph2.setUpperGraph(1);
                          }, child: Text("Graph1")),
                      TextButton(
                          onPressed: (){
                            upperGraph2.setUpperGraph(2);
                          }, child: Text("Graph2")),
                      TextButton(
                          onPressed: (){
                            upperGraph2.setUpperGraph(3);
                          }, child: Text("Graph3")),
                      TextButton(
                          onPressed: (){
                            upperGraph2.setUpperGraph(4);
                          }, child: Text("Graph4")),
                    ],
                  ),
                  Divider(color: Colors.grey,thickness: 2.0),
                  Consumer<upperGraphProvider2>(
                    builder: (context, upperGraph2, child)=>
                        FutureBuilder<List<dynamic>>(
                          future: items,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return fetchGragph(upperGraph2.number,stat);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: (){
                            table2.settable(1);
                          }, child: Text("Total Cases")),
                      TextButton(
                          onPressed: (){
                            table2.settable(2);
                          }, child: Text("Total Deaths")),
                    ],
                  ),
                  Divider(color: Colors.grey,thickness: 2.0),
                  Container(
                    //alignment: Alignment.topCenter,
                    width: 300,
                    height: 150,
                    child: Consumer<tableProvider2>(
                      builder: (context, table2, child)=>
                          FutureBuilder<List<dynamic>>(
                            future: items,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return makeTable(table2.tablenumber, snapshot.data);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                  width: 50,
                                  height: 50,
                                  child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child:CircularProgressIndicator()
                                  )
                              );
                            },
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          prevPage.setPrevPage("Cases/Death Page");
          Navigator.pop(context);},
        child: Icon(Icons.list),
      ),
    );
  }
}