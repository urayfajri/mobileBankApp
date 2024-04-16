import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/settings/components/general/language_setting_page.dart';

class GeneralSettingsSection extends StatelessWidget {
  const GeneralSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pengaturan Umum",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        SettingLanguageButton()
      ],
    );
  }
}

class SettingLanguageButton extends StatelessWidget {
  const SettingLanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LanguageSettingPage()),
        )
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        foregroundColor: const Color.fromARGB(255, 207, 207, 207),
        shadowColor: Colors.transparent,
      ),
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.translate,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                Text(
                  "Bahasa",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
