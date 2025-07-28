import 'package:flutter/material.dart';
import 'package:spotify_like/common/WIDGET/button/basicAppButton.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppPng.chooseModePage, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Choose Mode", // Fixed spelling
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFamily: "Satoshi",
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 73,
                              height: 73,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: Icon(
                                Icons.light_mode,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Text(
                              "Ligth",
                              style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightBackground,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Column(
                          children: [
                            Container(
                              width: 73,
                              height: 73,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Text(
                              "dark",
                              style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightBackground,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Basicappbutton(
                  btnText: "Continue",
                  btnFontFamily: "Satoshi",
                  btnFontWeight: FontWeight.w700,
                  btnFontSize: 22,
                  onPressed: () {
                    // TODO: Navigate to the actual next screen (not ChooseMode again)
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NextScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
