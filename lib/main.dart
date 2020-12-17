import 'package:flutter/material.dart';
import 'package:flutter_app100/profile.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> image=["img/heart.png","img/digestive.png","img/brain.png",];
  List<String> title=["Cardiology","Gastrology","Neurology"];
  List<Color> colors=[Color(0xFFa7c4e1),Color(0xFF91d4da),Color(0xFFf2c7a7)];
  List<String> doctorimage=["img/mendoctor.png","img/tomheart.png","img/womendoctor.png"];
  List<String> name=["Prof.Dr.Kevin Williams","Dr.Jane Foster","Tommy Smith"];
  List<String> profession=["Heart Surgeon-United hospital","digestive Surgeon-United hospital","brain Surgeon-United hospital"];
  List<String> appointmentcost=["10.50","10.40","12.00"];
  String istapped="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child:Icon(Icons.menu_outlined,color: Color(0xFF868fa2),)
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:AssetImage("img/women1.png",),
                          backgroundColor: Color(0xFF9dd6dd),
                          radius: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Hello Jane",style: TextStyle(color: Color(0xFF334767),fontWeight: FontWeight.w700,fontSize: 17),)
                  ),
                  SizedBox(height: 12,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Find Your Specialist",style: TextStyle(color: Color(0xFF35496a),fontSize: 28,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 25,),
                  Stack(

                    children: <Widget>[
                      Container(
                        height:50,
                        child:TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search,size: 25,color: Colors.black12,),
                            hintText: "Search doctor",
                            hintStyle: TextStyle(color: Color(0xFFe6e7ea),
                                fontSize: 15),

                            enabledBorder: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(

                                    color: Colors.white
                                )
                            ),
                          ),
                        ),

                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFa3d7dc),
                          backgroundImage: AssetImage("img/loading.png"),
                          radius: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 120,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: title.length,
                      itemBuilder: (context,index){
                        return Humanparts(
                          image: image[index],
                          title: title[index],
                          colors: colors[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("Top Doctor",style: TextStyle(color: Color(0xFF6c7892),fontWeight: FontWeight.w700,fontSize: 22),),
                      ),
                      Container(
                        child: Text("See all",style: TextStyle(color: Color(0xFFaadbe2),fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: name.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Profile(
                              name[index],profession[index]
                            )));
                          },
                          child: DoctorsAppointment(
                            image: doctorimage[index],
                            title: name[index],
                            subtitle: profession[index],
                            content: appointmentcost[index],
                            colors: colors[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorsAppointment extends StatelessWidget {
  const DoctorsAppointment({
    this.image,
    this.name,
    this.title,
    this.subtitle,
    this.content,
    this.colors,
    Key key,
  }) : super(key: key);
  final String image;
  final String name;
  final String title;
  final String subtitle;
  final String content;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          alignment: Alignment.topLeft,
          height: 100,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child:Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 12),
                child: Container(
                  child: CircleAvatar(
                    backgroundColor:this.colors,
                    backgroundImage: AssetImage(image),
                    radius: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(color: Color(0xFF707a8d),fontWeight: FontWeight.w500,fontSize: 15),
                      ),
                      SizedBox(height: 5,),
                      Text(subtitle,style: TextStyle(color: Color(0xFFd0d4d9),fontSize: 12,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,color: Color(0xFFdef2f3),size: 10,),
                          Text("10:40 AM - 2:40 PM",style: TextStyle(color: Color(0xFFa7adba),fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 30,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(content,style: TextStyle(color: Color(0xFFe1e3e7)),),
                            RaisedButton(
                              padding: const EdgeInsets.only(left:10,right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0)),
                              textColor: Colors.white,
                              color: Color(0xFFaadbe2),
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Profile(title,subtitle)
                                  )
                                );
                              },
                              child: Text('Appointment'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}

class Humanparts extends StatelessWidget {
  const Humanparts({
    this.image,
    this.title,
    this.colors,
    Key key,
  }) : super(key: key);
  final String image;
  final String title;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color:this.colors,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: this.colors,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 3.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child:Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Image.asset(image,fit: BoxFit.cover,height:60,)
                  ),
                  SizedBox(height: 4,),
                  Text(title,style: TextStyle(color: Colors.white),)
                ],
              )

          ),
        ),
      ],
    );
  }
}
