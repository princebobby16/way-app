import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'friends.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Friend {
  Friend({
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.location,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);

  final int user_id;
  final String first_name;
  final String last_name;
  final String phone_number;
  final List<double> location;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.friends,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Friend> friends;
}

Future<Locations> getFriends() async {

  // NB: use ngrok
  const googleLocationsURL = 'https://2715624b27da.ngrok.io/users/friends?user_id=123456';

  // Retrieve the locations of Google offices
  final response = await http.get(
      Uri.parse(googleLocationsURL)
  );
  if (response.statusCode == 200) {
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}