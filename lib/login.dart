import 'package:flutter/material.dart';
import 'package:project2/Signup.dart';
import 'home.dart';
import 'Signup.dart';
void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login.png',
                height: 150.0,
              ),
              Padding(
                padding: EdgeInsets.all(30),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text('Remember Me'),
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()), // HomePage() เป็นหน้า Home ที่คุณสร้างขึ้น
                  );
                      // Add your authentication logic here
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      if (username == 'admin' && password == 'password') {
                        // Navigate to another screen or perform an action
                        // after successful login
                        print('Login Successful');
                      } else {
                        // Show error message or handle invalid credentials
                        print('Invalid username or password');
                      }
                    },
                    child: Text('register'),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'Log in with social',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/facebook.png'),
                        radius: 15,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/google.png'),
                        radius: 15,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/ig.png'),
                        radius: 15,
                      ),
                    ],
                  ),
                  
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                  // Navigate to home page
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // HomePage() เป็นหน้า Home ที่คุณสร้างขึ้น
                  );
                },

                    child: Text('Log-in'),
                  ),
                ),
              ),
              SizedBox(height: 40.0), 
            ],
          ),
        ),
      ),
    );
  }
}
