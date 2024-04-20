import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project2/Signup.dart';
import 'package:project2/models/profile.dart';
import 'package:toastification/toastification.dart';
import 'home.dart';
import 'Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: formKey,
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
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(errorText: "Invalid Email"),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) {
                    profile.email = email;
                  },
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "Invalid password"),
                  ]),
                  onSaved: (String? password) {
                    profile.password = password;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text('Remember Me'),
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                      child: Text('Register'),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        toastification.show(
                          context: context,
                          title: Text('เกิดข้อผิดพลาด!!!'),
                          autoCloseDuration: const Duration(seconds: 5),
                        );
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(
                              " email = ${profile.email} password = ${profile.password}");

                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: profile.email!,
                                    password: profile.password!)
                                .then((value) {
                              formKey.currentState!.reset();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            });
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                            print(e.message);
                            String message;
                            if (e.code == 'invalid-credential') {
                              message = "อีเมล หรือ รหัสผ่านไม่ถูกต้อง";
                            } else {
                              message = e
                                  .message!; // ใช้ข้อความข้อผิดพลาดที่ส่งกลับจาก Firebase
                            }
                            // Fluttertoast.showToast(
                            //   msg: message,
                            //   gravity: ToastGravity.CENTER,
                            // );
                          }
                        }
                      },
                      child: Text('Log in'),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
