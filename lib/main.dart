import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storelist/domain/usecases/get_store_list_remotely.dart';
import 'package:storelist/domain/usecases/save_store_list.dart';
import 'package:storelist/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:storelist/presentation/pages/lab_db.dart';
import 'package:storelist/presentation/pages/login_page.dart';
import 'package:storelist/presentation/pages/store_detail_page.dart';
import 'package:storelist/presentation/pages/store_list_page.dart';

import './injection.dart' as di;
import 'domain/entities/store.dart';
import 'presentation/blocs/bloc/visit_bloc.dart';
import 'presentation/blocs/store_bloc/store_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            di.locator<GetStoreListRemotely>(),
            di.locator<SaveStoreList>(),
          ),
        ),
        BlocProvider(
          create: (context) => StoreBloc(di.locator()),
        ),
        BlocProvider(
          create: (context) => VisitBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Store List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        navigatorObservers: [RouteObserver<ModalRoute>()],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case LabOfDB.route:
              return MaterialPageRoute(builder: (_) => const LabOfDB());
            case LoginPage.route:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case StoreDetailPage.route:
              return MaterialPageRoute(
                  builder: (_) {
                    return StoreDetailPage(
                      store: settings.arguments as Store,
                    );
                  },
                  settings: settings);

            case StoreListPage.route:
              return MaterialPageRoute(builder: (_) => const StoreListPage());
            default:
              return MaterialPageRoute(
                  builder: (_) => const Text('Terjadi Kesalahan'));
          }
        },
      ),
    );
  }
}
