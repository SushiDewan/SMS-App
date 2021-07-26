import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/approveCard.dart';

class ApproveUser extends StatefulWidget {
  @override
  _ApproveUserState createState() => _ApproveUserState();
}

class _ApproveUserState extends State<ApproveUser>
    with TickerProviderStateMixin {
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
          title: Text(
            "Approve User",
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
                    "Parent",
                    style: TextStyle(
                        fontFamily: "Varela",
                        letterSpacing: 0.9,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "Staff",
                  style: TextStyle(
                    fontSize: 13,
                      fontFamily: "Varela",
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "Sponsor",
                  style: TextStyle(
                    fontSize: 13,
                      fontFamily: "Varela",
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
            controller: _tabController,
            children: <Widget>[Parent(), Staff(), Sponsor()]),
      ),
    );
  }
}

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ApproveCard(
        title: "Sushila Dewan",
        subtitle: "Grade 1",
        onTapApprove: (){},
        onTapReject: (){},
      ),
    );
  }
}

//staff

class Staff extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Sponsor

class Sponsor extends StatefulWidget {
  @override
  _SponsorState createState() => _SponsorState();
}

class _SponsorState extends State<Sponsor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
