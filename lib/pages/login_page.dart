import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginui/model/login_model.dart';
import 'package:loginui/pages/nextpage.dart';
import 'package:loginui/pages/regi_page.dart';
import 'package:loginui/repository/login_repository.dart';
import 'package:loginui/utils/color.dart';
import 'package:loginui/widgets/btn_widget.dart';
import 'package:loginui/widgets/herder_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        controller: EmailController,
                        hint: "Email",
                        icon: Icons.email),
                    _textInput(
                        controller: PassController,
                        hint: "Password",
                        icon: Icons.vpn_key),
                    // Container(
                    //   margin: EdgeInsets.only(top: 10),
                    //   alignment: Alignment.centerRight,
                    //   child: Text(
                    //     "Forgot Password?",
                    //   ),
                    // ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () async {
                            print("Email ====>${EmailController.text}");
                            print("Password ====>${PassController.text}");
                            await LoginRepository()
                                .userLogin(
                                    logindata: LoginModel(
                                        email: EmailController.text,
                                        password: PassController.text))
                                .then((value) {
                              if (jsonDecode(value.body)['detail'] ==
                                  "No active account found with the given credentials") {
                                showSnackBar(
                                  context,
                                  "Improper credential",
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NextPage()));
                                showSnackBar(
                                  context,
                                  "User logged in",
                                );
                              }

                              print("Printing the value === ${value.body}");
                            });
                          },
                          btnText: "LOGIN",
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RegPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account ? ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Register",
                              style: TextStyle(color: greenColors)),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 110, 178, 233)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

void showSnackBar(
  BuildContext context,
  String message,
) {
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
