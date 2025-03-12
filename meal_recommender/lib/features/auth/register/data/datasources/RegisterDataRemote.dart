import '../../../../../core/services/firebase_service.dart';

abstract class BaseAuthDataRemote{
  Future register(String email,String password);

}
class RegisterDataRemote extends BaseAuthDataRemote{
  FirebaseService firebaseService;
  RegisterDataRemote(this.firebaseService);


  @override
  Future register(String email, String password) async{
    return await firebaseService.register(email, password);
  }

}