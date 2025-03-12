import '../../domain/repositories/registerRepo.dart';
import '../datasources/RegisterDataRemote.dart';

class RegisterRepoimp extends RegisterRepo{
  BaseAuthDataRemote baseAuthDataRemote;
  RegisterRepoimp(this.baseAuthDataRemote);

  @override
  Future register(String email, String password) async{
    return await baseAuthDataRemote.register(email, password);
  }

}