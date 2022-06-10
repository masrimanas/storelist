part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthAuthenticationLoading extends AuthState {}

class AuthAuthenticationSuccess extends AuthState {
  // final List<Store> data;
  const AuthAuthenticationSuccess();
}

class AuthAuthenticationFailure extends AuthState {
  final String message;

  const AuthAuthenticationFailure(
    this.message,
  );
}

class AuthUnAuthenticated extends AuthState {}
