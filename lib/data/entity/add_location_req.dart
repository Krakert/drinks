import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';

class AddLocationReq {
  GeoFirePoint location;
  String name;
  List<int> drinks;

  AddLocationReq({required this.location, required this.name, required this.drinks});
}
