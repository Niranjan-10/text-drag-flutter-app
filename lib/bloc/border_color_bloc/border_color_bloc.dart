import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'border_color_event.dart';
part 'border_color_state.dart';

class BorderColorBloc extends Bloc<BorderColorEvent, BorderColorState> {
  BorderColorBloc() : super(BorderColorState(color: Colors.white)) {
    on<BorderColorChangeEvent>((event, emit) {
      emit(BorderColorState(color: event.color));
    });
  }
}
