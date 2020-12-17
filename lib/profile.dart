import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String profession;
  final String name;
  Profile(this.name,this.profession);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Profile> {
  int activeDate=2;
  double amount=10.3;
  List <double> amounts=[10.3,20.4,30.5,40.6,50.1];
  List<String> day=["Sun","Mon","Tue","Wed","Thu"];
  List<int> date=[2,3,4,5,6];
  List<Color> colors=[Colors.white,Colors.white,Color(0xFF94d3da),Colors.white,Colors.white];
  List <String> count=["648","6","1084","5"];
  List<String> operations=["Patients","Years Exp","Surgery","Rating"];
  List<Color> color=[Color(0xFF8db4db),Color(0xFF94d3da),Color(0xFFf7d2b8),Color(0xFFf5bc77)];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFf2c6a9),
                        ),
                        child:Column(
                          children: [
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Color(0xFFfdf3f0),),
                                    onPressed: (){
                                  Navigator.pop(context);
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(right:8.0),
                                  child: Icon(Icons.menu,color: Color(0xFFfdf3f0),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Center(child: Image.asset("img/doctors.png",height: 300,)),
                            )
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:350.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFffffff),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 70,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Appointment",style: TextStyle(color: Color(0xFF4c5d78),fontWeight: FontWeight.w700,fontSize: 17),),
                                Text("< August >",style: TextStyle(color: Color(0xFF9ea6b4),fontSize: 12,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Container(
                              height: 90,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: colors.length,
                                itemBuilder: (context,index){

                                  return InkWell(
                                    child: Weekdays(
                                      onTap: (){
                                        setState(() {
                                          activeDate = date[index];
                                          amount=amounts[index];
                                        });
                                      },
                                      day: day[index],
                                      date: date[index],
                                      activeDate: activeDate,
                                      amount: amount,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("About",style: TextStyle(color: Color(0xFF677288),fontWeight: FontWeight.w700,fontSize: 17),),
                                Text("Call now",style: TextStyle(color: Color(0xFFbccfe6),fontSize: 15,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Container(
                              height: 50,
                              width: 320,
                              child: Text("Dr. Jane Faster is a long establised fact that a reader will be distracted by the readable content of a page when looking at its layout The point of using lorem.",style: TextStyle(color: Color(0xFFb4b8c2)),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 79,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: color.length,
                                itemBuilder: (context,index){
                                  return Patients(
                                    count: count[index],
                                    operations: operations[index],
                                    colors: color[index],  
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:710.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xFF94d3da)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("$amount",style: TextStyle(color: Color(0xFFe2f3f7),fontWeight: FontWeight.w700,fontSize: 15),),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFaadbe2)
                              ),
                              child: Text("Appointment",style: TextStyle(color: Color(0xFFe2f3f7),fontSize: 15,fontWeight: FontWeight.w600),),
                            )
                          ],
                        ) ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:318.0),
                      child: Center(
                        child:Container(
                          height: 90,
                          width: 290,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF8db4db),
                            boxShadow: [
                              BoxShadow(
                                color:Color(0xFFd8e4f2),
                                offset: const Offset(
                                  1.0,
                                  5.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Center(
                                child: Text(widget.name,style: TextStyle(color: Color(0xFFe9eff4),fontWeight: FontWeight.w800,fontSize: 20),),
                              ),
                              SizedBox(height: 3,),
                              Text(widget.profession,style: TextStyle(color: Color(0xFFe9eff4),fontWeight: FontWeight.w300,fontSize: 12),),
                              SizedBox(height: 3,),
                              Text("United State medical college & hospital",style: TextStyle(color: Color(0xFFe9eff4),fontWeight: FontWeight.w300,fontSize: 15),),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        )
    );
  }
}

class Patients extends StatelessWidget {
  const Patients({
    this.count,
    this.operations,
    this.colors,
  }) ;
  final String count;
  final String operations;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height:55,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color:this.colors
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Column(
                children: [
                  Text(count,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w700),),
                  Text(operations,style: TextStyle(color:Colors.white),)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Weekdays extends StatelessWidget {
  const Weekdays({
    this.day,
    this.date,
    this.color,
    this.activeDate,
    this.onTap,
    this.amount,
    this.amounts,
    Key key,
  }) : super(key: key);
  final String day;
  final int date;
  final Color color;
  final int activeDate;
  final Function onTap;
  final double amount;
  final double amounts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap?.call();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height:78,
              width: 43,
              decoration:  activeDate != date ? BoxDecoration():BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Color(0xFF94d3da)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Column(
                  children: [
                    Text(day,style: TextStyle(color: Color(0xFF878a98)),),
                    SizedBox(height: 2,),
                    Text("$date",style: TextStyle(color: Color(0xFF878a98)),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
