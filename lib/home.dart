import 'package:flutter/material.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.withOpacity(0.8), // เพิ่มความโปร่งใสให้กับ Navigation Bar
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white, // กำหนดสีของข้อความใน title เป็นสีขาว
          ),
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Image.asset(
                'assets/home1.png',
                width: 350,
                height: 350,
              ),
              Image.asset(
                'assets/home2.png',
                width: 350,
                height: 350,
              ),
              Image.asset(
                'assets/home3.png',
                width: 350,
                height: 350,
              ),
              Image.asset(
                'assets/home4.png',
                width: 350,
                height: 350,
              ),
              Image.asset(
                'assets/home5.png',
                width: 350,
                height: 350,
              ),
            ],
          ),
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
            icon: Icon(Icons.directions_car), // เปลี่ยน icon จาก search เป็น Mytrips
            label: 'Mytrips', // เปลี่ยน label จาก Search เป็น Mytrips
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // เปลี่ยน icon จาก favorite เป็น Cart
            label: 'Cart', // เปลี่ยน label จาก Favorites เป็น Cart
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
