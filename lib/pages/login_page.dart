import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });

    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty){
                          return "Username Cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Your Username",
                          labelText: "Username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty){
                          return "Password Cannot be empty";
                        }else if(value.length < 6){
                          return "Password length should at least 6";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //Create Customized button with Animated Container
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
