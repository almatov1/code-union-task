import 'package:code_union_task/module/authorization/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState()) {
    on<AccountAuthorizationEvent>(_onAuthorization);
    on<AccountLogoutEvent>(_onLogout);
  }

  _onAuthorization(
      AccountAuthorizationEvent event, Emitter<AccountState> emit) async {
    emit(state.copyWith(authorization: event.authorization));
  }

  _onLogout(AccountLogoutEvent event, Emitter<AccountState> emit) async {
    emit(state.copyWith(authorization: null));
  }
}
