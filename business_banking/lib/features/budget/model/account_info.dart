class AccountInfo {
  final String accountNumber;
  final String availableBalance;
  final String accountNickname;

  AccountInfo(this.accountNumber, this.availableBalance, this.accountNickname);

  AccountInfo.fromJson(Map<String, dynamic> json)
      : accountNumber = json['accountNumber'] ?? '',
        availableBalance = json['availableBalance'] ?? '',
        accountNickname = json['accountNickname'] ?? '';
}
