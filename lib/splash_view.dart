import 'package:flutter/material.dart';
import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/core/app_local_storage.dart';
import 'package:insights_news/feature/home/home_view.dart';
import 'package:insights_news/feature/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      AppLocal.getBool(AppLocal.isUpload).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => value ? const HomeView() : const UploadView(),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sacffoldBG,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 250,
          ),
          Text(
            'Insight News',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      )),
    );
  }
}
