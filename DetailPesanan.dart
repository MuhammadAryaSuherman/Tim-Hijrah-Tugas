import 'package:flutter/material.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({super.key});

  @override
  State<DetailPesanan> createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Pesanan'), leading: Icon(Icons.arrow_back)),
      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 23)),
              ClipRRect(
                  borderRadius: BorderRadius.circular(55.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                        'https://static.thenounproject.com/png/28989-200.png'),
                  )),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aryaa', style: TextStyle(fontSize: 30)),
                  SizedBox(height: 6),
                  Text('F-713901 | 13:30', style: TextStyle(fontSize: 25)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 5, 5, 5), width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Text('1x Premium Cut', style: TextStyle(fontSize: 15)),
                    SizedBox(width: 146),
                    Text('Rp: 100.000', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 5, 5, 5), width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Text('1x Cuci Muka', style: TextStyle(fontSize: 15)),
                    SizedBox(width: 170),
                    Text('Rp: 25.000', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 23),
            padding: const EdgeInsets.only(bottom: 37),
            child: Row(
              children: [
                Text('Total:', style: TextStyle(fontSize: 17)),
                SizedBox(width: 194),
                Text('Rp: 125.000', style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize: MaterialStateProperty.all<Size>(Size(260, 44)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text('Batalkan Pesanan', style: TextStyle()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
