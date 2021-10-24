import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:get/get.dart';
import 'package:git_repositories/models/repository_model.dart';
import 'package:git_repositories/services/api.dart';
import 'package:http/http.dart' as http;

class RepositoryBloc extends BlocBase {
  List<RepositoryModel> repositories = [];

  final _repositories$ = StreamController<List<RepositoryModel>>();
  Stream<List<RepositoryModel>> get repositoryStream => _repositories$.stream;

  Future getRepositories(int index) async {
    var result = await Api().get(index);
    _customDecode(result);
  }

  _customDecode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      var items = decoded["items"].map<RepositoryModel>((map) {
        var repository = RepositoryModel.fromJson(map);
        return repository;
      }).toList();

      repositories += items.where((element) => element != null).toList();
      _repositories$.sink.add(repositories);
    } else {
      Get.snackbar("Error", "Failed to load the repositories ");
    }
  }

  @override
  void dispose() {
    _repositories$.close();
    super.dispose();
  }

}