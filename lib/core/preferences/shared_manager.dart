import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../base/base_model.dart';

class SharedManager {
  SharedPreferences? preference;
  static SharedManager? _instate;
  SharedManager._init();

  static SharedManager get inistance {
    if (_instate == null) {
      _instate = SharedManager._init();
    }
    return _instate!;
  }

  Future init() async {
    preference = await SharedPreferences.getInstance();
  }

  Future<bool> saveStringValue(SharedKeys key, String value) async =>
      await preference!.setString(key.toString(), value);

  String? getStringValue(SharedKeys key) =>
      preference!.getString(key.toString());

  Future<bool> saveJsonModel<T extends BaseModel>(SharedKeys key, T model) async =>
      await preference!.setString(key.toString(), jsonEncode(model));

  dynamic getJsonModel<T extends BaseModel>(SharedKeys key, T model)  {
    var jsonString = preference!.getString(key.toString());
    var jsonModel = jsonDecode(jsonString!);
    if (jsonModel is Map) {
      return model.fromJson(jsonModel.cast());
    } else if (jsonModel is List) {
      return jsonModel.map((e) => model.fromJson(e)).toList();
    } else {
      return jsonModel;
    }
  }
}

enum SharedKeys { elgiz, postData }
