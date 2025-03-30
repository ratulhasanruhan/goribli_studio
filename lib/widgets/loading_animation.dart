import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadingAnimation(BuildContext context) {
  return Lottie.asset(
      'assets/loading_anim.json',
    height: MediaQuery.sizeOf(context).height * 0.3,
    width: MediaQuery.sizeOf(context).width * 0.4,
  );
}