class PlaceModel {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String? placeId;

  PlaceModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.placeId,
  });

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceModel &&
          runtimeType == other.runtimeType &&
          placeId == other.placeId &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => placeId.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}
