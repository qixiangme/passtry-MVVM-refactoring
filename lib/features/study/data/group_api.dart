import 'dart:convert';
import 'package:http/http.dart' as http;
import 'group_model.dart'; // GroupModel 파일 import

class GroupApi {
  final String baseUrl = "http://34.64.233.128:5200";

  // 그룹 정보 가져오기
  Future<GroupModel?> getGroup(String Id) async {
    final url = Uri.parse("$baseUrl/groups");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return GroupModel.fromJson(data);
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        return null;
      }
    } catch (e) {
      print("GET 요청 실패: $e");
      return null;
    }
  }

  Future<List<GroupModel>?> getGroups() async {
    final url = Uri.parse("$baseUrl/groups");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((group) => GroupModel.fromJson(group)).toList();
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        return null;
      }
    } catch (e) {
      print("GET 요청 실패: $e");
      return null;
    }
  }

  Future<bool> joinGroup(String groupId, String userId) async {
    final url = Uri.parse("$baseUrl/groups/$groupId/join/$userId");

    try {
      final response = await http.put(url);

      return true;
    } catch (e) {
      print("PUT 요청 실패: $e");
      return false;
    }
  }

  
}
