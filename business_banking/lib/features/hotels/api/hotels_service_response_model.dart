import 'package:clean_framework/clean_framework_defaults.dart';

class HotelsServiceResponseModel extends JsonResponseModel {
  final String title;
  final String city;
  final String stateCode;
  final bool isLiked;
  final double starRating;
  final double price;
  final String imageUrl;

  HotelsServiceResponseModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? 'Luxor',
        city = json['city'] ?? 'Las Vegas',
        stateCode = json['state_code'] ?? 'NV',
        isLiked = (json['is_liked'] == "true") ? true : false,
        starRating = json['star_rating'] ?? 2.5,
        price = json['price'] ?? 52.00,
        imageUrl = json['image_url'] ??
            "https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg";

  @override
  List<Object> get props =>
      [title, city, stateCode, isLiked, starRating, price, imageUrl];
}
