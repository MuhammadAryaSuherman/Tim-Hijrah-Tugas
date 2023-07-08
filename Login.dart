import 'package:flutter/material.dart';
import 'Registrasi.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(height: 20),
      Center(
        child: Image.network(
            'https://static.thenounproject.com/png/28989-200.png',
            width: 100,
            height: 100),
      ),
      Container(
        child: Text('Registrasi',
            style: TextStyle(fontSize: 40, color: Colors.black)),
      ),
      SizedBox(height: 5),
      Text('Silahkan Login',
          style: TextStyle(fontSize: 14, color: Colors.black)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 15),
        child: TextFormField(
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), width: 2)),
              labelText: 'Email ',
              labelStyle: TextStyle(color: Colors.black)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 15),
        child: TextFormField(
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), width: 2)),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black)),
        ),
      ),
      SizedBox(
        height: 40,
      ),
      ElevatedButton(
          onPressed: () {},
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          )),
      SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Belum punya akun?'),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registrasi()),
                );
              },
              child: Text('Register'))
        ],
      )
    ]));
  }
}
