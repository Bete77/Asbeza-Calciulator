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
        emit(GroceryFailed());
      }
    });
    on<CartEvent>((event, emit) => {
          if (!cart.contains(event.data))
            {
              cart.add(event.data),
              event.data.itemStatus = true,
            }
          else
            {}
        });

    on<AddAmountEvent>((event, emit) => {cart[event.data].groceryQuantity++});

    on<SubAmountEvent>((event, emit) => {
          if (cart[event.data].groceryQuantity <= 1)
            {
              cart[event.data].itemStatus = false,
              cart.removeAt(event.data),
            }
          else
            {
              cart[event.data].groceryQuantity--,
            }
        });
  }
}
