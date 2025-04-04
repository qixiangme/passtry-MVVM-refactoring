import 'dart:convert';
import 'package:componentss/features/baking/data/mission_model.dart';
import 'package:http/http.dart' as http;

class MissionApi {
  static const String baseUrl = "http://localhost:8080/missions"; // 서버 주소

  // 특정 스테이지 & 인덱스 미션 가져오기
  static Future<Mission?> fetchMission(int stage, int index) async {
    final response = await http.get(Uri.parse("$baseUrl/$stage/$index"));

    if (response.statusCode == 200) {
      return Mission.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to load mission: ${response.statusCode}");
      return null;
    }
  }

  // 데일리 미션 가져오기
  static Future<Map<String, Mission>> fetchDailyMissions(String userId) async {
    final url = Uri.parse(
      "http://your-api-url.com/missions/daily?userId=$userId",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {
        "oddMission": Mission.fromJson(data["oddMission"]),
        "evenMission": Mission.fromJson(data["evenMission"]),
      };
    } else {
      throw Exception("미션을 불러오는 데 실패했습니다.");
    }
  }
}
