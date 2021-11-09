import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_project/bloc/title_bloc/title_bloc.dart';

class TitleView extends StatefulWidget {
  @override
  _TitleViewState createState() => _TitleViewState();
}

class _TitleViewState extends State<TitleView> {
  Offset offset = Offset(50.0,300.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (panDetails) {
            setState(() {
              offset = Offset(
                  offset.dx + panDetails.delta.dx, offset.dy + panDetails.delta.dy);
            });
          },
          child: BlocBuilder<TitleBloc, TitleState>(
            builder: (context, state) {
              if(state is TitlePushedState){
                return SizedBox(
                  width: 300,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(state.title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: state.textSize!,
                              color: Colors.white70)),
                    ),
                  ),
                );
              }

              return Container(
                height: 300,
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  onFieldSubmitted: (value){
                    context.read<TitleBloc>().add(TitlePushEvent(title: value));
                  },
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: const InputDecoration(
                      hintText: "Type something",
                      hintStyle: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold
                      ),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70
                          )
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70
                          )
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70
                          )
                      )

                  ),
                ),
              );
            },
          ),

        ),
      ),
    );
  }
}
