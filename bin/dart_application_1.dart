import 'dart:convert';

import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  try {
    var data = await getData();
    var students = data['candidates'];

    for (var i = 0; i < students.length; i++) {
      print(students[i]['name']);
      print(students[i]['number']);
    }
  } catch (e) {
    print("Failed to fetch data");
  }
  postData();
  //   final response = await http.post(
  //   Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, dynamic>{
  //     'title': 'Example Title',
  //     'body': 'Example Body',
  //     'userId': 1,
  //   }),
  // );

  // if (response.statusCode == 201) {
  //   print('Data posted successfully.');
  // } else {
  //   print('Failed to post data. Error code: ${response.statusCode}');
  // }
}

Future postData() async {
  var url = "https://dl.dropboxusercontent.com/s/uwnqngke9tu6d8x/fakeapi.txt?dl=0";

  final response = await http.post(Uri.parse(url),
      body: jsonEncode(<String, dynamic>{
      "name": "sam",
      "number": 9876543210,
      "email": "sam@gmail.com",
      "imageUrl" : "https://firebasestorage.googleapis.com/v0/b/noteslogin-13e18.appspot.com/o/random%20image%2Fmen003.jpg?alt=media&token=8085ee1b-d6de-4fe2-a086-52828ed77008"
       
      }));

  if (response.statusCode == 201) {
    print("data posted successfully");
  } else {
    print('failed to post data : statuscode ${response.statusCode}');
  }
  // ignore: empty_catches
}

Future getData() async {
  final response1 = await http.get(Uri.parse(
      "https://dl.dropboxusercontent.com/s/di27fjjj766ia8p/api.json?dl=0"));

  if (response1.statusCode == 200) {
    return jsonDecode(response1.body);
  } else {
    throw Exception();
  }
}
