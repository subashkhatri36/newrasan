import 'package:flutter/foundation.dart';

class AuthFailure implements Exception {
  final String messsage;
  AuthFailure({
    @required this.messsage,
  });
}
