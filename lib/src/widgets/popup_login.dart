import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/widgets/btn_login.dart';

class PopupLogin extends StatefulWidget {
  const PopupLogin({super.key});

  @override
  State<PopupLogin> createState() => _PopupLoginState();
}

class _PopupLoginState extends State<PopupLogin> {
  bool _isObscured = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController userIdController = TextEditingController();
    TextEditingController pinController = TextEditingController();

    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextButton(
                onPressed: () {
                  // Perform login logic here
                  String userId = userIdController.text;
                  String pin = pinController.text;

                  // Close the dialog
                  Navigator.pop(context, 'Cancel');
                },
                child: const Text('Cancel'),
              ),
              const Text('Login'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: userIdController,
                decoration: const InputDecoration(
                  labelText: 'User ID',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: pinController,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'MPIN',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          _isObscured = !_isObscured;
                          print(_isObscured);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // TextButton(
            //   onPressed: () {
            //     // Perform login logic here
            //     String userId = userIdController.text;
            //     String pin = pinController.text;

            //     // Close the dialog
            //     Navigator.pop(context, 'Cancel');
            //   },
            //   child: const Text('Cancel'),
            // ),
            TextButton(
              onPressed: () {
                // Perform login logic here
                String userId = userIdController.text;
                String pin = pinController.text;

                // Close the dialog
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const BtnLogin(),
    );
  }
}
