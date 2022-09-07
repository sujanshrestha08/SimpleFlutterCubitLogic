part of 'color_cubit.dart';

abstract class ColorState extends Equatable {
  final Color color;
  const ColorState(this.color);

  @override
  List<Object> get props => [color];
}

class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.blueGrey);
}

class ColorLoading extends ColorState {
  final Color newColor;
  const ColorLoading(this.newColor) : super(newColor);
}

class ColorFetch extends ColorState {
  const ColorFetch() : super(Colors.red);
}
