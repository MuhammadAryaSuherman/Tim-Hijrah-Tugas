import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<String> selectedTimes = [];

  List<String> availableTimesRow1 = [
    '10.00',
    '10.30',
    '11.00',
    '11.30',
    '12.00',
    '13.00',
    '13.30',
  ];

  List<String> availableTimesRow2 = [
    '14.00',
    '14.30',
    '15.00',
    '15.30',
    '16.00',
    '16.30',
    '17.00',
  ];

  List<String> availableTimesRow3 = [
    '17.30',
    '18.00',
    '18.30',
    '19.00',
    '19.30',
    '20.00',
    '20.30',
  ];

  List<String> dropdownItems = [
    'Premium Cut + Cuci Muka',
    'Reguler Cut + Cuci Muka',
    'Premium Cut',
    'Reguler Cut',
  ];
  String? selectedValue;
  TextEditingController jamBookingController = TextEditingController();

  int _currentIndex = 0;

  @override
  void dispose() {
    jamBookingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Booking Page'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 140,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      buildTimeRow(availableTimesRow1),
                      SizedBox(height: 16),
                      buildTimeRow(availableTimesRow2),
                      SizedBox(height: 16),
                      buildTimeRow(availableTimesRow3),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 380,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<String>(
                          hint: Text('Paket Yang Dipilih'),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          items: dropdownItems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukan Tanggal',
                      hintText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: jamBookingController,
                    decoration: InputDecoration(
                      labelText: 'Jam Booking',
                      hintText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Total Harga',
                      hintText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: () {}, child: Text('Booking')),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Reminder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeRow(List<String> times) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: times.map((time) {
        final isSelected = selectedTimes.contains(time);

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTimes.clear();
              if (!isSelected) {
                selectedTimes.add(time);
                jamBookingController.text = time;
              } else {
                jamBookingController.text = '';
              }
            });
          },
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
