part of 'border_color_bloc.dart';

@immutable
abstract class BorderColorEvent {}


class BorderColorChangeEvent extends BorderColorEvent{
  final Color? color;
  BorderColorChangeEvent({this.color});
}