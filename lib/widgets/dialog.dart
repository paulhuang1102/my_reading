import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget confirmBtn(Function? confirm) {
  return ElevatedButton(
      onPressed: () {
        confirm?.call();
        Get.back();
      },
      child: const Text("Confirm"));
}

Widget cancelBtn() {
  return ElevatedButton(
    onPressed: () {
      Get.back();
    },
    child: const Text("Cancel"),
    style: ElevatedButton.styleFrom(primary: Colors.transparent),
  );
}

const double padding = 20.0;
const double circular = 42.0;

class DefaultDialog extends StatelessWidget {
  const DefaultDialog(
      {this.title = '', this.content = '', this.confirm, Key? key})
      : super(key: key);
  final String title;
  final String content;
  final Function? confirm;

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: padding,
            top: circular + padding,
            right: padding,
            bottom: padding,
          ),
          margin: const EdgeInsets.only(top: circular),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(padding),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                content,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cancelBtn(),
                  confirmBtn(confirm),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: circular,
            child: ClipOval(
              child: Image.asset(
                'assets/images/lulu.jpeg',
                width: circular * 2,
                height: circular * 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
}
