import 'package:asbeza/bloc/test_event.dart';
import 'package:asbeza/bloc/test_state.dart';
import 'package:asbeza/model/service.dart';

import 'package:bloc/bloc.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final _apiServiceProvider = ApiServiceProvider();
  List cart = [];
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryFetchEvent>((event, emit) async {
      emit(GroceryLoading());
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        emit(GrocerySuccess(grocery: activity!, cart: cart));
      } catch (e) {
        emit(GroceryInitial());
      }
    });
    on<CartEvent>((event, emit) => {cart.add(event.data)});
  }
}
