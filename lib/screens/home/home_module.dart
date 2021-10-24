import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:git_repositories/blocs/repository_bloc.dart';
import 'package:git_repositories/screens/home/home_screen.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => RepositoryBloc()),
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomeScreen();

  static Inject get to => Inject<HomeModule>.of();
}