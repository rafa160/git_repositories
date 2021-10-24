

import 'package:git_repositories/models/git_owner_model.dart';

class RepositoryModel {

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  GitOwnerModel gitOwnerModel;
  String htmlUrl;
  String description;
  String url;
  int stargazersCount;
  String language;
  int forksCount;

  RepositoryModel({
      this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.gitOwnerModel,
      this.htmlUrl,
      this.description,
      this.url,
      this.stargazersCount,
      this.language,
      this.forksCount});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json["id"],
      nodeId: json["node_id"],
      name: json["name"],
      fullName: json["full_name"],
      private: json["private"],
      gitOwnerModel: GitOwnerModel.fromJson(json["owner"]),
      htmlUrl: json["html_url"],
      description: json["description"],
      url: json["url"],
      stargazersCount: json["stargazers_count"],
      language: json["language"],
      forksCount: json["forks_count"]
    );
  }

}