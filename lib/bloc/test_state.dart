import 'package:equatable/equatable.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GrocerySuccess extends GroceryState {
  final List grocery;
  final List cart;
  const GrocerySuccess({required this.grocery, required this.cart});
}

class GroceryFailed extends GroceryState {}
