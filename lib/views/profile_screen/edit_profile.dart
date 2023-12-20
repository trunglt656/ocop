import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bdWidget(
        child: Scaffold(
            body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imgProfile2, width: 130, fit: BoxFit.cover)
            .box
            .roundedFull
            .clip(Clip.antiAlias)
            .make(),
        10.heightBox,
        ourButton(
            color: redColor,
            onPress: () {},
            textColor: whiteColor,
            title: "Thay đổi"),
        const Divider(),
        20.heightBox,
        customTextField(
          hint: nameHint,
          title: name,
          isPass: false,
        ),
        customTextField(
          hint: password,
          title: password,
          isPass: true,
        ),
        SizedBox(
          width: context.screenWidth - 50,
          child: ourButton(
              color: Colors.green.shade300,
              onPress: () {},
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
                .make()));
  }
}
