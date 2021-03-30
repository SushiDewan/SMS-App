import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherAttendance extends StatefulWidget {
  @override
  _TeacherAttendanceState createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          child: Column(children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: HexColor("#B9E2DA")),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 30,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text("Attendance",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black))),
                    ],
                  ),
                )),
                // ClipRRect(
                //   child: Padding(
                //       padding: EdgeInsets.only(left: 40, top: 160),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           // boxShadow: [
                //           //   BoxShadow(
                //           //     color: Colors.grey,
                //           //     spreadRadius: 1,
                //           //     blurRadius: 4,
                //           //     offset: Offset(0, 6),
                //           //   )
                //           // ],
                //           borderRadius: BorderRadius.circular(10),
                //           // border: Border.all(color: HexColor("#B9E2DA")),
                //           color: Colors.white,
                //         ),
                //         height: MediaQuery.of(context).size.height * 0.16,
                //         width: MediaQuery.of(context).size.width * 0.8,
                //         child: Container(
                //             padding: EdgeInsets.only(left: 20),
                //             child: Text('hello')),
                //       )),
                // ),
              ],
            ),
            Expanded(
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.orange,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (context,date, events) {
                  setState(() {
                  print(date.toString());
                });
                  
                },
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
            )
          ])),
    );
  }
}
