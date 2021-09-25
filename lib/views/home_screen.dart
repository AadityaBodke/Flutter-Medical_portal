import 'dart:async';
import 'package:flutter/material.dart';
import '/models/user.dart';
import '/widgets/user_card_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomeScreen> {
  Future<List<User>> userList;

  @override
  void initState() {
    super.initState();
    userList = User.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Medical Portal"),
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: FutureBuilder(
            future: userList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return UserCardList(userList: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

