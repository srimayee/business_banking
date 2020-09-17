import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class PromosServiceResponseModel extends Equatable implements JsonResponseModel {
  final String imageUrl;
  final String externalUrl;

  PromosServiceResponseModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'],
        externalUrl = json['externalUrl'];

  @override
  List<Object> get props => [imageUrl, externalUrl];
}
