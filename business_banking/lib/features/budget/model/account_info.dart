class AccountInfo {
  final String accountNumber;
  final double availableBalance;
  final String accountNickname;

  AccountInfo(this.accountNumber, this.availableBalance, this.accountNickname);

  AccountInfo.fromJson(Map<String, dynamic> json)
      : accountNumber = json['accountNumber'] ?? '',
        availableBalance = json['availableBalance'] ?? 0.0,
        accountNickname = json['accountNickname'] ?? '';
}
