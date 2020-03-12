import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urdunbasket/main.dart';
import 'package:urdunbasket/models/user.dart';
import 'package:urdunbasket/screens/authenticate/authenticate.dart';
import 'package:urdunbasket/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return Authenticate();
    else
      return Home(true);
  }
}
