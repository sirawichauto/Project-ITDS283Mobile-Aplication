import 'package:flutter/material.dart';
import 'package:project2/models/profile.dart';
import 'details.dart';
import 'mytrips.dart';
import 'Cart.dart';
import 'profile.dart';


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
          backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8), // เพิ่มความโปร่งใสให้กับ Navigation Bar
        ),
      ),
      // เพิ่มการกำหนดเส้นทางของหน้า DetailsPage
      routes: {
        '/details': (context) => HotelDetailsPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDetailsApp()),
                  );
                },
                child: Image.asset(
                  'assets/home1.png',
                  width: 350,
                  height: 350,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDetailsApp()),
                  );
                },
                child: Image.asset(
                  'assets/home2.png',
                  width: 350,
                  height: 350,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDetailsApp()),
                  );
                },
                child: Image.asset(
                  'assets/home3.png',
                  width: 350,
                  height: 350,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDetailsApp()),
                  );
                },
                child: Image.asset(
                  'assets/home4.png',
                  width: 350,
                  height: 350,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelDetailsApp()),
                  );
                },
                child: Image.asset(
                  'assets/home5.png',
                  width: 350,
                  height: 350,
                ),
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
