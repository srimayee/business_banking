// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:business_banking/routes.dart';
// import 'package:clean_framework/clean_framework.dart';
// import 'package:flutter/material.dart';

// class TransferFundsCard extends StatelessWidget {
//   const TransferFundsCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 125,
//       padding: EdgeInsets.all(5.0),
//       child: Card(
//         color: Colors.white,
//         shadowColor: Colors.grey[500],
//         elevation: 3.0,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 child: AutoSizeText('Between Huntington Accounts',
//                     style: TextStyle(color: Colors.lightGreen, fontSize: 30.0)),
//               ),
//               OutlineButton(
//                 key: Key('transfer_funds_button'),
//                 onPressed: () => CFRouterScope.of(context)
//                     .push(BusinessBankingRouter.transferFundsRoute),
//                 borderSide: BorderSide(
//                   color: Colors.black54, //Color of the border
//                   style: BorderStyle.solid, //Style of the border
//                   width: 0.8, //width of the border
//                 ),
//                 child: Text(
//                   'Transfer Funds',
//                   style: TextStyle(color: Colors.black54),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
