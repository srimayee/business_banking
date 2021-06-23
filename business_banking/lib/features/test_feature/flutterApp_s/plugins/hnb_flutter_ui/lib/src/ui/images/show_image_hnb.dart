import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Customize this calss to load a png, svg or any other image types.
//All Image assets must be placed in the hnb_flutter_ui package
//Image assets that are used in  hnb_flutter_ui package must be defined in the pubspec.yml of this package
//Images assets hnb_flutter_ui package used in other package, the other package's pubspec.yml file should define the asset like below
//assets:
//    - packages/hnb_flutter_ui/assets/images/pattern--energetic-alt.svg

class ShowImageHNB extends StatelessWidget {
  final String asset;
  final String? package;
  final Alignment alignment;
  final Color? color;
  final BoxFit fit;
  final double? height;
  final double? width;
  final WidgetBuilder? placeHolderBuilder;
  final String? semanticsLabel;
  final double maxWidth;
  final double maxHeight;
  final Key? assetKey;

  const ShowImageHNB(
    this.asset, {
    Key? key,
    this.package,
    this.alignment = Alignment.center,
    this.color,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.placeHolderBuilder,
    this.semanticsLabel,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
    this.assetKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget childImageWidget;
    if (asset.endsWith(".svg")) {
      childImageWidget = SvgPicture.asset(
        asset,
        key: assetKey,
        semanticsLabel: semanticsLabel,
        package: package,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        width: width,
      );
    } else {
      childImageWidget = Image.asset(
        asset,
        key: assetKey,
        semanticLabel: semanticsLabel,
        package: package,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        width: width,
      );
    }
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: childImageWidget,
    );
  }
}
