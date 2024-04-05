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
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.white.withOpacity(0),
                  elevation: 0,
                  isDismissible: false,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.5,
                      minChildSize: 0.5,
                      maxChildSize: 0.9,
                      expand: true,
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
                    );
                  },
                );
              },
              child: const Text('Open Draggable Popup'),
            ),
          ),
        ),
      ),
    );
  }
}
