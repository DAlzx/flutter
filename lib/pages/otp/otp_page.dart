import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manif/core/repositories/users_repository.dart';
import 'package:manif/pages/navigationbar/bottom_navigation_bar_page.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:manif/core/models/user_model.dart' as user_model;

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final int resendToken;

  const OtpPage({
    required this.phoneNumber,
    required this.verificationId,
    required this.resendToken,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _textFieldFormKey = GlobalKey<FormState>();
  final TextEditingController _otpCodeTextFormFieldController =
      TextEditingController();
  final RoundedLoadingButtonController _verifyBtnController =
      RoundedLoadingButtonController();

  final UsersRepository _usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Verified code",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "We've sent your verification code to " + widget.phoneNumber,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Form(
                    key: _textFieldFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otpCodeTextFormFieldController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone_android),
                          hintText: "000000",
                          labelText: "Your verification code"),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    )),
                SizedBox(height: 30),
                RoundedLoadingButton(
                  child: Text('Verify', style: TextStyle(color: Colors.white)),
                  color: Colors.redAccent,
                  successColor: Colors.green,
                  controller: _verifyBtnController,
                  onPressed: () => _verifyPhoneNumberInFirebase(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyPhoneNumberInFirebase() async {
    if (_otpCodeTextFormFieldController.text.isNotEmpty) {
      try {
        PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
            verificationId: widget.verificationId,
            smsCode: _otpCodeTextFormFieldController.text);

        // -- Sign with credential if
        await FirebaseAuth.instance.signInWithCredential(authCredential);

        // -- Store user information in firestore after otp verification
        user_model.User userToAdd = user_model.User(
            uid: "",
            phoneNumber: widget.phoneNumber,
            isVerified: true,
            fullName: "",
            profileImageUrl: "default");

        String currentUserUid = await _usersRepository.saveUser(userToAdd);

        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BottomNavigationBarPage(
                  currentUserPhoneNumber: widget.phoneNumber,
                  currentUserUid: currentUserUid,
                )));
      } on FirebaseAuthException {
        print("Code OTP expiré ou invalide");
        _verifyBtnController.stop();
      }
    } else {
      _verifyBtnController.stop();
    }
  }
}
