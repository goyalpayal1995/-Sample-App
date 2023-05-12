import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import '../models/user_model.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController _controller = UserController();
  final UserModel _user = UserModel();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body:  SingleChildScrollView(
      child: Padding(
    padding: const EdgeInsets.all(
      16
    ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _user.name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email address';
                  } else if (!_controller.isEmail(value)) {
                    return 'Please enter valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _user.email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                onSaved: (value) {
                  _user.password = value;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _controller.user = _user;
                    _controller.register(context);
                  }
                },
                child: Text("Register"),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login here"),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
