import 'package:flutter/material.dart';
import 'package:orders_app/models/auth.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope-models/main.dart';

enum AuthMode { Signup, Login }

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {'email': null, 'password': null};
  bool _rememberMe = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;
  // AuthService _authService = AuthService();
  String statusMessage;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.contain,
        repeat: ImageRepeat.repeat,
        colorFilter:
            ColorFilter.mode(Colors.lime.withOpacity(0.9), BlendMode.overlay),
        image: AssetImage('assets/food-pattern.gif'));
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      initialValue: 'a@a.com',
      decoration: InputDecoration(
          labelText: 'E-Mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        Pattern pattern =
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
        RegExp regex = new RegExp(pattern);

        if (value.isEmpty || !regex.hasMatch(value)) {
          return 'Invalid email';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      // initialValue: '123456',
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your password';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Confirm password',
            filled: true,
            fillColor: Colors.white),
        obscureText: true,
        validator: (String value) {
          if (_passwordController.text != value) {
            return 'Password do not mach!';
          }
        });
  }

  Widget _buildSwitchRememberMe() {
    return SwitchListTile(
      title: Text(
        'Remeber Me',
        style: TextStyle(color: Colors.grey),
      ),
      value: _rememberMe,
      onChanged: (bool value) {
        setState(() {
          _rememberMe = value;
        });
      },
    );
  }

  Widget _buildStatusMessage() {
    Widget _text = Text('');
    if (statusMessage != null) {
      _text = Text(statusMessage.toString(),
          style: TextStyle(color: Colors.red.shade400));
    }
    return _text;
  }

  void _submitForm(MainModel model) {
    print(_formData);
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    String _email = _formData['email'];
    String _password = _formData['password'];

    if (_authMode == AuthMode.Login) {
      // login(_email, _password);
      model.signIn(_email, _password).then((String message) {
        setState(() {
          statusMessage = message;
        });
        Navigator.pushReplacementNamed(context, '/restaurants');
      });
    } else {
      model.signUp(_email, _password).then((String message) {
        setState(() {
          statusMessage = message;
        });
      });
    }

    // login(_formData['email'], _formData['password']);
    // var authState = _auth.signIn(_formData['email'], _formData['password']);
    // print('authState > '+ authState.toString());
    // _formKey.currentState.reset();

    // Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, '/restaurants');
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Login'),
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWith,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.lime),
                    borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildEmailTextField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTextField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _authMode == AuthMode.Signup
                            ? _buildPasswordConfirmTextField()
                            : Container(),
                        _buildSwitchRememberMe(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildStatusMessage(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                '${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _authMode = _authMode == AuthMode.Login
                                      ? AuthMode.Signup
                                      : AuthMode.Login;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ScopedModelDescendant(
                              builder: (BuildContext context, Widget child,
                                  MainModel model) {
                                return RaisedButton(
                                  child: Text(_authMode == AuthMode.Login
                                      ? 'Login'
                                      : 'Signup'),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  onPressed: () => _submitForm(model),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            FlatButton(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Login With Google Account',
                                    style: TextStyle(
                                      color: Colors.green,
                                      // decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  // Image.asset(
                                  //   'assets/icons/google_account.png',
                                  //   scale: 4,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ],
                              ),
                              onPressed: () {
                                // model.googleSignIn();
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
