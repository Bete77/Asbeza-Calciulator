import 'package:asbeza/bloc/test_event.dart';
import 'package:asbeza/bloc/test_state.dart';
import 'package:asbeza/model/api.dart';
import 'package:asbeza/model/grocery.dart';
import 'package:asbeza/model/repository.dart';

import 'package:bloc/bloc.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List cart = [];
  List cartLoad = [];
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryFetchEvent>((event, emit) async {
      emit(GroceryLoading());
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        await _service.readGrocery().then((val) => {
              cart = val,
              print(val),
            });
        cartLoad = Grocery.cartList(cart);
        // print(cartLoad);
        emit(GrocerySuccess(grocery: activity!, cart: cartLoad));
      } catch (e) {
        emit(GroceryFailed());
      }
    });
    on<CartEvent>((event, emit) => {
          if (!cartLoad.contains(event.data))
            {
              // _service.wipeDate(),
              cartLoad.add(event.data),
              event.data.itemStatus = 1,
              _service.saveAsbeza(event.data),
            }
        });

    on<AddAmountEvent>((event, emit) => {
          cartLoad[event.data].groceryQuantity++,
          _service.updateGrocery(
            cartLoad[event.data],
          )
        });
    on<SubAmountEvent>((event, emit) => {
          if (cartLoad[event.data].groceryQuantity <= 1)
            {
              cartLoad[event.data].itemStatus = 0,
              _service.deleteGrocery(cartLoad[event.data].id),
              cartLoad.removeAt(event.data),
            }
          else
            {
              cartLoad[event.data].groceryQuantity--,
              _service.updateGrocery(
                cartLoad[event.data],
              )
            },
        });
  }
}
