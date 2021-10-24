import 'package:git_repositories/services/config.dart';
import 'package:http/http.dart' as http;

class Api {

  Future get(int index) async {
    http.Response response;
    response = await http.get(Uri.parse(
        "${Config.apiUrl}?q=language:${Config.apiDefaultQuery}&sort=${Config.apiDefaultSubQuery}&page=$index"));
    return response;
  }
}