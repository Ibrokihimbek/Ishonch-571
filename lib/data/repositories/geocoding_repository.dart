import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/service/api_service/api_service.dart';

class GeocodingRepo {
  GeocodingRepo({required this.apiService});

  final ApiService apiService;

  Future<String> getAddress(LatLongModel latLongModel, String kind) =>
      apiService.getLocationName(
          geoCodeText: "${latLongModel.long},${latLongModel.lat}", kind: kind);
}
