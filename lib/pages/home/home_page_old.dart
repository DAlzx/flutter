import 'package:flutter/material.dart';
import 'package:manif/core/repositories/users_repository.dart';
import 'package:manif/pages/home/setting_page.dart';

class HomePage extends StatefulWidget {
  final String currentUserPhoneNumber;
  final String currentUserUid;

  const HomePage({
    Key? key,
    required this.currentUserPhoneNumber,
    required this.currentUserUid
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsersRepository _usersRepository = UsersRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap:  () => goToSettingPage(),
                          onDoubleTap: () => goToSettingPage(),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/profil.jpg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi Archie,"),
                            Text("Welcome back!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                shape: BoxShape.circle
                            ),
                            child: Icon(
                                Icons.search
                            )
                        ),
                        SizedBox(width: 10),
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                shape: BoxShape.circle
                            ),
                            child: Icon(
                                Icons.notification_add
                            )
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color(0xff2C5E54),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Balance",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                Text("VISA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                            Text("\$4,480.06",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(".... 5436",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                Text("04/26",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Color(0xffDDF598),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Balance",
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                                Text("VISA",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                            Text("\$2,350.15",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(".... 5436",
                                ),
                                Text("04/26",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Send money",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                      ),
                    ),
                    Row(
                      children: [
                        Text("Show all",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () => goToSettingPage(),
                  child: const Text('Aller sur la page settings'),
                ),
              ],
            )
          )
        ),
      )
    );
  }

  void goToSettingPage(){
      _usersRepository.save();
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const SettingPage()
        )
      );
  }

}
