import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SponsorGrowth extends StatefulWidget {
  @override
  _SponsorGrowthState createState() => _SponsorGrowthState();
}

class _SponsorGrowthState extends State<SponsorGrowth> {
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
                            child: Text("Growth",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0, right: 10),
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 3))
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/profile.jpg"),
                                        fit: BoxFit.cover))),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
