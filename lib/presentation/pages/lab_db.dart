import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storelist/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:storelist/presentation/pages/store_list_page.dart';
import 'package:storelist/presentation/widgets/text_input.dart';

class LabOfDB extends StatefulWidget {
  static const route = 'db';
  const LabOfDB({Key? key}) : super(key: key);

  @override
  State<LabOfDB> createState() => _LoginPageState();
}

class _LoginPageState extends State<LabOfDB> {
  final TextEditingController userInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userInputController.dispose();
    passwordInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthUnAuthenticated) {
              return Column(children: [
                const SizedBox(
                  height: 20,
                ),
                TextInputForm(
                    inputController: userInputController,
                    icon: const Icon(Icons.account_circle),
                    text: 'Username',
                    type: TextInputType.name,
                    isHidden: false),
                const SizedBox(
                  height: 8,
                ),
                TextInputForm(
                    inputController: passwordInputController,
                    icon: const Icon(Icons.lock),
                    text: 'Password',
                    type: TextInputType.visiblePassword,
                    isHidden: true),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLogInPressed(userInputController.text,
                              passwordInputController.text),
                        );
                  },
                  child: const Text('Login'),
                ),
              ]);
            } else if (state is AuthAuthenticationSuccess) {
              return const StoreListPage();
            } else if (state is AuthAuthenticationFailure) {
              return Center(child: Text(state.message));
            } else if (state is AuthAuthenticationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text('Terjadi Kesalahan');
            }
          },
        ),
      ),
    );
  }
}
