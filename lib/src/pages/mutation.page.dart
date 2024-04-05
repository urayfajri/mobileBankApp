import 'package:flutter/material.dart';

class MutationPage extends StatefulWidget {
  const MutationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MutationPageState createState() => _MutationPageState();
}

class _MutationPageState extends State<MutationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              child: Text('test'),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.93,
              expand: true,
              shouldCloseOnMinExtent: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
          ]),
        ),
      ),
    );
  }
}
