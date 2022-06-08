import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String name;
  final String email;
  final String uid;
  final String profileUrl;

  User(this.name, this.email, this.uid, this.profileUrl);
  
  @override
  List<Object?> get props => [name, email, uid, profileUrl];
}
