import 'package:asbeza/model/grocery.dart';

import 'db_helper.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveAsbeza(Grocery grocery) async {
    return await _repository!.insertData('grocery', grocery.toJson());
  }

  readGrocery() async {
    return await _repository!.readData('grocery');
  }

  updateGrocery(Grocery grocery) async {
    return await _repository!.updateData('grocery', grocery.toJson());
  }

  deleteGrocery(dispatchId) async {
    return await _repository!.deleteData('grocery', dispatchId);
  }

  wipeDate() async {
    await _repository!.deleteAllData('grocery');
  }
}
