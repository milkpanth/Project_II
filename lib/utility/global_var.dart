import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/models/user_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

UserModel userData;
List<ProductModel> productList = [];
ProductModel productSelected;
int sizeSelected;
double totalPrice = 0;
LatLng markLocation;
