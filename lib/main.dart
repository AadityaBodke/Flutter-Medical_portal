import '/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}



//Old Code
  // Future<String> getJsonData() async {
  //   final response = await http.get(
  //     Uri.parse(Uri.encodeFull(url)),
  //     //headers: {"Accept": "application/json"}
  //   );
  //   print(response.body);
  //   setState(() {
  //     var convertDataToJson = jsonDecode(response.body);
  //     data = convertDataToJson;
  //   });
  //   return "Success";
  // }
  // Widget BuildResults(BuildContext context) {
  //   // @override
  //   // void initState(){
  //   //   super.initState();
  //   //   this.getJsonData();
  //   // }
  //   return FutureBuilder<List<User>>(
  //     future: _fetchUsers(dis: query),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List<User> data = snapshot.data;
  //         return _usersListView(img);
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       }
  //       return CircularProgressIndicator();
  //     },
  //   );
  // }
  // ListView _usersListView(image) {
  //   return ListView.builder(
  //       itemCount: image == null ? 0 : image.length,
  //       itemBuilder: (BuildContext context, int i) {
  //         return new Container(
  //           child: new Center(
  //             child: new Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Card(
  //                   elevation: 20,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   child: Padding(
  //                     padding: EdgeInsets.all(12),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         // Text(
  //                         //   image[i].img,
  //                         //   style: TextStyle(
  //                         //     fontSize: 24,
  //                         //     fontWeight: FontWeight.bold,
  //                         //   ),
  //                         // ),
  //                         Image(image: image[i].img)
  //                         // Image.network('http://192.168.43.185:3000/' + image[i].img,
  //                         //   width: 50, height: 50, fit: BoxFit.contain,
  //                         //   )
  //                         // const SizedBox(height: 12),
  //                         // Text(
  //                         //   data[index].description,
  //                         //   style: TextStyle(fontSize: 20),
  //                         // ),
  //                       ],
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }