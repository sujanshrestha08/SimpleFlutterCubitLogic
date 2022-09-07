import 'package:firstcubitbloc/cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider.value(
        value: ColorCubit(),
        child: Scaffold(body: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            if (state is ColorLoading || state is ColorInitial) {
              return Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: state.color,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<ColorCubit>().changeColor();
                    },
                    child: const Icon(Icons.add_a_photo_outlined),
                  ),
                ],
              );
            } else {
              return Center(
                child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 1000),
                    tween: Tween(
                      begin: 0.0,
                      end: 1.0,
                    ),
                    builder: (context, valueLoader, _) =>
                        CircularProgressIndicator(
                          color: Colors.red,
                          backgroundColor: Colors.grey.shade100,
                          semanticsLabel: 'Loading',
                          strokeWidth: 10,
                          // value: 0.9,
                        )),
              );
            }
          },
        )),
      ),
    );
  }
}
