import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes settings"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Text("Bonjour Soumaila A DIARRA"),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) => {
                    if(text == "paris"){
                      print('Paris a été tapé')
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "iphone 12",
                    labelText: "Votre recherche",
                    icon: Icon(Icons.search)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
