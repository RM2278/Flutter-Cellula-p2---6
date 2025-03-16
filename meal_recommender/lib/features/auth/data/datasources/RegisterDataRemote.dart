import '../../../../core/services/firebase_service.dart';

abstract class BaseAuthDataRemote{
  Future register(String UserName,String email,String password);
  Future reload();

}
class RegisterDataRemote extends BaseAuthDataRemote{
  FirebaseService firebaseService;
  RegisterDataRemote(this.firebaseService);


  @override
  Future register(String UserName,String email, String password) async{
    return await firebaseService.register(UserName,email, password);
  }

  @override
  Future reload() async{
    return await firebaseService.Reload();
  }

}