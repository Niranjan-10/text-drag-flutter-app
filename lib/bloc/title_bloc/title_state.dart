part of 'title_bloc.dart';

@immutable
abstract class TitleState {}

class TitleInitial extends TitleState {}

class TitlePushedState extends TitleState{
  final String? title;
  final double? textSize;

  TitlePushedState({this.title,this.textSize});
}