import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

import '../../domain/entities/store.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/bloc/visit_bloc.dart';
import '../blocs/store_bloc/store_bloc.dart';
import '../pages/store_detail_page.dart';

Widget storeList() {
  return BlocBuilder<StoreBloc, StoreState>(
    builder: (context, state) {
      if (state is StoreIsEmpty) {
        return const Center(child: Text('Tidak ada data untuk ditampilkan'));
      } else if (state is StoreLoadInProgress) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is StoreHasData) {
        final storeList = state.stores;
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: const [
                        Text('List Store'),
                        Text(
                          'UserA',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(const AuthLogOutPressed());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 10, left: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1.5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[100],
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: const Center(child: Text('Maps')),
              // child: MapsView(
              //   store: storeList[0],
              // ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                return _storeListTiles(context, storeList[index]);
              },
            ),
          ],
        );
      } else {
        return const Center(
          child: Text('Terjadi Kesalahan'),
        );
      }
    },
  );
}

Widget _storeListTiles(
  BuildContext context,
  Store store,
) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, StoreDetailPage.route, arguments: store);
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(spreadRadius: 2, blurRadius: 2, blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(store.storeName),
              Text('${store.areaName} - ${store.storeCode}'),
              Text(store.address),
            ],
          ),
          Row(
            children: [
              BlocBuilder<VisitBloc, VisitState>(
                builder: (context, state) {
                  if (state is VisitIsSuccess) {
                    return const Icon(
                      Icons.check,
                      color: Colors.green,
                    );
                  } else {
                    return const Text('');
                  }
                },
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.pin_drop, color: Colors.green),
            ],
          ),
        ],
      ),
    ),
  );
}
