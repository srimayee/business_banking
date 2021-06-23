import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:mbusinessonline/shared_components/contact_us_with_icon.dart';
import 'package:mbusinessonline/shared_components/footer_fdic_content_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 70),
          child: Container(
            color: foreground,
            child: Row(
              mainAxisAlignment:
                  ResponsiveWrapper.of(context).isLargerThan(MOBILE)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
              children: <Widget>[
                ContactUsWithIcon(),
                if (ResponsiveWrapper.of(context).isLargerThan(MOBILE))
                  const HorizontalSpacerHNB(),
                FooterFdicContentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
