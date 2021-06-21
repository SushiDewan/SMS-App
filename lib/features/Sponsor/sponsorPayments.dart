import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SponsorPayments extends StatefulWidget {
  @override
  _SponsorPaymentsState createState() => _SponsorPaymentsState();
}

class _SponsorPaymentsState extends State<SponsorPayments> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(children: [
         Stack(
              children: [
                ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: HexColor("#B9E2DA")
                        // gradient: LinearGradient(
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        //     colors: [
                        //       HexColor("#FF8A00").withOpacity(0.8),
                        //       HexColor("#FF8A00")
                        //     ])
                        ),
                    height: 200,
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: HexColor("#ffffff"),
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text("Payment",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontFamily: 'Varela',
                                      fontWeight: FontWeight.w500)),
                            ),
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
             SizedBox(
                height: 20,
              ),
              Text("Grand Total",
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
                                      Text("Discount",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                   Column(
                                    children:[
                                      Text("Fine", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                   Column(
                                    children:[
                                      Text("Paid", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  ),
                                   Column(
                                    children:[
                                      Text("Balance", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Varela"),),
                                      Text("--")
                                    ]
                                  )
                                ],
                              )),
                        )
        ]),
      ),
    );
  }
}
