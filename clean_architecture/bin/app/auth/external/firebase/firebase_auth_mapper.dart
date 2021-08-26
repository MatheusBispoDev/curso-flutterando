import '../../domain/entities/logged_user.dart';

class LoggedUserMapper {
  static LoggedUser fromJson(Map json) {
    return LoggedUser(name: json['name'], email: json['email']);
  }
}

class LoggeUserInternal extends LoggedUser {
  LoggeUserInternal() : super(email: '', name: '');
}
