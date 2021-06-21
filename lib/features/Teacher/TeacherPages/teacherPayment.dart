import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherPayment extends StatefulWidget {
  @override
  _TeacherPaymentState createState() => _TeacherPaymentState();
}

class _TeacherPaymentState extends State<TeacherPayment> {
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
                            child: Text("Payment",
                                style: TextStyle(
                                    fontFamily: "Varela",
                                    fontSize: 22,
                                    color: Colors.black))),
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("March",
                  style: TextStyle(
                      fontFamily: "Varela",
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
                      SizedBox(height:10),
               Container(
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     spreadRadius: 1,
                            //     blurRadius: 4,
                            //     offset: Offset(0, 6),
                            //   )
                            // ],
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: HexColor("#B9E2DA")),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Container(
                              padding: EdgeInsets.only(left: 5, right: 5, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children:[
                                      Text("Amount", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                   Column(
                                    children:[
                                      Text("Allowance",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                   Column(
                                    children:[
                                      Text("Paid Amt", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                  
                                   Column(
                                    children:[
                                      Text("Balancet Amt", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  )
                                ],
                              )),
                        )
            ])));
  }
}
