import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/user_model.dart';
import 'package:provider/provider.dart';

import '../controller/usercontroller.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  static UserController? _userController;

  @override
  void initState() {
    // TODO: implement initState
    _userController = Provider.of<UserController>(context, listen: false);
    initController();
    super.initState();
  }

  initController() {
    _userController?.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Selector<UserController, UserDetails?>(
                selector:
                    (BuildContext buildContext, UserController controller) =>
                        controller.userDetails,
                builder:
                    (BuildContext context, UserDetails? data, Widget? child) {
                  return _userController?.userDetails?.id != null
                      ? Column(
                          children: [
                            Text(data?.title ?? ''),
                            // Text(data?.body ?? ''),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }))
        // FutureBuilder(
        //   future: _userController?.getUserDetails(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       return Center(
        //         child: Text(_userController?.userDetails?.title ?? ''),
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        );
  }
}
