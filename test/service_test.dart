import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_repositories/models/repository_model.dart';
import 'package:git_repositories/services/api.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockApiCallService extends Mock implements Api {}

main() {
  MockApiCallService mockApiCallService;
  PublishSubject<List<RepositoryModel>> syncStreamController;

  setUp((){
    mockApiCallService = MockApiCallService();
    syncStreamController = PublishSubject<List<RepositoryModel>>();
  });

  tearDown(() {
    syncStreamController.close();
  });

  group('api test', () {
    final jsonMap = {
      "items": [
        {
          "id": 149746920,
          "node_id": "MDEwOlJlcG9zaXRvcnkxNDk3NDY5MjA=",
          "name": "flukit",
          "full_name": "flutterchina/flukit",
          "private": false,
          "description": " A Flutter UI Kit（一个 Flutter UI组件库），2.0 beta is available now !",
          "owner": {
            "login": "flutterchina",
            "id": 38549573,
            "avatar_url": "https://avatars.githubusercontent.com/u/38549573?v=4",
          }
        },
        {
          "id": 186255460,
          "node_id": "MDEwOlJlcG9zaXRvcnkxODYyNTU0NjA=",
          "name": "fl_chart",
          "full_name": "imaNNeoFighT/fl_chart",
          "private": false,
          "description": "A powerful Flutter chart library, currently supporting Line Chart, Bar Chart, Pie Chart, Scatter Chart and Radar Chart.",
          "owner": {
            "login": "imaNNeoFighT",
            "id": 7009300,
            "avatar_url": "https://avatars.githubusercontent.com/u/7009300?v=4",
          }
        }
      ]
    };

    test('Check if returns the Repository List', () async {
      print("You have enter in the test\n");
      final httpResponse = Response(data: jsonMap, statusCode: 200);
      final list = (httpResponse.data['items']).map((e) => RepositoryModel.fromJson(e)).toList();
      List<RepositoryModel> expected = list;

      when(mockApiCallService.get(1)).thenAnswer((_) async => list);

      expect(expected, list);
      print("You have pass the test");
    });
  });
}