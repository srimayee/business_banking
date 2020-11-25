import 'package:clean_framework/clean_framework.dart';

class QuickPayEntity extends Entity {
  final String name;
  final String email;
  final String imageUrl;

  QuickPayEntity(
  {List<EntityFailure> errors = const [],
    String name,
    String email,
    String imageUrl})
    : name = name ?? 'user name',
      email = email ??  'username@gmail.com',
      imageUrl = imageUrl ?? '',
      super(errors: errors);

  @override
  List<Object> get props => [
    errors, name, email, imageUrl];

  @override
  merge({errors, String name, String email, String imageUrl}) {
    return QuickPayEntity(
      errors: errors ?? this.errors,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl
    );
  }
}