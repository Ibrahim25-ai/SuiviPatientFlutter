
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../../styles/AppLargeText_bloc.dart';

class MapsBubble extends StatefulWidget {

 const MapsBubble({Key? key}) : super(key: key);
  
  @override
  
  _MapsBubbleState createState() =>  _MapsBubbleState();
}

class  _MapsBubbleState extends State<MapsBubble> {
  late List<Model> data;
late MapShapeSource dataSource;
late MapZoomPanBehavior _zoomPanBehavior;
  @override
void initState() {
  super.initState();

  data = <Model>[
    Model('Turkey', 51, const Color.fromARGB(55, 239, 83, 80)),
    Model('Taiwan', 51, const Color.fromARGB(198, 239, 83, 80)),
    Model('Tanzania', 51, const Color.fromARGB(197, 80, 239, 144)),
    Model('Uganda', 51, const Color.fromARGB(197, 7, 14, 20)),
    Model('Ukraine', 51, const Color.fromARGB(208, 239, 80, 236)),
    Model('United States', 51, const Color.fromARGB(55, 239, 83, 80)),
    Model('Uzbekistan', 51, const Color.fromARGB(197, 210, 239, 80)),
    Model('Tunisia', 51, const Color.fromARGB(255, 239, 83, 80)),
    Model('United Arab Emirates', 58,const  Color.fromARGB(55, 102, 187, 106)),
    Model('Europe', 48, Colors.blue[400]!),
    Model('North America', 41, Colors.purple[400]!),
    Model('South America', 14, Colors.yellow[400]!),
    Model('Australia', 23, const Color.fromARGB(55, 255, 168, 38)),
  ];

  dataSource = MapShapeSource.asset(
     "assets/world.geojson",
     shapeDataField: "NAME",
     dataCount: data.length,
     primaryValueMapper: (int index) => data[index].continent,
     bubbleSizeMapper: (int index) => data[index].count,
     bubbleColorValueMapper: (int index) => data[index].bubbleColor,
  );
  _zoomPanBehavior = MapZoomPanBehavior();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return  Stack(
                      children: <Widget>[        
                  Container(
                      margin: const EdgeInsets.only( top: 10,left: 4),
                      width: 320,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),    
                      child: SfMaps(
                            layers: [
                              MapShapeLayer(
                                source: dataSource,
                                bubbleSettings: const MapBubbleSettings(
                                  maxRadius: 5,
                                  minRadius: 4,
                                  
                                ),
                                zoomPanBehavior: _zoomPanBehavior,
                              ),
                            ],
                          ),
                          
                
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 30),
                    child: AppLargeText(text: "Covid-19",size: 16 ,),
                      ),
                  ],
                    );
  }
}

  
    class Model {
   Model(this.continent, this.count, this.bubbleColor);

  final String continent;
  final double count;
  final Color bubbleColor;
}