// import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_entity.dart';
// import 'package:clean_framework/clean_framework.dart';
//
// class AccountDetailEntityModelList extends Entity {
//   /// Single Entity Object List Variable
//   final List<AccountDetailEntityModel> accountDetailEntityModelList;
//
//   /// AccountDetailEntityModelList Constructor with default value assignment
//   AccountDetailEntityModelList(
//       {List<EntityError> errors = const [],
//       List<AccountDetailEntityModel> accountDetailEntityModelList})
//       : accountDetailEntityModelList = accountDetailEntityModelList ?? [],
//       super(errors: errors);
//
//   /// Props override values
//   @override
//   List<Object> get props => [errors, accountDetailEntityModelList];
//
//   /// Merge function for parsing object types
//   @override
//   merge({errors, List<AccountDetailEntityModel> accountDetailEntityModel}) {
//     return AccountDetailEntityModelList(
//       errors: errors ?? this.errors,
//       accountDetailEntityModelList:
//           accountDetailEntityModel ?? this.accountDetailEntityModelList,
//     );
//   }
// }
