part of 'account_bloc.dart';

abstract class AccountEvent {}

class AccountAuthorizationEvent extends AccountEvent {
  final Authorization authorization;

  AccountAuthorizationEvent(
    this.authorization,
  );
}

class AccountLogoutEvent extends AccountEvent {
  AccountLogoutEvent();
}
