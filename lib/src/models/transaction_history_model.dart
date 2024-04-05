class TransactionHistoryModel {
  final int id;
  final String tipe;
  final String uraian;
  final int nominal;
  final String saldoAkhir;

  TransactionHistoryModel({
    required this.tipe,
    required this.uraian,
    required this.id,
    required this.nominal,
    required this.saldoAkhir,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryModel(
      tipe: json['tipe'],
      id: json['id'],
      uraian: json['uraian'],
      nominal: json['nominal'],
      saldoAkhir: json['saldoAkhir'],
    );
  }
}

List<TransactionHistoryModel> dummyData = [
  TransactionHistoryModel(
    id: 1,
    tipe: 'Debit',
    uraian: 'Pembelian Makanan',
    nominal: 25000,
    saldoAkhir: '100000',
  ),
  TransactionHistoryModel(
    id: 2,
    tipe: 'Kredit',
    uraian: 'Gaji',
    nominal: 5000000,
    saldoAkhir: '5100000',
  ),
  TransactionHistoryModel(
    id: 3,
    tipe: 'Debit',
    uraian: 'Pembayaran Listrik',
    nominal: 150000,
    saldoAkhir: '4950000',
  ),
  TransactionHistoryModel(
    id: 4,
    tipe: 'Kredit',
    uraian: 'Bonus',
    nominal: 750000,
    saldoAkhir: '5700000',
  ),
  TransactionHistoryModel(
    id: 5,
    tipe: 'Debit',
    uraian: 'Pembelian Baju',
    nominal: 300000,
    saldoAkhir: '5400000',
  ),
  TransactionHistoryModel(
    id: 6,
    tipe: 'Kredit',
    uraian: 'Refund',
    nominal: 200000,
    saldoAkhir: '5600000',
  ),
  TransactionHistoryModel(
    id: 7,
    tipe: 'Debit',
    uraian: 'Pembayaran Internet',
    nominal: 100000,
    saldoAkhir: '5500000',
  ),
  TransactionHistoryModel(
    id: 8,
    tipe: 'Kredit',
    uraian: 'Pengembalian Dana',
    nominal: 150000,
    saldoAkhir: '5650000',
  ),
  TransactionHistoryModel(
    id: 9,
    tipe: 'Debit',
    uraian: 'Pembelian Buku',
    nominal: 50000,
    saldoAkhir: '5600000',
  ),
  TransactionHistoryModel(
    id: 10,
    tipe: 'Kredit',
    uraian: 'Cashback',
    nominal: 25000,
    saldoAkhir: '5625000',
  ),
];
