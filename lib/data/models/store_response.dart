import 'package:storelist/data/models/store_model.dart';

class StoreResponse {
  final List<StoreModel> storeList;

  const StoreResponse(this.storeList);

  factory StoreResponse.fromJson(Map<String, dynamic> json) => StoreResponse(
        List<StoreModel>.from(
          (json['stores'] as List).map((e) => StoreModel.fromMap(e)),
        ),
      );
}
