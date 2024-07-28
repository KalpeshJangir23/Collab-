// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';

class ButtonWithNameAndImage extends StatelessWidget {
  final String imageName;
  final String loginfield;
  final VoidCallback ontap;

  const ButtonWithNameAndImage({
    super.key,
    required this.imageName,
    required this.ontap,
    required this.loginfield,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: const Color(0xff979A9B))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              loginfield,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w300, color: const Color(0xffffffff)),
            )
          ],
        ),
      ),
    );
  }
}
