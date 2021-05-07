import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/hotels/model/hotels_view_model.dart';

class HotelsHubScreen extends Screen {
  final HotelsViewModel viewModel;
  //final VoidCallback navigateToHotels;

  HotelsHubScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    String name = this.viewModel.title;

    return Container(
      height: 220,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Row(
                  children: [
                    const Text(
                      'Hotels',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 100.0),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
