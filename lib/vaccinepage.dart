import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pa3_2016313549/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class statData {
  String _date;
  int _total_vaccinations;
  int _people_vaccinated;
  int _people_fully_vaccinated;
  int _daily_vaccinations;


  statData(this._date, this._total_vaccinations, this._people_vaccinated,this._people_fully_vaccinated,this._daily_vaccinations);

  factory statData.fromJson(dynamic json){
    return statData(
        json['date'],
        json['total_vaccinations'],
        json['people_vaccinated'],
        json['people_fully_vaccinated'],
        json['daily_vaccinations_raw'],
    );
  }
}

class countryData {
  String country;
  String iso_code;
  List<dynamic> datalist;

  countryData(@required this.country, @required this.iso_code, @required this.datalist);

  factory countryData.fromJson(dynamic json){
    return countryData(
        json['country'],
        json['iso_code'],
        json['data']
    );
  }
}

Widget fetchGragph(int a, List<statData> items) {
  List<FlSpot> spots =[];
  List<String> dates =[];
  int num=7;
  int count =0;
  if (items.isEmpty){
    return CircularProgressIndicator();
  }

  if (a == 1) {
    num=7;
    while(count<7) {
      spots.add(FlSpot((6-count).toDouble(),items[26-count]._total_vaccinations.toDouble()));
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
          horizontalInterval: 100000000,
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
              interval: 100000000,
              getTitles: (value) {
                return (value/1000000000).toStringAsFixed(2)+"B";
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
      spots.add(FlSpot((6-count).toDouble(),items[26-count]._daily_vaccinations.toDouble()));
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
                    horizontalInterval: 10000000,
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
                    interval: 10000000,
                    getTitles: (value) {
                      return (value/100000000).toStringAsFixed(2)+"B";
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
      spots.add(FlSpot((26-count).toDouble(),items[26-count]._total_vaccinations.toDouble()));
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
                    horizontalInterval: 400000000,
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
                    interval: 400000000,
                    getTitles: (value) {
                      return (value/1000000000).toStringAsFixed(2)+"B";
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
      spots.add(FlSpot((26-count).toDouble(),items[26-count]._daily_vaccinations.toDouble()));
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
                    horizontalInterval: 10000000,
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
                    interval: 10000000,
                    getTitles: (value) {
                      return (value/1000000000).toStringAsFixed(2)+"B";
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

class vaccentry{
  String Country;
  int total;
  int fully;
  int daily;
  vaccentry(this.Country,this.total,this.fully,this.daily);
}
Widget makeTable(int tablebit, List<dynamic> items){
  List<vaccentry> vacclist=[];
  int count=0;
  while (count<7){
    countryData country = countryData.fromJson(items[count]);
    if (country.country!=null){
      int length = country.datalist.length;
      statData temp = statData.fromJson(country.datalist[length - 1]);
      if (temp._total_vaccinations!=null){
        vacclist.add(vaccentry(country.country, temp._total_vaccinations, temp._people_fully_vaccinated, temp._daily_vaccinations));
        count++;
      }
    }
  }
  if(tablebit==1){
    vacclist.sort((a,b)=>a.Country.compareTo(b.Country));
  }else{
    vacclist.sort((a,b)=>b.total.compareTo(a.total));
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
                Text("total"),
                Text("fully"),
                Text("daily"),
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
                  Text(vacclist[index-1].fully.toString()),
                  Text(vacclist[index-1].daily.toString()),
              ],
            )
        );
      }
    },
  );
}

class vaccinepage extends StatelessWidget {
  String name_vaccine;
  List<statData> stat =[];

  vaccinepage(this.name_vaccine);


  Future<List<dynamic>> getResponse() async{
    String url= "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.json";
    final response = await http.get(url);
    List<dynamic> items = json.decode(response.body);
    fetchdata(items);
    return items;
  }

  List<statData> fetchdata(List<dynamic> items) {
    stat =[];
    for (int i=0; i<27;i++) {
      stat.add(statData("0", 0, 0, 0, 0));
    }
    int itemlen=items.length.toInt()-1;
    while (true){
      countryData country = countryData.fromJson(items[itemlen]);
      if (country.country=="South Korea"){
        int length = country.datalist.length;
        statData temp = statData.fromJson(country.datalist[length - 1]);
        stat[26]._date=temp._date;
        break;
      }else{
        itemlen--;
        if(itemlen<0)
          return null;
      }
    };

    for (int i =0; i<items.length; i++) {
      countryData country = countryData.fromJson(items[i]);
      int length = country.datalist.length;
      statData temp = statData.fromJson(country.datalist[length - 1]);
      int k=0;
      int when=0;
      while(true){
        if(stat[26]._date.compareTo(temp._date)==-1) {
          temp = statData.fromJson(country.datalist[length - 1 - k]);
          k++;
        }else if(stat[26]._date.compareTo(temp._date)==1&&(length - 1 - k<0)){
          temp = statData.fromJson(country.datalist[length - 1]);
          when=length-1;
          break;
        }else {
          when=length - 1 - k;
          break;
        }
      }
      for (int d=26; d>=0; d--) {
        if (when-(26-d)<0){
          break;
        }
        temp=statData.fromJson(country.datalist[when-(26-d)]);
        if (country.country=="South Korea"){
          stat[d]._date=temp._date;
        }
        if (temp._total_vaccinations != null) {
          stat[d]._total_vaccinations =
              stat[d]._total_vaccinations + temp._total_vaccinations;
        } else if (temp._people_vaccinated != null) {
          stat[d]._total_vaccinations =
              stat[d]._total_vaccinations + temp._people_vaccinated;
        } else if (temp._people_fully_vaccinated != null) {
          stat[d]._total_vaccinations =
              stat[d]._total_vaccinations + temp._people_fully_vaccinated;
        }
        if (temp._people_fully_vaccinated != null) {
          stat[d]._people_fully_vaccinated =
              stat[d]._people_fully_vaccinated + temp._people_fully_vaccinated;
        } else if (when-(27-d)>0) {
          statData tempbefore = statData.fromJson(country.datalist[when-(27-d)]);
          if (tempbefore._people_fully_vaccinated != null) {
            stat[d]._people_fully_vaccinated = stat[d]._people_fully_vaccinated +
                tempbefore._people_fully_vaccinated;
          }
        }

        if (temp._daily_vaccinations != null) {
          stat[d]._daily_vaccinations =
              stat[d]._daily_vaccinations + temp._daily_vaccinations;
        } else if (when-(27-d)>0) {
          statData tempbefore = statData.fromJson(country.datalist[when-(27-d)]);
          if (tempbefore._daily_vaccinations != null) {
            stat[d]._daily_vaccinations =
                stat[d]._daily_vaccinations + tempbefore._daily_vaccinations;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    upperGraphProvider upperGraph = Provider.of<upperGraphProvider>(context);
    tableProvider table = Provider.of<tableProvider>(context);
    prevPageProvider prevPage = Provider.of<prevPageProvider>(context);
    Future<List<dynamic>> items =getResponse();

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
                            Text("Total Vacc."),
                            Text(stat[26]._total_vaccinations.toString()+" people"),
                            Text("Total fully Vacc"),
                            Text(stat[26]._people_fully_vaccinated.toString()+" people"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Parsed latest data"),
                            Text(stat[26]._date),
                            Text("Dally Vacc."),
                            Text(stat[26]._daily_vaccinations.toString()+" people"),
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
                            upperGraph.setUpperGraph(1);
                          }, child: Text("Graph1")),
                      TextButton(
                          onPressed: (){
                            upperGraph.setUpperGraph(2);
                          }, child: Text("Graph2")),
                      TextButton(
                          onPressed: (){
                            upperGraph.setUpperGraph(3);
                          }, child: Text("Graph3")),
                      TextButton(
                          onPressed: (){
                            upperGraph.setUpperGraph(4);
                          }, child: Text("Graph4")),
                    ],
                  ),
                  Divider(color: Colors.grey,thickness: 2.0),
                  FutureBuilder<List<dynamic>>(
                      future: items,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Consumer<upperGraphProvider>(
                              builder: (context, upperGraph, child)=>
                                  fetchGragph(upperGraph.number, stat)
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                  )
                ]
              )
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
                            table.settable(1);
                          }, child: Text("Country_name")),
                      TextButton(
                          onPressed: (){
                            table.settable(2);
                          }, child: Text("Total_vacc")),
                    ],
                  ),
                  Divider(color: Colors.grey,thickness: 2.0),
                  Container(
                    //alignment: Alignment.topCenter,
                    width: 300,
                    height: 150,
                    child: Consumer<tableProvider>(
                      builder: (context, table, child)=>
                          FutureBuilder<List<dynamic>>(
                            future: items,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return makeTable(table.tablenumber,snapshot.data);
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
          prevPage.setPrevPage("Vaccine Page");
          Navigator.pop(context);},
        child: Icon(Icons.list),
      ),
    );
  }
}