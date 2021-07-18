class Transaction {
  DateTime? date;
  String? amount;
  String? type, currencyCode, iban, description, bic, id;

  Transaction(
      {this.date,
      this.amount,
      this.bic,
      this.currencyCode,
      this.description,
      this.iban,
      this.id,
      this.type});

  factory Transaction.fromMap(Map<String, dynamic> data) {
    return Transaction(
        date: data['date'] != null ? DateTime.parse(data['date']) : null,
        amount: data['amount'] ?? '',
        bic: data['bic'] ?? '',
        currencyCode: data['currencyCode'] ?? '',
        description: data['description'] ?? '',
        iban: data['iban'] ?? '',
        id: data['id'] ?? '',
        type: data['type'] ?? '');
  }
}
