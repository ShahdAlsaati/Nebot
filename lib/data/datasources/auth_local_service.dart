
import 'package:nebot/common/local/cache_helper.dart';

abstract class AuthLocalService{
  Future<bool> isLoggedIn();

}

class AuthLocalServiceImpl extends AuthLocalService{
  @override
  Future<bool> isLoggedIn() async{
    var token=CacheHelper.getData(key: 'token');
    if(token==null)
      {
        return false;
      }
    else {
      return true;
    }
  }

}