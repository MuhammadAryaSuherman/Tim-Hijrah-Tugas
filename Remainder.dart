import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
  DateTime? selectedDate;
  TextEditingController _dateTimeController = TextEditingController();
  bool showSelectDateButton = true;

  @override
  void dispose() {
    _dateTimeController.dispose();
    super.dispose();
  }

  String formatDateTime(DateTime date, Time time) {
    final formattedDate = "${date.day}-${date.month}-${date.year}";
    final formattedTime = "${time.hour}:${time.minute}:${time.second}";
    return "$formattedDate $formattedTime";
  }

  void _showReminderDialog() {
    final String formattedDate =
        "${selectedDate?.day}-${selectedDate?.month}-${selectedDate?.year}";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reminder'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Selected date: $formattedDate'),
              Text('Selected time: ${_time.hour}:${_time.minute}'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void updateDateTime() {
    if (_dateTimeController.text.isNotEmpty) {
      final dateTimeParts = _dateTimeController.text.split(' ');
      final dateParts = dateTimeParts[0].split('-');
      final timeParts = dateTimeParts[1].split(':');

      final day = int.tryParse(dateParts[0]);
      final month = int.tryParse(dateParts[1]);
      final year = int.tryParse(dateParts[2]);
      final hour = int.tryParse(timeParts[0]);
      final minute = int.tryParse(timeParts[1]);
      final second = int.tryParse(timeParts[2]);

      if (day != null &&
          month != null &&
          year != null &&
          hour != null &&
          minute != null &&
          second != null) {
        setState(() {
          selectedDate = DateTime(year, month, day, hour, minute, second);
          _time = Time(hour: hour, minute: minute, second: second);
        });
      }
    }
  }

  void _updateTime() {
    final timeParts = _dateTimeController.text.split(' ')[1].split(':');
    final hour = int.tryParse(timeParts[0]);
    final minute = int.tryParse(timeParts[1]);
    final second = int.tryParse(timeParts[2]);

    if (hour != null && minute != null && second != null) {
      setState(() {
        _time = Time(hour: hour, minute: minute, second: second);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1988),
      lastDate: DateTime(2038),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _time = Time(
          hour: pickedDate.hour,
          minute: pickedDate.minute,
          second: pickedDate.second,
        );
        _dateTimeController.text = formatDateTime(selectedDate!, _time);
        showSelectDateButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Image.network(
                'https://static.thenounproject.com/png/28989-200.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Set your reminder',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Pick a time of the day when you would like to receive a haircut reminder.',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),
            if (showSelectDateButton)
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date'),
              ),
            SizedBox(height: 10),
            if (selectedDate != null)
              Column(
                children: [
                  TextField(
                    controller: _dateTimeController,
                    onChanged: (value) {
                      setState(() {
                        updateDateTime();
                        _updateTime();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Date and Time',
                    ),
                  ),
                  SizedBox(height: 16),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          showPicker(
                            isInlinePicker: true,
                            elevation: 1,
                            value: _time,
                            onChange: (newTime) {
                              setState(() {
                                _time = newTime;
                                _dateTimeController.text =
                                    formatDateTime(selectedDate!, _time);
                              });
                            },
                            minuteInterval: TimePickerInterval.FIVE,
                            iosStylePicker: iosStyle,
                            minHour: 9,
                            maxHour: 21,
                            is24HrFormat: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _showReminderDialog,
                    child: Text('Save Reminder'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
