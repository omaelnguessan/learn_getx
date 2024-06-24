import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/view_models/controller/logout/logout_view_model.dart';
import 'package:learn_getx/view_models/controller/home/home_view_model.dart';
import 'package:learn_getx/data/response/status.dart';
import 'package:learn_getx/res/components/internt_exceptions_widget.dart';
import 'package:learn_getx/res/components/general_exceptions_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final logoutVM = Get.put(LogoutViewModel());
  final homeController = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  logoutVM.logout();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              if (homeController.error.value == 'Not internet') {
                return InternetExceptionsWidget(
                  onPress: () {
                    homeController.userListRefreshApi();
                  },
                );
              } else {
                return GeneralExceptionsWidget(onPress: () {
                  homeController.userListRefreshApi();
                });
              }
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: homeController.userList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController
                              .userList.value.data![index].avatar
                              .toString()),
                        ),
                        title: Text(homeController
                            .userList.value.data![index].firstName
                            .toString()),
                        subtitle: Text(homeController
                            .userList.value.data![index].email
                            .toString()),
                      ),
                    );
                  });
          }
        }));
  }
}
