import 'package:flutter/material.dart';
import 'package:goribli_studio/constants.dart';
import 'package:goribli_studio/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'বর্ণনা',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                app_name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "ভার্সন: ১.০.০",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "এটা কোনো প্রফেশনাল টুল নয়, শুধু মজার জন্য তৈরি! আমি একটি ফ্রি ইমেজ জেনারেশন মডেল ট্রেন করেছি, যা টেক্সট থেকে জিবলি-স্টাইল ছবি বানানোর চেষ্টা করে। কখনো সুন্দর কিছু হয়, কখনো একদম আজব! যা-ই হোক, মজাটা কিন্তু থাকবেই!",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "সার্বিক তত্ত্বাবধায়নে:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://i.ibb.co.com/FPq1bqL/image.jpg',
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "রাতুল হাসান রুহান",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){
                        launchUrl(Uri.parse('https://www.facebook.com/ratulhasan.ruhan'));
                      },
                      icon: Icon(Icons.facebook),
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: (){
                      launchUrl(Uri.parse('https://www.linkedin.com/in/ratulhasanruhan/'));
                    },
                    icon: Icon(Icons.public),
                    color: Color(0xFF0077b5),
                  ),
                  IconButton(
                    onPressed: (){
                      launchUrl(Uri.parse('mailto:ratulhasan1644@gmail.com'));
                    },
                    icon: Icon(Icons.email),
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
