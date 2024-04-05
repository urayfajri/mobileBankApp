import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/models/transaction_history_model.dart';
import 'package:mobile_bank_app/src/pipe/format_currency.dart';

// Assuming dummyData is imported from another file
final List<TransactionHistoryModel> dummyData = [
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
  TransactionHistoryModel(
    id: 11,
    tipe: 'Debit',
    uraian: 'Pembayaran Internet',
    nominal: 100000,
    saldoAkhir: '5500000',
  ),
  TransactionHistoryModel(
    id: 12,
    tipe: 'Kredit',
    uraian: 'Pengembalian Dana',
    nominal: 150000,
    saldoAkhir: '5650000',
  ),
  TransactionHistoryModel(
    id: 13,
    tipe: 'Debit',
    uraian: 'Pembelian Buku',
    nominal: 50000,
    saldoAkhir: '5600000',
  ),
  TransactionHistoryModel(
    id: 14,
    tipe: 'Kredit',
    uraian: 'Cashback',
    nominal: 25000,
    saldoAkhir: '5625000',
  ),
]; // Your dummy data list

class TableHistory extends StatelessWidget {
  const TableHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(50),
        3: FixedColumnWidth(100),
      },
      children: [
        // Table Header
        const TableRow(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 90, 35), // Header color
          ),
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Text(
                  'Uraian',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Text(
                  'Tipe',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Text(
                  'Nominal',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Text(
                  'Saldo Akhir',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        // Table Rows
        ...dummyData.map((transaction) {
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.uraian,
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '2024-03-31', // Assuming you want the same date for all transactions
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    transaction.tipe
                        .substring(0, 1), // Taking the first letter from 'tipe'
                    style: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    CurrencyFormat.convertToIdr(transaction.nominal, 2),
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    CurrencyFormat.convertToIdr(
                        int.parse(transaction.saldoAkhir), 2),
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
