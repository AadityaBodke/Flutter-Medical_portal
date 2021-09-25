import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCardList extends StatefulWidget {
  final List<User> userList;
  UserCardList({Key key, @required this.userList}) : super(key: key);

  @override
  UserListViewState createState() => UserListViewState();
}

class UserListViewState extends State<UserCardList> {
  Future<void> _makePhoneCall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not call $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.userList == null ? 0 : widget.userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    elevation: 30,
                    color: Colors.lightBlue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: " + widget.userList[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          Text(
                            'Contact: ' + widget.userList[index].contact,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => _makePhoneCall(
                                      'tel:${widget.userList[index].contact}'),
                                  icon: Icon(Icons.call, color: Colors.blue)),
                              IconButton(
                                  tooltip: "Press to see prescription.",
                                  icon: Icon(Icons.image_search_rounded),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          var height = MediaQuery.of(context)
                                              .size
                                              .height;
                                          var width =
                                              MediaQuery.of(context).size.width;
                                          var padding =
                                              MediaQuery.of(context).padding;
                                          var safeHeight = height -
                                              padding.top -
                                              padding.bottom;
                                          return Align(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: safeHeight,
                                                  maxWidth: width),
                                              child: CarouselSlider.builder(
                                                  itemCount: widget
                                                      .userList[index]
                                                      .imageCount,
                                                  itemBuilder: (BuildContext
                                                              context,
                                                          int itemIndex,
                                                          int pageViewIndex) =>
                                                      widget.userList[index]
                                                          .fetchImage(
                                                              itemIndex),
                                                  options: CarouselOptions(
                                                    enableInfiniteScroll: false,
                                                    height: safeHeight - 150,
                                                    enlargeCenterPage: true,
                                                  )),
                                            ),
                                          );
                                        });
                                  }),
                            ],
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          TextField(
                            decoration: new InputDecoration(
                              labelText: "Describe Your Availability...",
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
