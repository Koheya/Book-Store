import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app01/login_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Book Store',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF2F0E4).withOpacity(0.5),
                    )
                  ]),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.profile_circled,
                    size: 130,
                  ),
                  Text(
                    'Hello Sir',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Color(0xFFF2F0E4).withOpacity(0.5),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 5),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFF2F0E4).withOpacity(0.5),
                      )
                    ]),
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          size: 30,
                        )
                        , MaterialButton(
                          height: 100,
                          onPressed: () {},
                          child: Text(
                            'Your Card',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                        )
                        , MaterialButton(
                          height: 100,
                          onPressed: () {},
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.perm_device_information,
                          size: 30,
                        )
                        , MaterialButton(
                          height: 100,
                          onPressed: () {},
                          child: Text(
                            'About us',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 30,
                        )
                        , MaterialButton(
                          height: 100,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => loginPage()));
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
