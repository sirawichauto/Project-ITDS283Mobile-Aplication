import 'package:flutter/material.dart';

void main() {
  runApp(BookingApp());
}

class BookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController _numberOfPeopleController = TextEditingController();
  TextEditingController _numberOfRoomsController = TextEditingController();
  String? _selectedPaymentMethod;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _numberOfPeopleController,
              decoration: InputDecoration(labelText: 'จำนวนคน'),
            ),
            TextFormField(
              controller: _numberOfRoomsController,
              decoration: InputDecoration(labelText: 'จำนวนห้อง'),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text('ชำระผ่านแอพธนาคาร'),
                  value: 'ชำระผ่านแอพธนาคาร',
                ),
                DropdownMenuItem(
                  child: Text('ชำระผ่านบัตรเครดิต'),
                  value: 'ชำระผ่านบัตรเครดิต',
                ),
                DropdownMenuItem(
                  child: Text('ชำระผ่านเงินสด'),
                  value: 'ชำระผ่านเงินสด',
                ),
              ],
              decoration: InputDecoration(labelText: 'วิธีชำระเงิน'),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'วันที่',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate != null ? _selectedDate.toString().substring(0, 10) : 'N/A',
                  ),
                ),
              ),
            ),
            SizedBox(height: 350.0),
            ElevatedButton(
              onPressed: () {
                String numberOfPeople = _numberOfPeopleController.text;
                String numberOfRooms = _numberOfRoomsController.text;
                String date = _selectedDate != null ? _selectedDate.toString().substring(0, 10) : 'N/A';
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Booking for $numberOfPeople people in $numberOfRooms rooms on $date with payment method: $_selectedPaymentMethod'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
