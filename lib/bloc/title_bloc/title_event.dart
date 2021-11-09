part of 'title_bloc.dart';

@immutable
abstract class TitleEvent {}

class TitlePushEvent extends TitleEvent{
  final String? title;

  TitlePushEvent({this.title});

}

class TitleFontSizeIncreaseEvent extends TitleEvent{
  final double? fontSize;
  TitleFontSizeIncreaseEvent({this.fontSize});
}