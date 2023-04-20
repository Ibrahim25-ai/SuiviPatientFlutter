
import 'package:doctor_test/screens/profilePage/ProfileDiag/OtherDiag.dart';
import 'package:doctor_test/screens/profilePage/doctor_detail/doctor_detail.dart';
import 'package:doctor_test/screens/profilePage/ProfileDiag/DiagnoStic_bloc.dart';
import 'package:doctor_test/screens/profilePage/ProfileDiag/MapsBubble_bloc.dart';
import 'package:doctor_test/screens/profilePage/ProfileDiag/PatientTest_bloc.dart';
import 'package:doctor_test/styles/colors.dart';
import 'package:flutter/material.dart';
List<Map> doctors = [
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  }
];

class ProfilePage extends StatefulWidget {

 
 const ProfilePage({Key? key,}) : super(key: key);
 

  @override
  _ProfilePageState createState() =>  _ProfilePageState();
}

 
class  _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin{


  
  @override

  Widget build(BuildContext context) {
  
   List pages=[
    const DiagnoStics(),
    const PatientTest(),
    const OtherDiag(),
  ];

    TabController _tabController = TabController(length: 3, vsync: this);
    
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.only(left: 10, top: 14,right : 18),
         child: Column(  
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [       
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var _schedule = doctors[index];
                      bool isLastElement = doctors.length + 1 == index;
                      return Container(
                        margin: !isLastElement
                            ? const EdgeInsets.only(bottom: 20)
                            : EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(
                  height: 20,
                ),
                                  Container(padding: const EdgeInsets.only(left: 20,right : 20),child: const UserIntro()),
                                  const SizedBox(
                  height: 20,
                ),
                                  Container(padding:const EdgeInsets.only(left: 15,right: 15),child: const CategoryIcons()),
                                  const SizedBox(
                  height: 20,
                ),
                                  const SearchInput(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TabBar(
                                  labelPadding: const EdgeInsets.only(left:25,right:30),
                                  controller: _tabController,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: CircleTabIndicator(color: Colors.blue,radius: 4),
                                  tabs : const [
                                    Tab(text : "Appointments"),
                                    Tab(text : "Diagnostics"),
                                    Tab(text : "Map"),
                                  ],
                                ),
                              ),
                              ),
                                  Container(
                                    padding: const EdgeInsets.only(left:20),
                                    height: 250,
                                    width : double.maxFinite,
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        ListView.builder(
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context, int index) { 
                                             
                                              return   Container(
                                                          height: 500,
                                                          width: 320,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 5),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: const [
                                                                    AppointmentCard(),
                                                                  ],
                                                            ),
                                                          ),
                                                                                );
                                        },
                                        ),
                                        ListView.builder(
                                          itemCount: 3,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context, int index) { 
                                            return  pages[index];
                                        },
                                        ),
                                        ListView.builder(
                                          itemCount: 1,
                                      
                                          itemBuilder: (BuildContext context, int index) { 
                                            return    Container(
                                                        margin: const EdgeInsets.only(),
                                                        child : Row(
                                                        children: const [
                                                        MapsBubble(),
                                                        ],
                                                        ),
                                                        );
                                        },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Top Doctor',
                                      style: TextStyle(
                                        color: Color(MyColors.header01),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                    for (var doctor in doctors)
                                    Container(
                                      padding: const EdgeInsets.only(left: 20,),
                                      child: TopDoctorCard(
                                        img: doctor['img'],
                                        doctorName: doctor['doctorName'],
                                        doctorTitle: doctor['doctorTitle'],
                                      ),
                                    ),
                                    const SizedBox(
                                                      width: 10,
                                                    ),
  
                            ],
                          ),
                        ),
                      );
              },
                  ),
                )      
           ],
          ),
      
       
     ), 
  ); 
      
}
}
class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
                          context,
              MaterialPageRoute(builder: (context) => const SliverDoctorDetail()),
            );
                               
        },
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(MyColors.yellow02),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class AppointmentCard extends StatelessWidget {
  
  const AppointmentCard({
    Key? key,
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: const AssetImage('assets/doctor01.jpeg'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Dr.Muhammed Syahid',
                                style: TextStyle(color: Colors.white)),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Dental Specialist',
                              style: TextStyle(color: Color(MyColors.text01)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: const BorderRadius.only(
              bottomRight: const Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

List<Map> categories = [
  {'icon': Icons.coronavirus, 'text': 'Covid 19'},
  {'icon': Icons.local_hospital, 'text': 'Hospital'},
  {'icon': Icons.car_rental, 'text': 'Ambulance'},
  {'icon': Icons.local_pharmacy, 'text': 'Pill'},
];

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
          ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(MyColors.bg),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Color(MyColors.primary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'Brad King 👋',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/person.jpeg'),
        )
      ],
    );
  }
}
class ChartData {
      ChartData(this.x, this.y);
        final String x;
        final double y;
        
    }
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color : color, radius:radius);
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
  _paint.color = color;
  _paint.isAntiAlias = true;
  final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
    
  }
  