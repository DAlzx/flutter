import 'package:flutter/material.dart';
import 'package:manif/shared/widgets/my_portfolio_box_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
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
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Portfolio",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    MyPortfolioBoxWidget(
                        icon: Icons.mobile_friendly_sharp,
                        title: "Mobile",
                        color: Color(0xffFFB1E0)
                    ),
                    MyPortfolioBoxWidget(
                        icon: Icons.computer,
                        title: "Web",
                        color: Color(0xffC6A8E6)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Projects",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Accenture",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 35
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Worked for the design system",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right_alt_sharp,
                      size: 40,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Deloitte",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 35
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Created Motion Graphic for UI",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right_alt_sharp,
                      size: 40,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Awards",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Services",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
