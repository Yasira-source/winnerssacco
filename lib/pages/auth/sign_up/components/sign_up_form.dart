import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerssacco/pages/auth/default_button.dart';
import 'package:winnerssacco/pages/home/home_page.dart';

import '../../../../controller/sign_in_controller.dart';
import '../../constants.dart';
import '../../custom_surfix_icon.dart';
import '../../form_error.dart';
import '../../keyboard.dart';
import '../../size_config.dart';

import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
  TextEditingController phoneController;
  String phoneNum;
  bool remember = false;
  var result;

  final controller = SignInController();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          IntlPhoneField(
            initialCountryCode: "UG",
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            onChanged: (phone) {
              // print(phone.completeNumber);
              setState(() {
                phoneNum = phone.number;
              });
            },
            onCountryChanged: (country) {
              // print('Country changed to: ' + country.name);
            },
          ),
          // buildEmailFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton2(
            text: "Continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);

                KeyboardUtil.hideKeyboard(context);
                // print(phoneController!.text);
                // print(password);
                // print(phoneNum);

                result = await controller.getData2(phoneNum);
                // print(result);
                var got = json.decode(result);
                // print(got['message']);
                if (got['success']) {
                  actionTaken(got);
                } else {
                  _showMyDialog();
                }
              }
            },
          ),
        ],
      ),
    );
  }
  actionTaken(var got) async {
    // print(got['data']['display_name']);
// store data using shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("username", got['data'][0]['names']);
    await pref.setString("uid", got['data'][0]['id']);
    await pref.setString("fname", got['data'][0]['fname']);
    await pref.setString("accno", got['data'][0]['mno']);
    await pref.setString("acc", got['data'][0]['acc']);
    await pref.setString("balance", got['data'][0]['balance']);
    await pref.setString("status", got['data'][0]['status']);
    await pref.setString("phone", got['data'][0]['phone']);

    Get.off(() => HomePage(
      // username: got['display_name'],
      // fname: got['phone'],
      // uid: got['id'],
    ));
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Process Failed!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Kindly enter correct Phone Number '),
                Text('that is registered with your account'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/Mail.svg"),
      ),
    );
  }
}
