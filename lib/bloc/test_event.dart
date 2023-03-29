import 'package:asbeza/model/grocery.dart';
import 'package:equatable/equatable.dart';

abstract class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class GroceryFetchEvent extends GroceryEvent {
  const GroceryFetchEvent();

  @override
  List<Object> get props => [];
}

class CartEvent extends GroceryEvent {
  final Grocery grocery;
  const CartEvent({required this.grocery});

  @override
  List<Object> get props => [];

  get data => grocery;
}

class AddAmountEvent extends GroceryEvent {
  final int index;
  AddAmountEvent(
    this.index,
  );

  @override
  List<Object> get props => [];

  get data => index;
}

class SubAmountEvent extends GroceryEvent {
  final int index;
  SubAmountEvent(
    this.index,
  );

  @override
  List<Object> get props => [];

  get data => index;
}
