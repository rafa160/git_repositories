import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:git_repositories/components/custom_animated_widget.dart';
import 'package:git_repositories/components/custom_cached_image.dart';
import 'package:git_repositories/components/custom_icon_text.dart';
import 'package:git_repositories/models/repository_model.dart';
import 'package:git_repositories/style/style.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel repositoryModel;

  const RepositoryCard({Key key, this.repositoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: CustomCachedImage(
                      repositoryModel.gitOwnerModel.avatarUrl),
                ),
              ),
              CustomAnimatedWidget(
                milliseconds: 900,
                horizontalOffset: -80,
                position: 1,
                widget: Center(
                    child: Text(
                  repositoryModel.gitOwnerModel.login,
                  style: name,
                )),
              ),
              SizedBox(
                height: 15,
              ),
              CustomIconText(
                icon: FontAwesomeIcons.book,
                text: repositoryModel.name,
                color: Colors.black54,
                position: 2,
              ),
              CustomIconText(
                icon: FontAwesomeIcons.codeBranch,
                text: "${repositoryModel.forksCount}",
                color: Colors.black,
                position: 3,
              ),
              CustomIconText(
                icon: FontAwesomeIcons.solidStar,
                text: "${repositoryModel.stargazersCount}",
                color: Colors.yellow,
                position: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
