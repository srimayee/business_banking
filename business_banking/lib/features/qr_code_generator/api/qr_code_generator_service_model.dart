import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class QRCodeGeneratorServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String seed;
  final String expiresAt;

  QRCodeGeneratorServiceResponseModel.fromJson(Map<String, dynamic> json)
      : seed = json['seed']?.toString() ?? '',
        expiresAt = json['expiresAt']?.toString() ?? '';

  @override
  List<Object> get props => [seed, expiresAt];
}
