import 'package:flutter/material.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 51, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextFormFieldWithLabel('ชื่อ', _usernameController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('นามสกุล', _emailController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('ที่อยู่อีเมล', _passwordController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('หมายเลขโทรศัพท์', _phoneController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('ประเทศ/ภูมิภาค', _countryController),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String phone = _phoneController.text;
                  String country = _countryController.text;

                  print('Username: $username');
                  print('Email: $email');
                  print('Password: $password');
                  print('Phone: $phone');
                  print('Country: $country');
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormFieldWithLabel(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4), // ลดระยะห่างให้กล่องเหลี่ยมเล็กลง
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
