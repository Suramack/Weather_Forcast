import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled');
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permission');
//   }
//   return await Geolocator.getCurrentPosition();
// }

Future<Position> getPosition() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

Future<Placemark> getPlaceMark(double latitude, double longitude) async {
  List<Placemark> placemark = await GeocodingPlatform.instance
      .placemarkFromCoordinates(latitude, longitude);
  return placemark[0];
}
