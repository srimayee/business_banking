import 'package:clean_framework/clean_framework.dart';

class PromosEntity extends Entity {
  final String imageUrl;
  final String link;

  PromosEntity({
    List<EntityFailure> errors = const [],
    this.imageUrl = '',
    this.link = '',
  }) : super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        imageUrl,
        link,
      ];

  @override
  merge({errors, String? imageUrl, String? link}) {
    return PromosEntity(
      errors: errors ?? this.errors,
      imageUrl: imageUrl ?? this.imageUrl,
      link: link ?? this.link,
    );
  }

  @override
  String toString() => """PromosEntity(
        imageUrl: $imageUrl,
        link: $link,
        errors: $errors
      )""";
}
