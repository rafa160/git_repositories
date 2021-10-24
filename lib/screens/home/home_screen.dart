import 'package:flutter/material.dart';
import 'package:git_repositories/blocs/repository_bloc.dart';
import 'package:git_repositories/components/loading_widget.dart';
import 'package:git_repositories/components/repository_card.dart';
import 'package:git_repositories/models/repository_model.dart';
import 'package:git_repositories/screens/home/home_module.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  int pageCount = 1;
  ScrollController _scrollController;

  var repositoryBloc = HomeModule.to.getBloc<RepositoryBloc>();

  @override
  void initState() {
    requestRepositoriesFromApi(1);
    _scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<RepositoryModel>>(
        stream: repositoryBloc.repositoryStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: LoadingWidget());
            default:
          }
          return GridView.count(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            physics: const AlwaysScrollableScrollPhysics(),
            children: snapshot.data.map((repository) {
              return RepositoryCard(repositoryModel: repository,);
            }).toList(),
          );
        },
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isLoading = true;

        if (isLoading) {
          pageCount = pageCount + 1;
          requestRepositoriesFromApi(pageCount);
          print("RUNNING LOAD MORE $pageCount");
        }
      });
    }
  }

  void requestRepositoriesFromApi(var pageCount) {
    repositoryBloc.getRepositories(pageCount);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
