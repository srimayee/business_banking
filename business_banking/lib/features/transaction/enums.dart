import 'package:flutter/material.dart';

enum TransactionCategory {
  rent,
  restaurant,
  transportation,
  haircut,
  utilities,
  miscellaneous,
  groceries,
  shopping,
  entertainment,
  insurance,
  tuition,
  charity,
  service,
  gas,
  income,
  transfer,
  coffeeShop,
  movies,
  airTravel,
  tax
}

extension TransactionCategoryExtension on TransactionCategory {
  Color get color {
    switch (this) {
      case TransactionCategory.rent:
        return Colors.blue;
        break;
      case TransactionCategory.restaurant:
        return Colors.blue;
        break;
      case TransactionCategory.transportation:
        return Colors.blue;
        break;
      case TransactionCategory.haircut:
        return Colors.blue;
        break;
      case TransactionCategory.utilities:
        return Colors.blue;
        break;
      case TransactionCategory.miscellaneous:
        return Colors.blue;
        break;
      case TransactionCategory.groceries:
        return Colors.blue;
        break;
      case TransactionCategory.shopping:
        return Colors.blue;
        break;
      case TransactionCategory.entertainment:
        return Colors.blue;
        break;
      case TransactionCategory.insurance:
        return Colors.blue;
        break;
      case TransactionCategory.tuition:
        return Colors.blue;
        break;
      case TransactionCategory.charity:
        return Colors.blue;
        break;
      case TransactionCategory.service:
        return Colors.blue;
        break;
      case TransactionCategory.gas:
        return Colors.blue;
        break;
      case TransactionCategory.income:
        return Colors.blue;
        break;
      case TransactionCategory.transfer:
        return Colors.blue;
        break;
      case TransactionCategory.coffeeShop:
        return Colors.blue;
        break;
      case TransactionCategory.movies:
        return Colors.blue;
        break;
      case TransactionCategory.airTravel:
        return Colors.blue;
        break;
      case TransactionCategory.tax:
        return Colors.blue;
        break;
      default:
        return Colors.blue;
    }
  }
}
