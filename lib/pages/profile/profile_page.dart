import 'package:flutter/material.dart';
import 'package:manif/shared/widgets/my_custom_button.dart';
import 'package:manif/shared/widgets/my_icon_container.dart';
import 'package:manif/shared/widgets/my_status_box_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                          Icons.arrow_back
                      ),
                      Row(
                        children: [
                          Text("49.3"),
                          SizedBox(width: 10),
                          Icon(
                              Icons.star_border_outlined
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Jennifer",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Motion designer",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconContainer(icon: Icons.chat_bubble),
                      SizedBox(width: 15),
                      MyIconContainer(icon: Icons.abc_rounded),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyStatusBoxWidget(
                          icon: Icons.send,
                          stats: "12",
                          title: "In progress",
                          color: Color(0xff90DBF2)
                      ),
                      MyStatusBoxWidget(
                          icon: Icons.access_time_filled,
                          stats: "03",
                          title: "waiting",
                          color: Color(0xffFFB1E0)
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                      "Available . \$ 75/h USD",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25
                    ),
                  ),
                  SizedBox(height: 20),
                  MyCustomButton(
                    hasBackground: true,
                    paddingWidth: 50,
                    title: "Hire Now",
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
  /*
  MyStatusBoxWidget(
                      icon: Icons.send,
                      stats: 12,
                      statsUnit: "K",
                      statsCurrency: "\$",
                      title: "In progress",
                      color: Color(0xff90DBF2),
                      description: "Je suis la description",
                  ),
   */
}
