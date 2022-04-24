import 'package:flutter/material.dart';
import 'package:flutterapp/page/Login/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset("assets/images/splash.png"),
            ),

            Text(
              "Kết nối bạn bè\nvà người thân một cách\n dễ dàng",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Text(
              "Điều khoản sử dụng & Chính sách bảo mật",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
                width:
                MediaQuery.of(context).size.width * 0.8, // <-- Your width
                height: 50, // <-- Your height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                login()));
                  },
                  child: Text('BẮT ĐẦU'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.pink, // background
                    onPrimary: Colors.white,
                  ),
                ))
          ],
        ),
        // child: InkWell(
        //     onTap: (){
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) =>
        //                   LoginScreen()));
        //     },
        //     child: Text("Đây là Splash")),
      ),
    );
  }
}
