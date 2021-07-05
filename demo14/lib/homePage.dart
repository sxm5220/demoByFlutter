import 'package:demo14/widgets/gender.dart';
import 'package:demo14/widgets/inputField.dart';
import 'package:demo14/widgets/membership.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: EdgeInsets.only(top: 60, bottom: 60, left: 120, right: 120),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.yellow[600],
                  child: Padding(
                    padding: EdgeInsets.only(top: 70, right: 50, left: 50),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              backgroundImage: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/6355504?v=4'),
                              radius: 70.0,
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "Let's get you set up",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "It should only take a couple of minutes to pair with your watch",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 50),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: Text(
                                ">",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 40, right: 70, left: 70, bottom: 40),
                  child: Column(
                    children: [
                      InputField(label: 'Name', content: 'Name'),
                      SizedBox(height: 20),
                      Gender(),
                      SizedBox(height: 20),
                      InputField(label: 'Date of birth', content: '07/05/1988'),
                      SizedBox(height: 20),
                      InputField(label: "Email", content: "sxm5220@gmail.com"),
                      SizedBox(height: 20.0),
                      InputField(label: "Customer ID", content: "22223311111"),
                      SizedBox(height: 40.0),
                      Membership(),
                      Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Row(
                          children: [
                            // SizedBox(width: 170),
                            TextButton(onPressed: () {}, child: Text('取消')),
                            SizedBox(width: 80),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '保存',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
