import 'package:flutter/material.dart';
import 'Login.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          Text('Silahkan Daftar dengan Email Anda!',
              style: TextStyle(fontSize: 14, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                  labelText: 'Email Address',
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
                  labelText: 'Username',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                  labelText: 'Konfirmasi Password',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Registrasi'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sudah punya akun?'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Login'))
            ],
          )
        ],
      ),
    );
  }
}
