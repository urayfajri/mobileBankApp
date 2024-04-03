import 'package:flutter/material.dart';

class QrisPaymentInput extends StatelessWidget {
  const QrisPaymentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 218, 218, 218),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AmountInput(),
          SizedBox(height: 25),
          _InputPassword(),
        ],
      ),
    );
  }
}

class _AmountInput extends StatelessWidget {
  const _AmountInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nominal",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Ex: 1.500.000"),
        ),
      ],
    );
  }
}

class _InputPassword extends StatefulWidget {
  const _InputPassword();

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<_InputPassword> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Masukkan Password Transaksi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            fontSize: 19,
          ),
        ),
        TextFormField(
          obscureText: showPassword,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                showPassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
