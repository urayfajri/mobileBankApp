import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/result_search_history/widget/progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class BtnDownloadHistory extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const BtnDownloadHistory({Key? key});
  static Future<bool> _permissionRequest() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  State<BtnDownloadHistory> createState() => _BtnDownloadHistoryState();
}

class _BtnDownloadHistoryState extends State<BtnDownloadHistory> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.white),
      onPressed: () async {
        bool result = await BtnDownloadHistory._permissionRequest();
        if (result) {
          showDialog(
              context: context,
              builder: (dialogcontext) {
                return const DownloadProgressDialog();
              });
        } else {
          print("No permission to read and write.");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: const Color.fromARGB(255, 241, 90, 35),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Center(
            child: Text(
              'Download',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BtnPaginate extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BtnPaginate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        boxShadow: const [
          //BoxShadow
          BoxShadow(
            offset: Offset(
              5.0,
              5.0,
            ),
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: VerticalDivider(
                    color: Colors.black38,
                    thickness: 2,
                  ),
                ),
              ),
              Text(
                '1/1',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: VerticalDivider(
                    color: Colors.black38,
                    thickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
