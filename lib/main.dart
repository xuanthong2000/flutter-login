import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/page/Login/LoginScreen.dart';
import 'package:flutterapp/page/Splash/SplashScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    bool check = false;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avo', primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return SplashScreen();
        }
      },
    );
  }
}
class MyHomePage extends StatefulWidget {


  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars), onPressed: () {  },
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(" ", style: TextStyle()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.newspaper,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('post')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              // handle error
              return const Text('Loading');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              // return progress indicator widget
              return const Center(child: CircularProgressIndicator());
            }

            // here you should get the streamed documents like:
            // snapshot.data!.docs

            // so to build a ListView for example:

            return ListView(
              children:
              snapshot.data!.docs.map((DocumentSnapshot document) {
                final animal = document.data();
                return Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350.0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                        child: Material(
                          color: Colors.white,
                          elevation: 14.0,
                          shadowColor: Color(0x802196F3),
                          child: Center(child: Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          ),),
                      ),
                    ),

                  ],
                );
              }).toList(),
            );
          }),
    );
  }
}