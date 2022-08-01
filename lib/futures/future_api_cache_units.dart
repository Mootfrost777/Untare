import 'package:tare/exceptions/api_connection_exception.dart';
import 'package:tare/models/unit.dart';
import 'package:tare/services/api/api_unit.dart';
import 'package:tare/services/cache/cache_unit_service.dart';

Future getUnitsFromApiCache(String query) async {
  final CacheUnitService _cacheUnitService = CacheUnitService();
  final ApiUnit _apiUnit = ApiUnit();

  List<Unit>? cacheUnits = _cacheUnitService.getUnits(query, 1, 25);
print('dude');


  try {
    print('jsojdosdjsod');
    Future<List<Unit>> units = _apiUnit.getUnits(query, 1, 25);
    units.then((value) => _cacheUnitService.upsertUnits(value));
    return units;
  } catch (e) {
    if (cacheUnits != null) {
      return cacheUnits;
    }
  }
}