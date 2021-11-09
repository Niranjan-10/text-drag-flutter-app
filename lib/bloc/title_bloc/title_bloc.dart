import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'title_event.dart';
part 'title_state.dart';

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  TitleBloc() : super(TitleInitial()) {
    on<TitlePushEvent>((event, emit) {
      emit(TitlePushedState(title: event.title,textSize: 25.0));
    });

    on<TitleFontSizeIncreaseEvent>((event,emit){
      var copyState = state as TitlePushedState;
      // copystate.textSize = event.fontSize;
      emit(TitlePushedState(textSize: event.fontSize,title: copyState.title));
    });
  }
}
