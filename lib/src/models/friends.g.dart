// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return Friend(
    user_id: json['user_id'] as int,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    phone_number: json['phone_number'] as String,
    location: (json['location'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
  );
}

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'location': instance.location,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    friends: (json['friends'] as List<dynamic>)
        .map((e) => Friend.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'friends': instance.friends,
    };
