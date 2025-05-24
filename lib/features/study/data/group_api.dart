import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/study/data/ranking_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'group_model.dart'; // GroupModel 파일 import
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupApi {
  final String baseUrl = "http://34.64.233.128:5200";

  // 그룹 정보 가져오기 (joinCode 기반)
  Future<GroupModel?> getGroupByJoinCode(String joinCode) async {
    final url = Uri.parse("$baseUrl/groups/joinCode/$joinCode");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBodyBytes = response.bodyBytes;
        final responseBodyString = utf8.decode(responseBodyBytes);
        final data = jsonDecode(responseBodyString);
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
        final responseBodyBytes = response.bodyBytes;
        final responseBodyString = utf8.decode(responseBodyBytes);
        final List<dynamic> data = jsonDecode(responseBodyString);
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
        final responseBodyBytes = response.bodyBytes;
        final responseBodyString = utf8.decode(responseBodyBytes);
        final List<dynamic> data = jsonDecode(responseBodyString);
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

  Future<Map<String, int>> fetchMemberScores(List<String> memberIds) async {
    Map<String, int> memberScores = {};

    for (String memberId in memberIds) {
      final url = Uri.parse(
        "http://34.64.233.128:5200/missions/score/$memberId",
      );

      try {
        final response = await http.get(
          url,
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final responseBodyBytes = response.bodyBytes;
          final responseBodyString = utf8.decode(responseBodyBytes);
          final int score = int.parse(responseBodyString.trim());
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
        final responseBodyBytes = response.bodyBytes;
        final responseBodyString = utf8.decode(responseBodyBytes);
        final List<dynamic> data = jsonDecode(responseBodyString);
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

  // 사용자 ID로 사용자 데이터를 가져오는 함수
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    const String baseUrl = 'http://34.64.233.128:5200/auth/users';
    final url = Uri.parse('$baseUrl/$userId/id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // JSON 데이터를 Map으로 변환
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        print('❌ 사용자 데이터를 가져오지 못했습니다. 상태 코드: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ 사용자 데이터를 가져오는 중 오류 발생: $e');
      return null;
    }
  }

  /// 그룹 업로드 메서드
  Future<void> uploadGroup(Map<String, dynamic> args, WidgetRef ref) async {
    final String groupName = args['name'] ?? '그룹 이름 없음';
    final String? imagePath = args['imagePath'] as String?;
    final File? imageFile = imagePath != null ? File(imagePath) : null;

    var uri = Uri.parse("http://34.64.233.128:5200/groups"); // 🔥 엔드포인트 설정
    final user = ref.watch(userProvider);
    final String category = args['category'] ?? "";

    final List<String> tags = [category];
    var request =
        http.MultipartRequest("POST", uri)
          ..fields['authorId'] = user!.id!
          ..fields['name'] = groupName
          ..fields['tags'] = jsonEncode(tags); // JSON 문자열 형태

    if (imageFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          "image",
          imageFile.path,
          filename: path.basename(imageFile.path),
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      user.joinedGroups = [
        ...user.joinedGroups,
        GroupModel(
          id: '00', // 수정 필요
          authorId: user.id!, // user.id가 null이 아님을 가정하고 '!'로 null safety 처리
          name: groupName,
          joinCode: '00', // 수정 필요
          tags: tags,
          imageUrl: imagePath,
          memberIds: [user.id!], // 그룹 생성자는 초기 멤버로 포함
          score: 0, // 초기 점수 설정 (적절한 값으로 변경 가능)
          level: 1, // 초기 레벨 설정 (적절한 값으로 변경 가능)
        ),
      ];

      try {
        var response = await request.send(); // 🚀 요청 전송
        print("요청전송");
        var responseBody = await response.stream.bytesToString(); // 응답 읽기
      } catch (e) {
        print("Error: $e");
      }
    }
  }
}
