import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/EventTile.dart';

class AdminEventBody extends StatefulWidget {
  @override
  _AdminEventBodyState createState() => _AdminEventBodyState();
}

class _AdminEventBodyState extends State<AdminEventBody> {
  bool value = false;
  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Add Event")),
          content: Container(
            width: 300,
            height: 375,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "title",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Event Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "title",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Who Can see?"),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                          onTap: () {
                            setState(() {
                              this.value = !value;
                            });
                          },
                          title: Text("Parent"),
                          leading: Checkbox(
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          )),
                      ListTile(
                          onTap: () {
                            setState(() {
                              this.value = !value;
                            });
                          },
                          title: Text("Teacher"),
                          leading: Checkbox(
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          )),
                      ListTile(
                        onTap: () {
                          setState(() {
                            this.value = !value;
                          });
                        },
                        dense: true,
                        title: Text("Sponsor"),
                        leading: Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value;
                            });
                          },
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Submit"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: ListView(
          children: [
            EvenTile(
              title: "First Event",
              subtitle: "Tommorrow will be holiday",
            ),
            EvenTile(
              title: "First Event",
              subtitle: "Tommorrow will be holiday",
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            createAlertDialog(context);
          },
          elevation: 10,
        ),
      ),
    );
  }
}
