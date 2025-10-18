import 'package:flutter/material.dart';

class Sclingfigma extends StatefulWidget {
  const Sclingfigma({super.key});

  @override
  State<Sclingfigma> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Sclingfigma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              // color: Color.fromARGB(255, 90, 90, 92),
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/kucingcool.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hallo!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 248, 248),
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please login to get full access from us',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'username',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Trisna',
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
                  ),
                  SizedBox(height: 5),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(width: double.infinity, height: 23),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 247, 247),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 350),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                        backgroundColor: const Color.fromARGB(255, 83, 25, 117),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      // SizedBox(width: 23),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 247, 245, 245),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),

                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          // margin: const EdgeInsets.only(top: 88, right: 48),
                          padding: const EdgeInsets.all(8),
                          width: 88,
                          height: 49,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 106, 106, 116),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            'assets/images/flat-color-icons_google.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // margin: const EdgeInsets.only(top: 88, right: 48),
                          padding: const EdgeInsets.all(8),
                          width: 88,
                          height: 49,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 106, 106, 116),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset('assets/images/cib_apple.png'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // margin: const EdgeInsets.only(top: 88, right: 48),
                          padding: const EdgeInsets.all(8),
                          width: 88,
                          height: 49,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 106, 106, 116),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset('assets/images/Frame 1.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
