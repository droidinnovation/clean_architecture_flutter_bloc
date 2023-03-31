import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:test/test.dart';

void main() {
  group('Location', () {
    group('fromJson', () {
      test('return correct Location object', () {
        expect(
          Location.fromJson(<String, dynamic>{
            'id': 4887398,
            'name': 'Chicago',
            'latitude': 41.85003,
            'longitude': -87.65005,
          }),
          isA<Location>()
              .having((w) => w.id, 'id', 4887398)
              .having((p0) => p0.name, 'name', 'Chicago')
              .having((p0) => p0.latitude, 'lat', 41.85003)
              .having((p0) => p0.longitude, 'longitude', -87.65005),
        );
      });
    });
  });
}
