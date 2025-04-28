import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loggy/core/client.dart';
import 'package:loggy/loggy/data/repository/user_repository.dart';
import 'package:loggy/loggy/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

// class User extends StatelessWidget {
//   const User({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UserDetail(
//         user: UserViewModel(
//             repo: UserRepository(
//           client: ApiClient(),
//         )),
//       ),
//     );
//   }
// }

class UserDetail extends StatelessWidget {
  UserDetail({super.key, required this.user});

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final UserViewModel user;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: user.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: user.loginController,
                  decoration: InputDecoration(
                    hintText: "login",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: user.passwordController,
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (user.formKey.currentState!.validate()) {
                    final success = await user.login();
                    if (success) {

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('login yoki parol xato'),
                        ),
                      );
                    }
                  }
                },
                child: Center(
                  child: Text(
                    "kirish",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
