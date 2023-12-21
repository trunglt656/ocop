import 'dart:io';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/profile_controller.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bdWidget(
        child: Scaffold(
            body: Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //nếu url img trống && controller trống
          data['imageUrl'] == "" && controller.profileImgPath.isEmpty
              ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
              : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                  ? Image.network(data['imageUrl'],
                          width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : Image.file(File(controller.profileImgPath.value),
                          width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
          10.heightBox,
          ourButton(
              color: redColor,
              onPress: () {
                controller.changeImage(context); //thay image profile
              },
              textColor: whiteColor,
              title: "Thay đổi"),
          const Divider(),
          20.heightBox,
          customTextField(
            controller: controller.nameController,
            hint: nameHint,
            title: name,
            isPass: false,
          ),
          customTextField(
            controller: controller.passwordController,
            hint: password,
            title: password,
            isPass: true,
          ),
          controller.isLoading.value
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                )
              : SizedBox(
                  //Save button
                  width: context.screenWidth - 50,
                  child: ourButton(
                      color: Colors.green.shade300,
                      onPress: () async {
                        controller.isLoading(true);
                        await controller.uploadProfileImage();
                        await controller.updateProfile(
                          imgUrl: controller.profileImgLink,
                          name: controller.nameController.text,
                          password: controller.passwordController.text,
                        );
                        VxToast.show(context, msg: "Cập nhật thành công");
                      },
                      textColor: whiteColor,
                      title: "Lưu"),
                ),
        ],
      )
          .box
          .white
          .shadowSm
          .padding(const EdgeInsets.all(16))
          .margin(const EdgeInsets.only(top: 100, left: 12, right: 12))
          .rounded
          .make(),
    )));
  }
}
