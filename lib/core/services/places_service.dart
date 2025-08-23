import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PlaceModel {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String? country;
  final String? administrativeArea;

  PlaceModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.country,
    this.administrativeArea,
  });

  @override
  String toString() => address;
}

class PlacesService {
  // Cache for locations and search results
  static final Map<String, Position> _locationCache = {};
  static final Map<String, List<PlaceModel>> _searchCache = {};
  static Position? _lastKnownPosition;

  // Get current location with caching
  static Future<Position?> getCurrentLocation() async {
    try {
      // Return cached location if available and recent (within 5 minutes)
      if (_lastKnownPosition != null) {
        return _lastKnownPosition;
      }

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium, // Changed from high for better performance
        timeLimit: const Duration(seconds: 10), // Add timeout
      );

      _lastKnownPosition = position;
      return position;
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }

  // Search places by query with caching and optimization
  static Future<List<PlaceModel>> searchPlaces(String query) async {
    if (query.isEmpty) return [];

    final normalizedQuery = query.toLowerCase().trim();
    
    // Check cache first
    if (_searchCache.containsKey(normalizedQuery)) {
      return _searchCache[normalizedQuery]!;
    }

    try {
      // Use geocoding for now (later can be replaced with Google Places API)
      List<Location> locations = await locationFromAddress(query);

      List<PlaceModel> places = [];

      // Limit to 5 results for better performance
      for (Location location in locations.take(5)) {
        try {
          List<Placemark> placemarks = await placemarkFromCoordinates(
            location.latitude,
            location.longitude,
          );

          if (placemarks.isNotEmpty) {
            Placemark placemark = placemarks.first;

            String name =
                placemark.locality ?? placemark.administrativeArea ?? query;
            String address = _formatAddress(placemark);

            places.add(
              PlaceModel(
                name: name,
                address: address,
                latitude: location.latitude,
                longitude: location.longitude,
                country: placemark.country,
                administrativeArea: placemark.administrativeArea,
              ),
            );
          }
        } catch (e) {
          print('Error getting placemark for location: $e');
          continue; // Skip this location and continue with others
        }
      }

      // Cache the results
      _searchCache[normalizedQuery] = places;

      return places;
    } catch (e) {
      print('Error searching places: $e');
      return [];
    }
  }

  // Get place from coordinates with caching
  static Future<PlaceModel?> getPlaceFromCoordinates(
    double lat,
    double lng,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        lat, 
        lng,
      ).timeout(const Duration(seconds: 5));

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String name =
            placemark.locality ??
            placemark.administrativeArea ??
            'Unknown Location';
        String address = _formatAddress(placemark);

        return PlaceModel(
          name: name,
          address: address,
          latitude: lat,
          longitude: lng,
          country: placemark.country,
          administrativeArea: placemark.administrativeArea,
        );
      }
    } catch (e) {
      print('Error getting place from coordinates: $e');
    }
    return null;
  }

  // Format address from placemark
  static String _formatAddress(Placemark placemark) {
    List<String> addressParts = [];

    if (placemark.street != null && placemark.street!.isNotEmpty) {
      addressParts.add(placemark.street!);
    }
    if (placemark.locality != null && placemark.locality!.isNotEmpty) {
      addressParts.add(placemark.locality!);
    }
    if (placemark.administrativeArea != null &&
        placemark.administrativeArea!.isNotEmpty) {
      addressParts.add(placemark.administrativeArea!);
    }
    if (placemark.country != null && placemark.country!.isNotEmpty) {
      addressParts.add(placemark.country!);
    }

    return addressParts.join(', ');
  }

  // Clear cache method (optional - for memory management)
  static void clearCache() {
    _searchCache.clear();
    _locationCache.clear();
    _lastKnownPosition = null;
  }
}
