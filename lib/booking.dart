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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'จำนวนคน'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'จำนวนห้อง'),
              keyboardType: TextInputType.datetime,
            ),
            
            SizedBox(height: 20.0),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'วิธีชำระเงิน'),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String date = _dateController.text;
                // ทำการจองโดยใช้ข้อมูล name และ date
                // ในที่นี้เราจะแค่แสดงข้อความที่ต้องการจอง
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Booking for $name on $date'),
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
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
