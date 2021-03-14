import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/test.dart';
import 'package:the_process/utils/immutable_collections/immutable_list.dart';

part 'immutable_list_test.g.dart';
part 'immutable_list_test.freezed.dart';

void main() {
  group('ImmutableList', () {
    test('serializes with freezed', () {
      var userProfile = UserProfile.fromJson(userProfileJson);
      var userProfileToJson = userProfile.toJson();
      expect(
          jsonEncode(userProfileJson) == jsonEncode(userProfileToJson), true);
    });
  });
}

@freezed
class MovieInfo with _$MovieInfo {
  const factory MovieInfo(
      String name,
      double rating,
      ImmutableList<String> stars,
      ImmutableList<String?> nullableStars) = _MovieInfo;
  factory MovieInfo.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoFromJson(json);
}

@freezed
class Movie with _$Movie {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Movie(
      String name,
      double rating,
      ImmutableList<String> stars,
      ImmutableList<String?> nullableStars,
      ImmutableList<MovieInfo>? relatedMovies,
      ImmutableList<MovieInfo?>? relatedNullableMovies) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  @JsonSerializable(explicitToJson: true)
  const factory UserProfile(
    String name,
    int age,
    ImmutableList<int> luckyNumbers,
    ImmutableList<String> favoritesMovieStars,
    ImmutableList<String?> favoritesNullableMovieStars,
    ImmutableList<Movie> favoritesMovies,
    ImmutableList<Movie?> favoritesNullableMovies,
  ) = _UserProfile;
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

const userProfileJson = {
  'name': 'Jack',
  'age': 25,
  'luckyNumbers': [2, 4, 6, 8],
  'favoritesMovieStars': ['Robert De Niro', 'Jack Nicholson', 'Marlon Brando'],
  'favoritesNullableMovieStars': ['Robert De Niro', null, 'Marlon Brando'],
  'favoritesMovies': [
    {
      'name': 'The Shawshank Redemption',
      'rating': 9.2,
      'stars': ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      'nullableStars': ['Tim Robbins', null, 'Morgan Freeman', 'Bob Gunton'],
      //'relatedMovies': null,
      //'relatedNullableMovies': null,
    },
    {
      'name': 'The Dark Knight Rises',
      'rating': 8.1,
      'stars': ['Sean Schemmel', 'Jason Griffith', 'Gregory Abbey'],
      'nullableStars': [
        'Sean Schemmel',
        'Jason Griffith',
        null,
        'Gregory Abbey'
      ],
      'relatedMovies': [
        {
          'name': 'The Shawshank Redemption',
          'rating': 9.2,
          'stars': ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
          'nullableStars': [
            'Tim Robbins',
            null,
            'Morgan Freeman',
            'Bob Gunton'
          ],
        },
        {
          'name': 'The Godfather',
          'rating': 9.1,
          'stars': ['Marlon Brando', 'Al Pacino', 'James Caan'],
          'nullableStars': ['Marlon Brando', 'Al Pacino', null, 'James Caan']
        }
      ],
      'relatedNullableMovies': <Map<String, dynamic>?>[
        null,
        <String, dynamic>{
          'name': 'The Shawshank Redemption',
          'rating': 9.2,
          'stars': ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
          'nullableStars': [
            'Tim Robbins',
            null,
            'Morgan Freeman',
            'Bob Gunton'
          ],
        },
      ],
    },
    {
      'name': 'The Godfather',
      'rating': 9.1,
      'stars': ['Marlon Brando', 'Al Pacino', 'James Caan'],
      'nullableStars': ['Marlon Brando', 'Al Pacino', null, 'James Caan']
    }
  ],
  'favoritesNullableMovies': [
    {
      'name': 'The Shawshank Redemption',
      'rating': 9.2,
      'stars': ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      'nullableStars': ['Tim Robbins', null, 'Morgan Freeman', 'Bob Gunton'],
    },
    null,
    {
      'name': 'The Dark Knight Rises',
      'rating': 8.1,
      'stars': ['Sean Schemmel', 'Jason Griffith', 'Gregory Abbey'],
      'nullableStars': [
        'Sean Schemmel',
        'Jason Griffith',
        null,
        'Gregory Abbey'
      ],
      'relatedMovies': <Map<String, dynamic>>[],
      'relatedNullableMovies': <Map<String, dynamic>?>[],
    },
    {
      'name': 'The Godfather',
      'rating': 9.1,
      'stars': ['Marlon Brando', 'Al Pacino', 'James Caan'],
      'nullableStars': ['Marlon Brando', 'Al Pacino', null, 'James Caan']
    }
  ]
};
