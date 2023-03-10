import 'dart:convert';
import 'package:app01/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var userName;

  HomePage({super.key, this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List BooksName = [];
  List BooksPrice = [];
  List BooksImage = [];
  List BooksUrl = [];
  List BooksSubTitle = [];

  void initState() {
    print('initState is called');
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(
              CupertinoIcons.person_alt_circle,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: BooksName.isEmpty
            ? CircularProgressIndicator()
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF2F0E4).withOpacity(0.5),
                              // spreadRadius: 8,
                              //  blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(BooksImage[index]),
                            Text(
                              BooksName[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              BooksSubTitle[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              BooksUrl[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              BooksPrice[index],
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.add),),

                                Text(
                                    'add to card',
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 0,
                    color: Colors.black,
                    width: double.infinity,
                  );
                },
                itemCount: BooksName.length),
      ),
    );
  }

  getData() async {
    http.Response response = await http.get(
      Uri.parse('https://api.itbook.store/1.0/search/mongodb'),
    );
    print(response.statusCode);
    var data = jsonDecode(response.body);
    var dataList = data['books'];
    setState(
      () {
        for (var item in dataList) {
          var title = item['title'];
          var price = item['price'];
          var image = item['image'];
          var url = item['url'];
          var subTitle = item['subtitle'];
          BooksImage.add(image);
          BooksName.add(title);
          BooksPrice.add(price);
          BooksUrl.add(url);
          BooksSubTitle.add(subTitle);
        }
      },
    );
  }
}
