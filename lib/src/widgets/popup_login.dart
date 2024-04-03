import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/widgets/btn_login.dart';

class PopupLogin extends StatelessWidget {
  const PopupLogin({super.key});

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
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'MPIN',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
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
