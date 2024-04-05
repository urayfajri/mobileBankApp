import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDatePicker extends StatelessWidget {
  const HistoryDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                "Tanggal Awal",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                "Tanggal Akhir",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: _DatePicker(),
              ),
            ),
            const Icon(Icons.horizontal_rule),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: _DatePicker(),
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Maksimum rentang Tanggal Awal dan Tanggal Akhir adalah 31 hari terakhir",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                _showDatePicker(context);
              },
              child: Text(
                '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.transparent,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.of(context).pop(_selectedDate);
                    },
                    color: Colors.transparent,
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "Tahun / Bulan / Tanggal",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  minimumDate:
                      DateTime.now().subtract(Duration(days: 365 * 20)),
                  maximumDate: DateTime.now().add(Duration(days: 365 * 20)),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
