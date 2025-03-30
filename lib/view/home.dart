import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:goribli_studio/utils/api.dart';
import 'package:goribli_studio/utils/app_colors.dart';
import 'package:goribli_studio/widgets/loading_animation.dart';

import '../constants.dart';
import '../widgets/gorib_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController promptController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          app_name,
          style: TextStyle(
            fontFamily: 'Ador',
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      drawer: const GoribDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.1,
            vertical: MediaQuery.sizeOf(context).height * 0.1
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'একটি বাঁজে ছবির জন্য প্রস্তুত থাকুন',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20
                    ),
                    child: Form(
                      key: _formKey,
                      child: _isLoading
                      ? FutureBuilder(
                          future: fetchImage(promptController.text),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return loadingAnimation(context);
                            } else if (snapshot.hasError) {
                              return Column(
                                children: [
                                  const Text(
                                    'এই ছবিটা কল্পনা শক্তির বাইরে! আবার চেষ্টা করুন!',
                                    style: TextStyle(
                                      color: AppColors.errorColor,
                                      fontSize: 18
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextButton.icon(
                                    onPressed: (){
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                    label: const Text(
                                      'আবার হয়ে যাক',
                                      style: TextStyle(
                                          color: AppColors.accentColor
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.accentColor,
                                    ),
                                  )
                                ],
                              );
                            } else if(snapshot.data == null) {
                              return Column(
                                children: [
                                  const Text(
                                    'হুঁ, কিছু একটা গন্ডগোল হয়ে গেছে! আবার চেষ্টা করুন!',
                                    style: TextStyle(
                                        color: AppColors.errorColor,
                                        fontSize: 18
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextButton.icon(
                                    onPressed: (){
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                    label: const Text(
                                      'আবার হয়ে যাক',
                                      style: TextStyle(
                                          color: AppColors.accentColor
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.accentColor,
                                    ),
                                  )
                                ],
                              );
                            }
                            else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.arrow_back),
                                        onPressed: () {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        },
                                      ),
                                      TextButton.icon(
                                          onPressed: (){
                                            FileSaver.instance.saveFile(name: 'your_goribio.png',bytes: snapshot.data).then((value) {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: const Text('ছবি নেডের থেকে নামছে'),
                                                backgroundColor: AppColors.primarySwatch.shade100,
                                              ));
                                            });
                                          },
                                          label: const Text(
                                            'ডাউনলোড',
                                            style: TextStyle(
                                              color: AppColors.accentColor
                                            ),
                                          ),
                                        icon: const Icon(
                                          Icons.download,
                                          color: AppColors.accentColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.memory(
                                      snapshot.data!,
                                    ),
                                  )
                                ],
                              );
                            }
                          }
                      )
                      : Column(
                        children: [
                          TextFormField(
                            maxLines: 4,
                            controller: promptController,
                            decoration: InputDecoration(
                              hintText: 'মাধুরীমিশ্রিত ভাষায় লিখে ফেলুন...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.accentColor
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.accentColor
                                )
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.errorColor
                                )
                              )
                            ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'কিছু একটা লিখে দিন, সমস্যা নাই';
                             }
                             return null;
                           },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width:  double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.accentColor
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  )
                                )
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8
                                ),
                                child: Text(
                                  'হয়তো কিছু হবে!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
