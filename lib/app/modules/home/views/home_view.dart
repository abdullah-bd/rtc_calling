import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: controller.client,layoutType: Layout.oneToOne,),
              AgoraVideoButtons(client: controller.client,autoHideButtons: true,),
            ],
          ),

      ),
    );
  }
}
