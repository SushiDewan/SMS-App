import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/core/api/apis.dart';
import 'package:smsapp/features/Admin/Exam/Bloc/Bloc.dart';
import 'package:smsapp/features/Admin/Exam/Bloc/Modal.dart';

class AdminExamBody extends StatefulWidget {
  @override
  _AdminExamBodyState createState() => _AdminExamBodyState();
}

class _AdminExamBodyState extends State<AdminExamBody> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    print("fetching");
    BlocProvider.of<ClassListBloc>(context).setContext(context);
    BlocProvider.of<ClassListBloc>(context).fetchExamOption();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0.9,
              fontFamily: "Varela",
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(color: Colors.white),
            tabs: [
              Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Create Exam",
                    style: TextStyle(fontFamily: "Varela", letterSpacing: 0.9, fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "Exam List",
                  style: TextStyle(fontFamily: "Varela", letterSpacing: 0.9, fontWeight: FontWeight.w600),
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(controller: _tabController, children: <Widget>[CreateExam(), ExamList()]),
      ),
    );
  }
}

//Create Exam page

class CreateExam extends StatefulWidget {
  @override
  _CreateExamState createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
  String chooseValue;
  String chooseStudent;
  List stuList = ["1", "2", "3"];
  List dropList = ["Class 1", "Class 2", "Class 3"];

  final dateFromController = new TextEditingController();
  final dateToController = new TextEditingController();

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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Theme.of(context).primaryColor)),
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
                  "Exam Type:",
                  style: TextStyle(fontSize: 15, fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  height: 45,
                  width: 145,
                  child: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      value: chooseValue,
                      onChanged: (_newValue) {
                        setState(() {
                          chooseValue = _newValue;
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
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date From :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Varela'),
                ),
                Container(
                    width: 145,
                    height: 40,
                    child: FormInputField(
                      controller: dateFromController,
                    ))
              ],
            )),
            SizedBox(height: 20),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date To :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Varela"),
                ),
                Container(
                  width: 145,
                  height: 40,
                  child: FormInputField(
                    controller: dateToController,
                  ),
                )
              ],
            )),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {
                CreateExamModal createExamModel = new CreateExamModal(chooseStudent, chooseValue, dateFromController.text, dateToController.text);
                createExamModel.saveToApi(context);
              },
              child: Center(
                child: Text(
                  "CREATE",
                  style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        )));
  }
}

//Exam List

class ExamList extends StatefulWidget {
  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  String chooseValue;
  ExamDetailModal examDetail = new ExamDetailModal();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void fetchDetail(String id) {
    print(id);
    var api = APIToken();
    api.post(context, "school/exam/view/", {"grade_id": id}, (Response response) {
      Map result = (jsonDecode(response.body));
      if (result.containsKey('exam')) {
        setState(() {
          examDetail.id = result['exam']['1']['id'];
          examDetail.exam_type = result['exam']['1']['exam_type'];
          examDetail.start_date_time = result['exam']['1']['start_date'];
          examDetail.end_date_time = result['exam']['1']['end_date'];
        });
      }
    }, (error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).accentColor),
              ),
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<ClassListBloc, ClassList>(
                builder: (_, classList) {
                  return DropdownButton(
                    isExpanded: false,
                    value: chooseValue,
                    onChanged: (_newValue) {
                      fetchDetail(_newValue);
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
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onLongPress: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    ExamDetail("Exam Type", examDetail.exam_type ?? ""),
                    ExamDetail("Start Date", examDetail.start_date_time ?? ""),
                    ExamDetail("End Date", examDetail.end_date_time ?? ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamDetail extends StatelessWidget {
  String title, value;
  ExamDetail(this.title, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            this.value,
            style: TextStyle(fontWeight: FontWeight.normal, color: Color(0xff707070), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
