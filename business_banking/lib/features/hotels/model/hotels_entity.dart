import 'package:clean_framework/clean_framework.dart';

class HotelsEntity extends Entity {
  final String title;
  final String city;
  final String stateCode;
  final bool isLiked;
  final double starRating;
  final double price;
  final String imageUrl;

  HotelsEntity(
      {List<EntityFailure> errors = const [],
      String? title,
      String? city,
      String? stateCode,
      bool? isLiked,
      double? starRating,
      double? price,
      String? imageUrl})
      : title = title ?? 'Luxor',
        city = city ?? 'Las Vegas',
        stateCode = stateCode ?? "NV",
        isLiked = isLiked ?? false,
        starRating = starRating ?? 2.5,
        price = price ?? 52.00,
        imageUrl = imageUrl ??
            "https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg",
        super(errors: errors);

  @override
  List<Object> get props =>
      [title, city, stateCode, isLiked, starRating, price, imageUrl];

  @override
  HotelsEntity merge(
      {errors,
      String? title,
      String? city,
      String? stateCode,
      bool? isLiked,
      double? starRating,
      double? price,
      String? imageUrl}) {
    return HotelsEntity(
        errors: errors ?? this.errors,
        title: title ?? this.title,
        city: city ?? this.city,
        stateCode: stateCode ?? this.stateCode,
        isLiked: isLiked ?? this.isLiked,
        starRating: starRating ?? this.starRating,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl);
  }
}
