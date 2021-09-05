
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:malkanat/models/login_model.dart';
import 'package:malkanat/network/dio_helper.dart';
import 'package:malkanat/network/end_points.dart';
import 'package:malkanat/network/local_host.dart';
import 'package:malkanat/screens/homepagescreen.dart';

enum AuthMode { Signup, Login }

class AuthCardWidget extends StatefulWidget {
  const AuthCardWidget({Key key}) : super(key: key);

  @override
  _AuthCardWidgetState createState() => _AuthCardWidgetState();
}

class _AuthCardWidgetState extends State<AuthCardWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formkey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;
  final _passwordController = TextEditingController();
  final _emailcontroller = TextEditingController();
  bool _isLoading = false;
  MalkanatLoginModel LoginModel;

  void userLogin({
    @required String email,
    @required String password,
  }) {
    try {
      var res = DioHelper.postData(
        url: LOGIN,
        data: {'email': email, 'password': password},
      );
      print(res.data);
      LoginModel = MalkanatLoginModel.fromJson(res.data);
      //print token
      print(LoginModel.data.token);
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> _submit(String email, String password) async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    userLogin(email: email, password: password);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _slideAnimation = Tween<Offset>(begin: Offset(0, -1.5), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    final emailTextFielde = TextFormField(
      controller: _emailcontroller,
      decoration: InputDecoration(
        labelText: 'E-Mail',
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty || !value.contains('@')) {
          return 'Invalid email';
        }
      },
      onSaved: (value) {
        //_authData['email'] = value;
      },
    );
    final passwordTextField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Password is too Short';
        }
      },
      onSaved: (value) {
        _authData['password'] = value;
      },
    );
    final confirmPasswordTextField = AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: _authMode == AuthMode.Signup ? 60 : 0,
        maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
      ),
      duration: Duration(milliseconds: 300),
      curve: _authMode == AuthMode.Signup
          ? Curves.fastLinearToSlowEaseIn
          : Curves.linear,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: TextFormField(
            enabled: _authMode == AuthMode.Signup,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            ),
            obscureText: true,
            validator: _authMode == AuthMode.Signup
                ? (value) {
                    if (value != _passwordController.text) {
                      return 'Password Do not Match';
                    }
                  }
                : null,
          ),
        ),
      ),
    );

    final nameTextField = AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: _authMode == AuthMode.Signup ? 60 : 0,
        maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
      ),
      duration: Duration(milliseconds: 600),
      curve: _authMode == AuthMode.Signup
          ? Curves.fastLinearToSlowEaseIn
          : Curves.linear,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: TextFormField(
              enabled: _authMode == AuthMode.Signup,
              decoration: InputDecoration(
                labelText: 'Name Of User',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              textInputAction: TextInputAction.next,
              obscureText: true,
              validator: (val) {}),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 9.0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: _authMode == AuthMode.Signup ? 410 : 280,
          constraints: BoxConstraints(
              minHeight: _authMode == AuthMode.Signup ? 320 : 280),
          width: devicesize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  emailTextFielde,
                  passwordTextField,
                  confirmPasswordTextField,
                  nameTextField,
                  ///////////////////////
                  SizedBox(
                    height: 20,
                  ),
                  _isLoading
                      ? CircularProgressIndicator()
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _submit(_emailcontroller.text,
                                  _passwordController.text);
                              if (LoginModel.status) {
                                print(LoginModel.message);
                                print(LoginModel.data.token);
                                CachHelper.saveData(
                                        key: 'token',
                                        value: LoginModel.data.token);
                                    //.then((value) => MaterialPageRoute(builder:(context)=>Navigator.pushReplacement(context,HomePageScreen())));
                              } else {
                                print(LoginModel.message);
                              }
                            },
                          ),
                        ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'Sign Up' : 'Login '} Instead'),
                      onPressed: _switchAuthMode,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}








// /////////////////////////Job Role
//                   AnimatedContainer(
//                     constraints: BoxConstraints(
//                       minHeight: _authMode == AuthMode.Signup ? 60 : 0,
//                       maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
//                     ),
//                     duration: Duration(milliseconds: 900),
//                     curve: _authMode == AuthMode.Signup
//                         ? Curves.fastLinearToSlowEaseIn
//                         : Curves.linear,
//                     child: FadeTransition(
//                       opacity: _opacityAnimation,
//                       child: SlideTransition(
//                         position: _slideAnimation,
//                         child: TextFormField(
//                             decoration: InputDecoration(
//                               labelText: "Job Role",
//                               labelStyle: TextStyle(
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             textInputAction: TextInputAction.next,
//                             validator: (value) {
//                               // if (value.isEmpty) {
//                               //   return 'Job Role is Request';
//                               // }
//                             },
//                             focusNode: _jobrolefocusnode,
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_addressfocusnode);
//                             },
//                             onSaved: (value) {}),
//                       ),
//                     ),
//                   ),
//                   /////////// Address
//                   AnimatedContainer(
//                     constraints: BoxConstraints(
//                       minHeight: _authMode == AuthMode.Signup ? 60 : 0,
//                       maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
//                     ),
//                     duration: Duration(milliseconds: 1200),
//                     curve: _authMode == AuthMode.Signup
//                         ? Curves.fastLinearToSlowEaseIn
//                         : Curves.linear,
//                     child: FadeTransition(
//                       opacity: _opacityAnimation,
//                       child: SlideTransition(
//                         position: _slideAnimation,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: "Address",
//                             labelStyle: TextStyle(
//                                 color: Theme.of(context).primaryColor),
//                           ),
//                           maxLines: 3,
//                           keyboardType: TextInputType.multiline,
//                           validator: (String value) {
//                             // if (value.isEmpty) {
//                             //   return 'Address is Request';
//                             // }
//                             // if (value.length < 10) {
//                             //   return 'Should be at least 10 characters long.';
//                             // }
//                             // return null;
//                           },
//                           focusNode: _addressfocusnode,
//                           textInputAction: TextInputAction.next,
//                           onFieldSubmitted: (_) {
//                             FocusScope.of(context)
//                                 .requestFocus(_descriptionfocusnode);
//                           },
//                           onSaved: (String value) {},
//                         ),
//                       ),
//                     ),
//                   ),
//                   /////////// Description
//                   AnimatedContainer(
//                     constraints: BoxConstraints(
//                       minHeight: _authMode == AuthMode.Signup ? 60 : 0,
//                       maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
//                     ),
//                     duration: Duration(milliseconds: 1500),
//                     curve: _authMode == AuthMode.Signup
//                         ? Curves.fastLinearToSlowEaseIn
//                         : Curves.linear,
//                     child: FadeTransition(
//                       opacity: _opacityAnimation,
//                       child: SlideTransition(
//                         position: _slideAnimation,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: "Description",
//                             labelStyle: TextStyle(
//                                 color: Theme.of(context).primaryColor),
//                           ),
//                           maxLines: 3,
//                           keyboardType: TextInputType.multiline,
//                           validator: (String value) {
//                             // if (value.isEmpty) {
//                             //   return 'Description is Request';
//                             // }
//                             // if (value.length < 10) {
//                             //   return 'Should be at least 10 characters long.';
//                             // }
//                             // return null;
//                           },
//                           focusNode: _descriptionfocusnode,
//                           onSaved: (String value) {},
//                         ),
//                       ),
//                     ),
//                   ),
 