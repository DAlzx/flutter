import 'package:flutter/material.dart';
import 'package:manif/shared/widgets/my_custom_button.dart';
import 'package:manif/shared/widgets/my_status_box_widget.dart';

class HomePage extends StatefulWidget {
  final String currentUserPhoneNumber;
  final String currentUserUid;

  const HomePage(
      {Key? key,
      required this.currentUserPhoneNumber,
      required this.currentUserUid})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    const Icon(Icons.arrow_back),
                    Row(
                      children: [
                        const Icon(Icons.chat_bubble),
                        const SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Welcome JAN " + widget.currentUserPhoneNumber,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                const SizedBox(height: 20),
                const Text(
                  "28 Mar, Friday",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Dashboard ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Icon(Icons.tune)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyCustomButton(
                        paddingWidth: 12, title: "7 Days", hasBackground: true),
                    MyCustomButton(
                        paddingWidth: 12,
                        title: "1 Month",
                        hasBackground: false),
                    MyCustomButton(
                        paddingWidth: 12, title: "1 Year", hasBackground: false)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        MyStatusBoxWidget(
                          icon: Icons.currency_exchange,
                          stats: "2.8",
                          statsUnit: "K",
                          statsCurrency: "\$",
                          title: "Revenue",
                          color: Color(0xff90DBF2),
                          description: "2% ↑ Last 7 Days",
                        ),
                        SizedBox(height: 10),
                        MyStatusBoxWidget(
                            icon: Icons.show_chart,
                            stats: "89",
                            statsUnit: "%",
                            title: "Success Rate",
                            color: Color(0xffFFDA73))
                      ],
                    ),
                    Column(
                      children: const [
                        MyStatusBoxWidget(
                            icon: Icons.remove_red_eye,
                            stats: "3.8",
                            statsUnit: "M",
                            title: "Profile view",
                            color: Color(0xffFFB1E0)),
                        SizedBox(height: 10),
                        MyStatusBoxWidget(
                          icon: Icons.access_time_filled,
                          stats: "23",
                          title: "Job Waiting",
                          color: Color(0xffC6A8E6),
                          description: "8% ↑ Last 7 Days",
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
