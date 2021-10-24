class GitOwnerModel {

  int id;
  String login;
  String avatarUrl;

  GitOwnerModel({this.id, this.login, this.avatarUrl});

  factory GitOwnerModel.fromJson(Map<String, dynamic> json) {
    return GitOwnerModel(
      id: json["id"],
      login: json["login"],
      avatarUrl: json["avatar_url"]
    );
  }
}