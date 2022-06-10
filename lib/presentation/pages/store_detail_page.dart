import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:storelist/presentation/widgets/custom_button.dart';

import '../../domain/entities/store.dart';
import '../blocs/bloc/visit_bloc.dart';

class StoreDetailPage extends StatelessWidget {
  static const route = 'store-detail';

  final Store store;
  const StoreDetailPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: heightScreen * 0.4,
              width: widthScreen * 0.95,
              child: Image.asset(
                'assets/alfamart.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                width: widthScreen,
                height: heightScreen * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.orange,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Lokasi belum sesuai'),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(2),
                              alignment: Alignment.center,
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(2)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          onPressed: () {},
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                    Text(store.storeName),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(store.address),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text('''
Tipe Outlet

Tipe Display

Sub Tipe Display

ERTM

Pareto

E-marchendashing
'''),
                        SizedBox(
                          width: 20,
                        ),
                        Text('''
: [data]

: [data]

: [data]

: Ya

: Ya

: Ya
''')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'No Visit',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      color: Colors.blue,
                      onPressed: () {
                        context.read<VisitBloc>().add(const VisitPressed(true));
                        Navigator.pop(context);
                      },
                      text: 'Visit',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
