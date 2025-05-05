import 'package:loggy/core/client.dart';
import 'package:loggy/loggy/data/repository/user_repository.dart';
import 'package:loggy/loggy/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => UserRepository(
      client: context.read(),
    ),
  ),

];
