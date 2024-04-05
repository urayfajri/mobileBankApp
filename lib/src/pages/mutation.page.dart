import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_bank_app/src/pages/widgets/mutation.menu.list.dart';
// Import the clipboard package

class MutationPage extends StatefulWidget {
  const MutationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MutationPageState createState() => _MutationPageState();
}

class _MutationPageState extends State<MutationPage> {
  final String number = '13211231232';

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: number)); // Copy text to clipboard
    // Show a snackbar or any other feedback indicating success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Number copied to clipboard'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      width: 44.5 * 2,
                      height: 27.9 * 2,
                      margin: const EdgeInsets.only(
                        top: 60,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://ik.imagekit.io/fdu5ptj23co/OIP%20(1)_vmXXriotM.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Column(
                      children: [
                        Text(
                          'Tabungan Mandiri',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 70),
                        Text(
                          'RP. 15.000.000',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nominal Tertahan Rp 0',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        MutationIconList(),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.93,
                  expand: true,
                  shouldCloseOnMinExtent: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      color: Colors.white,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 136,
                width: MediaQuery.of(context).size.width + 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(number,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: copyToClipboard,
                      child: IconButton(
                        onPressed: copyToClipboard,
                        icon: const Icon(Icons.content_copy),
                        iconSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 40,
                right: 50,
                child: IconButton(
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 40,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
