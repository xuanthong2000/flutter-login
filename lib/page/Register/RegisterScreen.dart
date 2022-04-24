import 'package:firebase_auth/firebase_auth.dart'; //used for authentication
import 'package:flutter/material.dart';
import 'package:flutterapp/page/HomePage/HomePage.dart';
import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isSuccess;
  late String _userEmail;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _displayName,
                      decoration: const InputDecoration(labelText: 'Full Name'), //show one line to take user input
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ và tên';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập Email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập password';
                        }
                        return null;

                      },

                      obscureText: true,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: OutlineButton(
                        child: Text("register",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _registerAccount(); // funtion used to check your data is valid or not if valid pass that data to firebase and user to home or show a pop message
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
  // void _registerAccount() async {
  //
  //   final User? user = (await _auth.createUserWithEmailAndPassword(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   ))
  //       .user;
  //   if (user != null) {
  //     if (!user.emailVerified) {
  //       await user.sendEmailVerification();
  //     }
  //     await user.updateProfile(displayName: _displayName.text);
  //     final user1 = _auth.currentUser;
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => HomePageScreen(
  //           user: user1,
  //         )));
  //   } else {
  //     _isSuccess = false;
  //   }
  // }
  void _registerAccount() async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> handleSignInEmail(String email, String password) async {
  UserCredential result =
  await auth.signInWithEmailAndPassword(email: email, password: password);
  final User user = result.user!;

  return user;
  }

  Future<User> handleSignUp(email, password) async {
  UserCredential result = await auth.createUserWithEmailAndPassword(
  email: email, password: password);
  final User user = result.user!;

  return user;
  }
  }
}