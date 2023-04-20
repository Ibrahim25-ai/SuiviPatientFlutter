import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../styles/AppLargeText_bloc.dart';

class PatientTest extends StatefulWidget {
 const PatientTest({Key? key}) : super(key: key);

  @override
  _PatientTestState createState() =>  _PatientTestState();
}

class  _PatientTestState extends State<PatientTest> {
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
                        annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    widget: 
                      Container(
                        child: AppLargeText(text : '11M',size: 14,)
                      ),
                  )
                ],
                        series: <CircularSeries>[
                        // Render pie chart
                            DoughnutSeries<ChartData, String>(
                              
                                dataSource: [
                                // Bind data source
                                ChartData('Men', 60),
                                ChartData('Women', 30),
                                ChartData('Children',10),
                                
                                ],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                              

                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true, 
                                    labelPosition: ChartDataLabelPosition.outside,
                                    // Renders background rectang le and fills it with series color
                                    useSeriesColor: true
                                ),
                                innerRadius: '70%',
                                explode: true,
                                explodeIndex: 1,
                                
                            )
                        ]
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 30),
                    child: AppLargeText(text: "Patient",size: 16 ,),
                      ),
                  ],
                    );
  }
}
class ChartData {
      ChartData(this.x, this.y);
        final String x;
        final double y;
        
    }