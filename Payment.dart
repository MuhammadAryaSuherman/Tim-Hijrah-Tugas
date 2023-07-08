import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool selectedDana = false;
  bool selectedGopay = false;
  bool selectedOvo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                'https://png.pngtree.com/element_our/png_detail/20181226/touch-screen-line-black-icon-png_281631.jpg',
                width: 100,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 5, 5, 5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
              ),
              width: 450, // Ukuran lebar border
              height: 75, // Ukuran tinggi border
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Mengatur posisi teks
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'RP 500.000',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container()), // Ruang kosong sebelah kanan teks
                  Container(
                    width: 70, // Ukuran lebar teks hyperlink
                    child: GestureDetector(
                      onTap: () {
                        // Aksi ketika teks hyperlink ditekan
                      },
                      child: Text(
                        'Lihat Detail',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tambahkan SizedBox di bawah border
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(7.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 5, 5, 5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
              ),
              width: 450,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Logo_dana_blue.svg/2560px-Logo_dana_blue.svg.png',
                    width: 50,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Dana',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Radio(
                    value: 1,
                    groupValue: selectedDana ? 1 : 0,
                    onChanged: (value) {
                      setState(() {
                        selectedDana = true;
                        selectedGopay = false;
                        selectedOvo = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(7.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 5, 5, 5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
              ),
              width: 450,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://1.bp.blogspot.com/-NwSMFZdU8l4/XZxj8FxN6II/AAAAAAAABdM/oTjizwstkRIqQZ7LOZSPMsUG3EYXF3E4wCEwYBhgL/s1600/logo-gopay-vector.png',
                    width: 50,
                    height: 50,
                  ),
                  Padding(padding: const EdgeInsets.only(left: 10.0)),
                  Text(
                    'Gopay',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Expanded(child: Container()),
                  Radio(
                    value: 2,
                    groupValue: selectedGopay ? 2 : 0,
                    onChanged: (value) {
                      setState(() {
                        selectedDana = false;
                        selectedGopay = true;
                        selectedOvo = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(7.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 5, 5, 5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
              ),
              width: 450,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://1.bp.blogspot.com/-Iq0Ztu117_8/XzNYaM4ABdI/AAAAAAAAHA0/MabT7B02ErIzty8g26JvnC6cPeBZtATNgCLcBGAsYHQ/s1000/logo-ovo.png',
                    width: 50,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Ovo',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container()), // Ruang kosong sebelah kanan teks
                  Radio(
                    value: 3,
                    groupValue: selectedOvo ? 3 : 0,
                    onChanged: (value) {
                      setState(() {
                        selectedDana = false;
                        selectedGopay = false;
                        selectedOvo = true;
                      });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  // Tindakan yang dijalankan ketika tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(458, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
