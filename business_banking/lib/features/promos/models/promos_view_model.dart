import 'package:clean_framework/clean_framework.dart';

class PromosViewModel extends ViewModel {
  final String imageUrl;
  final String link;

  PromosViewModel({
    this.imageUrl,
    this.link,
  }) : assert(
          imageUrl != null && link != null,
        );

  @override
  String toString() => 'PromosViewModel(imageUrl: $imageUrl, link: $link)';
}
