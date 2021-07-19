import 'package:business_banking/features/authorized_users/model/AuthorizedUser.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AuthorizedUsersServiceResponseModel extends JsonResponseModel {
  late final List<AuthorizedUser> authorizedUsers;

  AuthorizedUsersServiceResponseModel(this.authorizedUsers);

  AuthorizedUsersServiceResponseModel.fromJson(Map<String, dynamic> json){
    print('json');
    print(json);
    this.authorizedUsers = List<AuthorizedUser>.from(json["data"].map((x) => AuthorizedUser(
        x["name"],
        x["email"],
        x["status"])
    ));
    //return authorizedUsers;
  }


  @override
  List<Object> get props => [authorizedUsers];

  @override
  // implement stringify
  bool get stringify => false;
}
