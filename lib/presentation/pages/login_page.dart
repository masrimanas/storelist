import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:storelist/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:storelist/presentation/pages/store_list_page.dart';
import 'package:storelist/presentation/widgets/custom_button.dart';
import 'package:storelist/presentation/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  static const route = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userInputController.dispose();
    passwordInputController.dispose();
  }

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthUnAuthenticated) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/top.png',
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                            inputController: userInputController,
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                            ),
                            text: 'Username',
                            type: TextInputType.name,
                            isHidden: false),
                        const SizedBox(
                          height: 8,
                        ),
                        TextInputForm(
                            inputController: passwordInputController,
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            text: 'Password',
                            type: TextInputType.visiblePassword,
                            isHidden: true),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (value) {}),
                                  const Text(
                                    'Keep username',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.download,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    'Check Update',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomButton(
                            color: Colors.blue,
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    AuthLogInPressed(userInputController.text,
                                        passwordInputController.text),
                                  );
                            },
                            text: 'Login',
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/bottom.png',
                      fit: BoxFit.cover,
                    ),
                  ]);
            } else if (state is AuthAuthenticationSuccess) {
              return const StoreListPage();
            } else if (state is AuthAuthenticationFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthLogOutPressed());
                      },
                      child: const Text('Coba Lagi')),
                ],
              );
            } else if (state is AuthAuthenticationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Terjadi Kesalahan',
                    textAlign: TextAlign.center,
                  )),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthLogOutPressed());
                      },
                      child: const Text('Coba Lagi')),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
