import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/Admin/Exam/Bloc/Bloc.dart';

import '../Exam/Bloc/Modal.dart';

class AdminFeeBody extends StatefulWidget {
  @override
  _AdminFeeBodyState createState() => _AdminFeeBodyState();
}

class _AdminFeeBodyState extends State<AdminFeeBody> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Center(
            child: Text(
              "Payment",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.95,
                fontFamily: "Varela",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator:
                BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.white),
            tabs: [
              Text(
                "Create Category".toUpperCase(),
                style: TextStyle(fontFamily: "Varela", letterSpacing: 0.9, fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text(
                "Payment List".toUpperCase(),
                style: TextStyle(fontFamily: "Varela", fontSize: 13, letterSpacing: 0.9, fontWeight: FontWeight.w600),
              ),
              Text(
                "Send Remainder".toUpperCase(),
                style: TextStyle(fontFamily: "Varela", fontSize: 13, letterSpacing: 0.9, fontWeight: FontWeight.w600),
              ),
            ],
            controller: _tabController,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(controller: _tabController, children: <Widget>[FeeStructure(), Text("Fee History"), Text("hello")]),
      ),
    );
  }
}

class FeeStructure extends StatefulWidget {
  @override
  _FeeStructureState createState() => _FeeStructureState();
}

class _FeeStructureState extends State<FeeStructure> {
  String chooseValue;
  String chooseStudent;
  List stuList = ["sushila", "Aadesh", "Supiya"];
  List dropList = ["Class 1", "Class 2", "Class 3"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Class:",
                  style: TextStyle(fontSize: 15, fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 45,
                  width: 145,
                  child: Container(
                    child: BlocBuilder<ClassListBloc, ClassList>(
                      builder: (_, classList) {
                        return DropdownButton(
                          isExpanded: false,
                          value: chooseValue,
                          onChanged: (_newValue) {
                            setState(() {
                              chooseValue = _newValue;
                            });
                          },
                          items: classList.classList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem.id,
                              child: Text(valueItem.name),
                            );
                          }).toList(),
                          hint: Text(
                            "Select Class",
                            style: TextStyle(color: Theme.of(context).accentColor),
                          ),
                          icon: Icon(Icons.arrow_drop_down),
                          underline: SizedBox(),
                          iconEnabledColor: Theme.of(context).primaryColor,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Subject:",
                  style: TextStyle(fontSize: 15, fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    // color: Colors.black,
                  ),
                  height: 45,
                  width: 145,
                  child: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      value: chooseStudent,
                      onChanged: (_newValue) {
                        setState(() {
                          chooseStudent = _newValue;
                        });
                      },
                      items: stuList.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      underline: SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fee Type :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Varela'),
                ),
                Container(width: 145, height: 40, child: FormInputField())
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enter Amount :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Varela"),
                ),
                Container(width: 145, height: 40, child: FormInputField())
              ],
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "CREATE",
                  style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
