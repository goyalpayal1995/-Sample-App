import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';

class HomePage extends StatelessWidget {


  final UserController _controller = UserController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to your app!",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.logout(context);
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
