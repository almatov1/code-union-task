part of 'account_bloc.dart';

class AccountState {
  final Authorization? authorization;

  AccountState({this.authorization});

  AccountState copyWith({final Authorization? authorization}) {
    return AccountState(authorization: authorization ?? authorization);
  }
}
