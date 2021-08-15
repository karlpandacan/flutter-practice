import 'package:flutter/material.dart';
import 'package:practice/route/route.dart' as route;
import 'package:practice/ProgressHUD.dart';
import 'package:practice/model/login_model.dart';
import 'package:practice/api/api_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.7,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20)
                  ]),
              child: Form(
                key: globalFormKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    // Text("Login", style: Theme.of(context).textTheme.headline2),
                    Image.asset(
                      'assets/51Talk-10-Years-Logo.png',
                      width: 300,
                      height: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => loginRequestModel.email = input,
                      validator: (input) => !input.contains("@")
                          ? "E-Mail should be valid."
                          : null,
                      decoration: new InputDecoration(
                        hintText: "E-Mail Address",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        prefixIcon: Icon(Icons.email,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => loginRequestModel.password = input,
                      validator: (input) => input.length < 3
                          ? "Password should be more than 3 characters."
                          : null,
                      obscureText: hidePassword,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        prefixIcon: Icon(Icons.lock,
                            color: Theme.of(context).accentColor),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallProcess = true;
                          });
                          APIService apiService = new APIService();
                          apiService.login(loginRequestModel).then((value) {
                            if (value != null) {
                              if (value.token.isNotEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Login Successful"),
                                ));
                                Navigator.pushNamed(
                                  context,
                                  route.announcementPage,
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(value.error),
                                ));
                              }
                            }
                            setState(() {
                              isApiCallProcess = false;
                            });
                          });
                        }
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        primary: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).accentColor,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ])
        ]),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
