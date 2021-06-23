import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class FooterFdicContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: Flexible(
        flex: 3,
        child: Row(
          children: [
            Expanded(
                child: Text.rich(
              TextSpan(children: <InlineSpan>[
                TextSpan(
                    text: 'content1',
                    style: TextStyleHNB(context,
                            type: TextStyleType.accentFootNote)
                        .style),
                const WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: ShowImageHNB(
                        "packages/hnb_flutter_ui/assets/images/hnb_small_logo.svg",
                        key: Key('hnb-small-logo'),
                        semanticsLabel: 'huntington logo icon',
                        color: primary,
                        height: 7,
                        width: 7,
                      )),
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                TextSpan(
                    text: 'content2',
                    style: TextStyleHNB(context,
                            type: TextStyleType.accentFootNote)
                        .style),
                WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: LinkBigHNB(
                      text: 'Privacy Link',
                      onTap: () {},
                      style: TextStyleHNB(context,
                              type: TextStyleType.accentFootNoteUnderline)
                          .style,
                    ),
                  ),
                )
              ]),
              key: const Key('rich-text-footer'),
            )),
          ],
        ),
      ),
    );
  }
}
