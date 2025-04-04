import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadGroup(String name, File imageFile) async {
  var uri = Uri.parse("http://34.64.233.128:5200/groups");

  var request =
      http.MultipartRequest("POST", uri)
        ..fields['dto'] = jsonEncode({
          "authorId": "1234",
          "name": name,
          "joinCode": "ABCD",
          "tags": ["tag1", "tag2"],
        })
        ..files.add(await http.MultipartFile.fromPath("image", imageFile.path));

  var response = request.send();
}
