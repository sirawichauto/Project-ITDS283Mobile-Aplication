import 'package:flutter/material.dart';
import 'login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // เริ่มต้นที่ Index 3 (Profile)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()), // ให้ไปยังหน้า Login
          );
              // เพิ่มโค้ดสำหรับการออกจากระบบที่นี่
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile4.png'), // รูปโปรไฟล์
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ชื่อ',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'นามสกุล',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'อีเมล',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'หมายเลขโทรศัพท์',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ประเทศ',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ระบบบันทึกข้อมูล
              },
              child: Text('บันทึก'),
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
        onTap: _onItemTapped,
      ),
    );
  }
}