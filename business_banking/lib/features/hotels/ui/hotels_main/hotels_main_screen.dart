import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HotelsMainScreen extends Screen {
  //
  HotelsListViewModel viewModel;
  final Function onHotelClicked;

  HotelsMainScreen({required this.viewModel, required this.onHotelClicked});

  _onEntryTapped(HotelViewModel viewModel) {
    onHotelClicked(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnList = [];

    List<HotelViewModel> hList = this.viewModel.hotels;
    if (hList != null && hList.length > 0) {
      ListView lView = ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: this.viewModel.hotels.length,
          itemBuilder: (context, index) {
            return _buildHotelEntry(hList[index]);
          });

      columnList.add(Expanded(child: lView));
    }

    // Main Container
    Container bodyContainer = Container(
      child: Column(children: columnList),
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
    );

    return Scaffold(
      body: bodyContainer,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Hotels',
              key: Key('ADappBarL4'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelEntry(HotelViewModel viewModel) {
    Color likedColor = viewModel.isLiked ? Colors.green : Colors.grey.shade300;

    ListTile lt = ListTile(
        onTap: () => {_onEntryTapped(viewModel)},
        leading: Icon(
          Icons.check,
          color: likedColor,
          size: 30,
        ),
        trailing: Image.network(viewModel.imageUrl),
        title: Text(viewModel.title + '\n' + _formatPrice(viewModel.price)),
        subtitle: Text(viewModel.starRating.toString() + ' Stars'));

    // Card
    Card card = Card(child: lt);

    return card;
  }

  String _formatPrice(double priceValue) {
    String newPrice = "\$" + priceValue.toStringAsFixed(2);
    return newPrice;
  }
}
