import 'package:storelist/domain/entities/store.dart';

class StoreModel {
  final String address;
  final String areaId;
  final String areaName;
  final String latitude;
  final String longitude;
  final String regionId;
  final String regionName;
  final String storeCode;
  final String storeId;
  final String storeName;

  // final String address;
  // final int areaId;
  // final String areaName;
  // final String latitude;
  // final String longitude;
  // final int regionId;
  // final String regionName;
  // final String storeCode;
  // final int storeId;
  // final String storeName;

  const StoreModel({
    required this.address,
    required this.areaId,
    required this.areaName,
    required this.latitude,
    required this.longitude,
    required this.regionId,
    required this.regionName,
    required this.storeCode,
    required this.storeId,
    required this.storeName,
  });

  factory StoreModel.fromEntity(Store store) {
    return StoreModel(
      address: store.address,
      areaId: store.areaId,
      areaName: store.areaName,
      latitude: store.latitude,
      longitude: store.longitude,
      regionId: store.regionId,
      regionName: store.regionName,
      storeCode: store.storeCode,
      storeId: store.storeId,
      storeName: store.storeName,
    );
  }

  factory StoreModel.fromMap(Map<String, dynamic> data) => StoreModel(
        address: data['address'],
        areaId: data['area_id'],
        areaName: data['area_name'],
        latitude: data['latitude'],
        longitude: data['longitude'],
        regionId: data['region_id'],
        regionName: data['region_name'],
        storeCode: data['store_code'],
        storeId: data['store_id'],
        storeName: data['store_name'],

        // address: data['address'],
        // areaId: int.parse(data['area_id']),
        // areaName: data['area_name'],
        // latitude: double.parse(data['latitude']),
        // longitude: double.parse(data['longitude']),
        // regionId: int.parse(data['region_id']),
        // regionName: data['region_name'],
        // storeCode: data['store_code'],
        // storeId: int.parse(data['store_id']),
        // storeName: data['store_name'],
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'area_id': areaId,
        'area_name': areaName,
        'latitude': latitude,
        'longitude': longitude,
        'region_id': regionId,
        'region_name': regionName,
        'store_code': storeCode,
        'store_id': storeId,
        'store_name': storeName,

        // 'address': address,
        // 'area_id': areaId,
        // 'area_name': areaName,
        // 'latitude': latitude,
        // 'longitude': longitude,
        // 'region_id': regionId,
        // 'region_name': regionName,
        // 'store_code': storeCode,
        // 'store_id': storeId,
        // 'store_name': storeName,
      };
  Store toEntity() {
    return Store(
      address: address,
      areaId: areaId,
      areaName: areaName,
      latitude: latitude,
      longitude: longitude,
      regionId: regionId,
      regionName: regionName,
      storeCode: storeCode,
      storeId: storeId,
      storeName: storeName,
    );
  }
}
