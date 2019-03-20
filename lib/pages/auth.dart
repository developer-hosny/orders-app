import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
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

  void _submitForm() {
    print(_formData);
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                      _buildSwitchRememberMe(),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        child: Text('LOGIN'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: _submitForm,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
