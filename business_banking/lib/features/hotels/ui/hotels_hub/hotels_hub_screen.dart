import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';

class HotelsHubScreen extends Screen {
  final HotelsListViewModel viewModel;
  final VoidCallback navigateToHotels;

  HotelsHubScreen({required this.viewModel, required this.navigateToHotels});

  @override
  Widget build(BuildContext context) {
    HotelViewModel hvm = this.viewModel.hotels.first;

    Text title =
        Text(hvm.title, style: TextStyle(color: Colors.black, fontSize: 20));

    ListTile tile = ListTile(
        onTap: navigateToHotels,
        contentPadding: EdgeInsets.zero,
        trailing: Icon(Icons.hotel, color: Colors.black, size: 30),
        title: title,
        subtitle: Text("\$" + hvm.price.toStringAsFixed(2)));

    return Container(
      height: 150,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    const Text(
                      'Latest Hotel',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              tile
            ],
          ),
        ),
      ),
    );
  }
}
