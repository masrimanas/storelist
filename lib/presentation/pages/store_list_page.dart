import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

import '../blocs/store_bloc/store_bloc.dart';
import '../widgets/store_list_view.dart';

class StoreListPage extends StatefulWidget {
  static const route = 'store-list';

  const StoreListPage({Key? key}) : super(key: key);

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      context.read<StoreBloc>().add(const StoreListLoadInitialize());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              storeList(),
            ],
          ),
        ),
      ),
    );
  }
}
