import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/features/Admin/editProfile.dart';
import 'package:smsapp/features/Admin/profile_body.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(90)),
            child: ClipOval(
              child: Image.network(
                "https://myrepublica.nagariknetwork.com/uploads/media/RajeshHamal.jpg",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileBody()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Rajest Hamal",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "@rajeshdada",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: Colors.white),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "person@rajesh.np",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Admin",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
              },
              icon: FaIcon(FontAwesomeIcons.edit, color: Colors.white)),
        ],
      ),
    );
  }
}
