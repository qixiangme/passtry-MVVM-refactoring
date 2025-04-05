import 'dart:convert';
import 'package:componentss/features/study/data/ranking_model.dart';
import 'package:http/http.dart' as http;
import 'group_model.dart'; // GroupModel 파일 import

class GroupApi {
  final String baseUrl = "http://34.64.233.128:5200";

  // 그룹 정보 가져오기 (joinCode 기반)
  Future<GroupModel?> getGroupByJoinCode(String joinCode) async {
    final url = Uri.parse("$baseUrl/groups/joinCode/$joinCode");

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

  Future<List<GroupModel>?> getGroupsById(String Id) async {
    final url = Uri.parse("$baseUrl/groups/userId/$Id");

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

Future<Map<String, int>> fetchMemberScores(List<String> memberIds) async {
  Map<String, int> memberScores = {};

  for (String memberId in memberIds) {
    final url = Uri.parse("http://34.64.233.128:5200/missions/score/$memberId");

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final int score = int.parse(response.body.trim());
        memberScores[memberId] = score;
        print("점수 가져오기 성공");
      } else {
        print('❌ 점수 가져오기 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 요청 중 오류 발생: $e');
    }
  }

  return memberScores;
}

Future<List<RankingModel>> fetchDailyRanking(String groupId) async {
  final String baseUrl = "http://34.64.233.128:5200";
  final url = Uri.parse("$baseUrl/missions/groups/$groupId/daily-ranking");
  print(groupId);

  try {
    print("🔄 랭킹 데이터 요청 시작: $url");
    final response = await http
        .get(url, headers: {'Content-Type': 'application/json'})
        .timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print("✅ 랭킹 데이터 가져오기 성공: $data");
      return data.map((item) => RankingModel.fromJson(item)).toList();
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
      return [];
    }
  } catch (e) {
    print("GET 요청 실패: $e");
    return [];
  }
}
