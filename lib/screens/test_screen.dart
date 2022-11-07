import 'package:flutter/material.dart';
import 'package:wear_out/utils.dart';

class TestingScreen extends StatefulWidget {
  TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> with SingleTickerProviderStateMixin {
  final Color neonGreen = const Color.fromARGB(255, 130, 255, 88);
  final Color black = const Color(0XFF0f0f0f);
  final Color orange = const Color(0XFFf15410);

  late final AnimationController animationController;
  late Animation<double> animation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (animationController.isAnimating) {
            animationController.stop();
          } else {
            animationController.repeat(reverse: true);
          }
        },
        child: SafeArea(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new_rounded,
                        size: 100,
                        color: neonGreen.withOpacity(animation.value),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: animation.value >= 1 / 4 ? neonGreen.withOpacity(animation.value) : Colors.transparent,
                            ),
                          ),
                          horizontalSeparator,
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: animation.value >= 2 / 4 ? neonGreen.withOpacity(animation.value) : Colors.transparent,
                            ),
                          ),
                          horizontalSeparator,
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: animation.value >= 3 / 4 ? neonGreen.withOpacity(animation.value) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
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
