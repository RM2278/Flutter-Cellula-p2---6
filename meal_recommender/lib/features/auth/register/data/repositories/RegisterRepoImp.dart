import '../../domain/repositories/registerRepo.dart';
import '../datasources/RegisterDataRemote.dart';

class RegisterRepoimp extends RegisterRepo{
  BaseAuthDataRemote baseAuthDataRemote;
  RegisterRepoimp(this.baseAuthDataRemote);

  @override
  Future register(String UserName,String email, String password) async{
    return await baseAuthDataRemote.register(UserName ,email, password);
  }

  @override
  Future reload() async{
    // TODO: implement reload
    return await baseAuthDataRemote.reload();
  }

}