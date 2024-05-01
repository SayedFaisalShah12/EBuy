import 'package:get_storage/get_storage.dart';

class ELocalStorage{
  static final ELocalStorage _instance = ELocalStorage._internal();

  factory ELocalStorage (){
    return _instance;
  }

  ELocalStorage._internal();
  final _storage  = GetStorage();

  //Generic method to save the data
  Future saveData<T>(String key, T value) async{
    await  _storage.write(key, value);
  }

  //Generic method to read the data
  T? readData<T>(String key){
    return _storage.read(key);
  }

  //Generic method to remove data
  Future removeData<T>(String key) async{
    await _storage.remove(key);
  }

  //clear all the storage
  Future<void> clearAll() async{
    await _storage.erase();
  }
}