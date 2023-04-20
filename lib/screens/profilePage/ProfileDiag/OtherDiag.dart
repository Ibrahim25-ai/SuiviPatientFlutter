
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OtherDiag extends StatefulWidget {

 const OtherDiag({Key? key}) : super(key: key);
@override
  _OtherDiagState createState() =>  _OtherDiagState();
}
 
class  _OtherDiagState extends State<OtherDiag>{
  @override
    Widget build(BuildContext context) {
        final List<ChartData> chartData = [
          ChartData('China', 12, 10, 14, 20),
          ChartData('USA', 14, 11, 18, 23),
          ChartData('UK', 16, 10, 15, 20),
          ChartData('Brazil', 18, 16, 18, 24)
        ];

         return Stack(
             children: <Widget>[   
                Container(
                  margin: const EdgeInsets.only( top: 10),
                      width: 250,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),  
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            StackedColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y1
                            ),
                            StackedColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y2
                            ),
                             StackedColumnSeries<ChartData,String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y3
                            ),
                            StackedColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y4
                            )
                        ],
                    ),
                ),
             ],
        );
    }
    
}

    class ChartData{
        ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
        final String x;
        final int y1;
        final int y2;
        final int y3;
        final int y4;
    }