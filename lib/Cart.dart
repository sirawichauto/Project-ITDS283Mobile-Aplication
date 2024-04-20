import 'package:flutter/material.dart';
import 'booking.dart'; // Import the booking page
import 'home.dart';
import 'mytrips.dart';
import 'profile.dart';

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTripPage(),
    );
  }
}

class MyTripPage extends StatefulWidget {
  @override
  _MyTripPageState createState() => _MyTripPageState();
}

class _MyTripPageState extends State<MyTripPage> {
  int _selectedIndex = 0;
  List<bool> _isCheckedList = [false, false]; // Initialize with default values

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserved'),
        backgroundColor: Color.fromARGB(255, 59, 56, 235),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/cart1.png',
                    width: 200.0,
                    height: 100.0,
                  ),
                  SizedBox(width: 10), // Add space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'นาซ่า กรุงเทพ',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 1
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 2
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 3
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 4
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'Bangkok',
                            style: TextStyle(fontSize: 14.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isCheckedList[0], // Use value from the list
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedList[0] = value ?? false; // Update value in the list
                          });
                        },
                      ),
                      SizedBox(width: 8.0),
                      Text('1 x Deluxe Room'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('12 Mar - 13 Mar, 2024 (1 night)'),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        '1250 ฿',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/cart2.png',
                    width: 200.0,
                    height: 100.0,
                  ),
                  SizedBox(width: 10), // Add space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โรงแรมบียัวร์โฮม',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 1
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 2
                          Icon(Icons.star, color: Colors.yellow), // ดาวที่ 3
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'Bangkok',
                            style: TextStyle(fontSize: 14.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isCheckedList[0], // Use value from the list
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedList[0] = value ?? false; // Update value in the list
                          });
                        },
                      ),
                      SizedBox(width: 8.0),
                      Text('1 x Deluxe Room'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('12 Mar - 13 Mar, 2024 (1 night)'),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        '1250 ฿',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // Set width to occupy available space
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingPage()),
                    );
                  },
                  child: Text('Booking'),
                ),
              ),
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
}
