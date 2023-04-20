
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../styles/AppLargeText_bloc.dart';

class HealthIndex extends StatefulWidget {
 const HealthIndex({Key? key}) : super(key: key);

  @override
  _HealthIndexState createState() =>  _HealthIndexState();
}

class  _HealthIndexState extends State<HealthIndex> {
  
  @override
  Widget build(BuildContext context) {
    return  Stack(
                      children: <Widget>[
                      
                  Container(
                      margin: const EdgeInsets.only(right: 15, top: 10,left:8),
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
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
    
                      padding :const EdgeInsets.only(left: 15, top: 10),
                      
                      child: SfCircularChart(
                        legend: Legend(isVisible: true),
                        series: <CircularSeries>[
                        // Render pie chart
                            DoughnutSeries<ChartData, String>(
                                dataSource: [
                                // Bind data source
                                ChartData(x:'Malaria',y: 35),
                                ChartData(x: 'Covid',y: 28),
                                ChartData(x: 'test1',y: 34),
                                ChartData(x:'test2', y:32),
                                ChartData(x:'oth', y:40)
                                ],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelMapper: (ChartData data, _) => data.x,
            radius: '60%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              // Avoid labels intersection
              labelIntersectAction: LabelIntersectAction.shift,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve, length: '25%')
              )
                                
                            )
                        ]
                    ), 
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 30),
                    child: AppLargeText(text: "Diagnostics",size: 16 ,),
                      ),
                  ],
                    );
  }
}

    class ChartData {
      ChartData({this.x, this.y});
      final String? x;
      final num? y;
    }