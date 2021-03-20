import 'package:clean_framework/clean_framework.dart';

class QRCodeGeneratorEntity extends Entity {
  final String seed;
  final String expiresAt;

  QRCodeGeneratorEntity(
      {List<EntityFailure> errors = const [], String seed, String expiresAt})
      : seed = seed ?? '',
        expiresAt = expiresAt ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [errors, seed, expiresAt];

  @override
  merge({errors, String seed, String expiresAt, String imageUrl}) {
    return QRCodeGeneratorEntity(
      errors: errors ?? this.errors,
      seed: seed ?? this.seed,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
