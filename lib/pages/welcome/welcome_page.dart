import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manif/pages/auth/authentication_page.dart';
import 'package:manif/pages/otp/otp_page.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final RoundedLoadingButtonController _getStartedBtnController =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _haveAnAccountBtnController =
      RoundedLoadingButtonController();

  final _textFieldFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberTextFormFieldController =
      TextEditingController();
  final RoundedLoadingButtonController _verifyBtnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF015959), // Couleur de fond #015959
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "DailyTask Planner",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 35,
                        color: Color(0xFFFFFFFF)),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _textFieldFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      autofocus: true,
                      controller: _phoneNumberTextFormFieldController,
                      style: TextStyle(
                          color: Colors
                              .white), // Ajoutez cette ligne pour la couleur du texte
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone_android),
                        hintText: "0610101010",
                        labelText: "Your phone number",
                        labelStyle: TextStyle(
                            color: Colors
                                .white), // Ajoutez cette ligne pour la couleur du label
                        hintStyle: TextStyle(
                            color: Colors
                                .white), // Ajoutez cette ligne pour la couleur de l'indicatif
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white), // Ajoutez cette ligne pour la couleur de la bordure
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white), // Ajoutez cette ligne pour la couleur de la bordure lorsqu'elle est sélectionnée
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 14,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone number";
                        }
                        if (!isValidPhoneNumber(value)) {
                          return "Please enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 30),
                  RoundedLoadingButton(
                    child: Text('Send code',
                        style: TextStyle(color: Colors.white)),
                    color: Colors.redAccent,
                    successColor: Colors.green,
                    controller: _verifyBtnController,
                    onPressed: () => _onClickSendCodeButton(),
                  ),
                  SizedBox(height: 20),
                  RoundedLoadingButton(
                    child: Text('Get Started',
                        style: TextStyle(color: Colors.white)),
                    color: Colors.redAccent,
                    successColor: Colors.green,
                    controller: _getStartedBtnController,
                    onPressed: () => _onClickGetStartedButton(),
                  ),
                  SizedBox(height: 30),
                  // RoundedLoadingButton(
                  //   child: Text('I already have an account',
                  //       style: TextStyle(color: Colors.white)),
                  //   color: Colors.grey.withOpacity(0.8),
                  //   controller: _haveAnAccountBtnController,
                  //   onPressed: () => _onClickHaveAnAccountButton(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onClickGetStartedButton() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AuthenticationPage()));
    _getStartedBtnController.stop();
  }

  void _onClickHaveAnAccountButton() {
    // Mettez ici le code spécifique pour le deuxième bouton si nécessaire
    _haveAnAccountBtnController.stop();
  }

  void _goBack() {
    Navigator.pop(context);
  }

  bool isValidPhoneNumber(String input) {
    // Vous pouvez ajouter des validations supplémentaires pour le format du numéro de téléphone ici
    // Par exemple, vérifier si le numéro de téléphone commence par un certain préfixe ou s'il a une longueur spécifique
    return true; // Pour l'exemple, nous considérons que tous les numéros sont valides
  }

  void _onClickSendCodeButton() {
    if (_textFieldFormKey.currentState!.validate()) {
      if (_phoneNumberTextFormFieldController.text.isNotEmpty) {
        String phoneNumber = "+33${_phoneNumberTextFormFieldController.text}";

        // Ici, vous pouvez appeler la méthode pour envoyer le code de vérification via Firebase
        // Utilisez FirebaseAuth.instance.verifyPhoneNumber() comme dans votre méthode _sendOtpCodeWithFirebase()
        // Vous pouvez également gérer les erreurs Firebase selon les besoins

        // Une fois que le code de vérification a été envoyé avec succès, vous pouvez passer à l'écran OTP
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpPage(
              phoneNumber: phoneNumber,
              verificationId:
                  "VERIFICATION_ID_HERE", // Remplacez par la valeur réelle de verificationId
              resendToken:
                  12345, // Remplacez par la valeur réelle de resendToken
            ),
          ),
        );
        _verifyBtnController.stop();
      } else {
        _verifyBtnController.stop();
      }
    } else {
      _verifyBtnController.stop();
    }
  }
}
