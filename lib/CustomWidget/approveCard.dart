import 'package:flutter/material.dart';

class ApproveCard extends StatelessWidget {
  String title, subtitle;
  Function onTapApprove, onTapReject;

  ApproveCard({this.title, this.subtitle, this.onTapApprove, this.onTapReject});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: ListTile(
              title: Text(
                this.title.toUpperCase(),
                style: TextStyle(
                    fontFamily: "Varela",
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              trailing: Text(this.subtitle),
              subtitle: Row(
                children: [
                  InkWell(
                    onTap: isLoading ? null : onTapApprove,
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              width: 17,
                              height: 17,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "Accept",
                              style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: isLoading ? null : onTapReject,
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              width: 17,
                              height: 17,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "Reject",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
