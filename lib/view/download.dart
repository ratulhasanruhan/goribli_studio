import 'package:flutter/material.dart';
import 'package:goribli_studio/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {

  String raw_url = "https://raw.githubusercontent.com/ratulhasanruhan/goribli_studio/refs/heads/master/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade50,
      appBar: AppBar(
        backgroundColor: AppColors.primarySwatch.shade200,
        centerTitle: true,
        title: Text(
          'ডাউনলোড ',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'নিম্নোক্ত প্লাটফর্মে সহজে ব্যবহারের জন্য:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.window),
                      label: Text(
                        'উইন্ডোজ',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFF00A3EE)
                      ),
                      onPressed: () async{
                        await launchUrl(Uri.parse('${raw_url}goribli.exe'));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.android),
                      label: Text(
                        'এন্ড্রোয়েড',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFF3DDC84)
                      ),
                      onPressed: ()async{
                        await launchUrl(Uri.parse('${raw_url}goribli.apk'));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.public),
                      label: Text(
                        'ওয়েব',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.textColor
                      ),
                      onPressed: () async{
                        await launchUrl(Uri.parse('https://goribli.web.app/'));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
