import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project2/Cart.dart';
import 'package:project2/home.dart';
import 'package:project2/mytrips.dart';
import 'package:project2/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  int _selectedIndex = 0; // เพิ่มตัวแปร _selectedIndex และกำหนดค่าเริ่มต้นเป็น 0

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

  Future<void> _sendBookingToFirebase() async {
    String numberOfPeople = _numberOfPeopleController.text;
    String numberOfRooms = _numberOfRoomsController.text;
    String paymentMethod = _selectedPaymentMethod ?? 'N/A';
    String date = _selectedDate != null ? _selectedDate.toString().substring(0, 10) : 'N/A';

    if (numberOfPeople.isNotEmpty &&
        numberOfRooms.isNotEmpty &&
        paymentMethod != 'N/A' &&
        date != 'N/A') {
      // ลบข้อมูลที่เคยบันทึกไว้ใน Firestore
      await FirebaseFirestore.instance
          .collection('bookings')
          .where('date', isEqualTo: _selectedDate?.toString().substring(0, 10))
          .where('paymentMethod', isEqualTo: paymentMethod)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      // เพิ่มข้อมูลการจองล่าสุดลงใน Firestore
      await FirebaseFirestore.instance.collection('bookings').add({
        'numberOfPeople': numberOfPeople,
        'numberOfRooms': numberOfRooms,
        'paymentMethod': paymentMethod,
        'date': date,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Booking Confirmed'),
            content: Text('Your booking has been successfully recorded.'),
            actions: <Widget>[
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

      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields before confirming.'),
            actions: <Widget>[
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
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyTripApp()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartApp()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
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
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _sendBookingToFirebase(); // เรียกฟังก์ชันส่งข้อมูลไปยัง Firestore
                setState(() {}); // อัปเดตหน้าจอเมื่อการจองเสร็จสมบูรณ์
              },
              child: Text('Confirm'),
            ),

            SizedBox(height: 20.0),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('bookings')
                  .where('date', isEqualTo: _selectedDate?.toString().substring(0, 10))
                  .orderBy('date', descending: true) // เรียงลำดับตามวันที่ล่าสุด
                  .limit(1) // จำกัดเพียงหนึ่งเอกสาร
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (_selectedDate == null || _selectedPaymentMethod == null) {
                  return SizedBox(); // ไม่แสดงข้อมูลเมื่อยังไม่มีการเลือกวันที่หรือวิธีการชำระเงิน
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No bookings for selected date.'),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('People: ${doc['numberOfPeople']}'),
                          Text('Rooms: ${doc['numberOfRooms']}'),
                          Text('Date: ${doc['date']}'),
                          Text('Payment Method: ${doc['paymentMethod']}'),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Mytrips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // เรียกใช้ _onItemTapped เมื่อแตะที่ไอเท็มใน BottomNavigationBar
      ),
    );
  }
}
