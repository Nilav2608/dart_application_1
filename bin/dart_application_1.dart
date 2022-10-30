import 'dart:convert';
import 'dart:mirrors';

import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  try {
      var data = await getData();
      var students = data['candidates'];

      for (var i = 0; i < students.length; i++) {
        print(students[i]['name']);
        print(students[i]['number']);
      }
  } catch (e) {
    print("Failed to get data");
  }

  postData();
}

Future postData() async {
  var url = "https://jsonplaceholder.typicode.com/posts";
  try {
    final response = await post(Uri.parse(url), body: {
      "title": "Stephen Hawking",
      "body": "Good scientist",
      "userId": "1"
    });
    print(response.body);
    // ignore: empty_catches
  } catch (e) {}
}

Future getData() async {
  final response1 =
      await get(Uri.parse("https://dl.dropboxusercontent.com/s/di27fjjj766ia8p/api.json?dl=0"));


  if (response1.statusCode == 200) {
    return jsonDecode(response1.body);
  } else {
    throw Exception();
  }
}
