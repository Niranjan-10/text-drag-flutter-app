import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_project/bloc/border_color_bloc/border_color_bloc.dart';
import 'package:image_project/bloc/title_bloc/title_bloc.dart';
import 'package:image_project/bloc/title_view.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _value = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            BlocBuilder<BorderColorBloc,BorderColorState>(
              builder: (context,state){
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: state.color!,width: 10.0),
                      image: const DecorationImage(
                          image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
                );
              },
            ),
            BlocBuilder<TitleBloc,TitleState>(
              builder: (context,state){
                // print(state);
                if (state is TitlePushedState){
                  return Positioned(
                    top: 50.0,
                    left: 50.0,
                    right: 50.0,
                    child: Container(
                        // color: Colors.redAccent,
                        height: 50,
                        width: 300.0,
                        child: Slider(onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });

                          context.read<TitleBloc>().add(TitleFontSizeIncreaseEvent(fontSize: value));


                        }, value: _value,
                          min: 25,
                          max: 70,

                        ),
                      ),
                  );
                }
                return const SizedBox();
              },
            ),
            TitleView(),
            BlocBuilder<TitleBloc,TitleState>(
              builder: (context,state){
                // print(state);
                if (state is TitlePushedState){
                  return Positioned(
                    top: 700.0,
                    left: 50,
                    right: 50.0,
                    child: Container(
                      height: 50,
                      width: 300.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
                              context.read<BorderColorBloc>().add(BorderColorChangeEvent(color: Colors.white));
                            },
                            child: Container(
                              height:25.0,
                              width: 25.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.read<BorderColorBloc>().add(BorderColorChangeEvent(color: Colors.green));
                            },
                            child: Container(
                              height:25.0,
                              width: 25.0,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.read<BorderColorBloc>().add(BorderColorChangeEvent(color: Colors.blue));
                            },
                            child: Container(
                              height:25.0,
                              width: 25.0,
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.read<BorderColorBloc>().add(BorderColorChangeEvent(color: Colors.pink));
                            },
                            child: Container(
                              height:25.0,
                              width: 25.0,
                              decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  );
                }
                return const SizedBox();
              },
            ),

          ],
        ),
      ),
    );
  }
  
}

