import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;


class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  bool onClick = false;
  late AnimationController animationController;
  late Animation<double> animation;
  double val = 23.w;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation =
        Tween<double>(begin: 0.0, end: /*math.pi*/2.009703921929574 ).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
   // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onClick ? const Color(0xffF6FEF9) : const Color(0xffFDF6F6),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
                children: [
              InkWell(
               overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  setState(() {
                    onClick = !onClick;
                  });
                },
                child: Container(
                  height: 5.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: onClick ? Colors.green.withOpacity(0.4) : Colors.red.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(1, 9), // changes position of shadow
                        ),
                      ],
                      color: onClick ? Colors.green : Colors.red),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 800),
                left: onClick ? 60 : 5,
                bottom: 9,
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    setState(() {
                      onClick = !onClick;
                    });
                  },
                  child:
                  /*AnimatedBuilder(
                    animation: animationController,
                    builder:  (context, child) =>*/
                        Transform(
                      transform: onClick ? (Matrix4.identity()..rotateY(2.009703921929574/*animation.value*/))  : Matrix4.identity(),
                      alignment: Alignment.center,
                      child:
                      AnimatedContainer(

                       // transformAlignment:Alignment.center ,
                       //  transform: onClick ? (Matrix4.identity()..rotateY(2.009703921929574/*animation.value*/))  : Matrix4.identity(),
                        duration:const Duration(milliseconds: 1000),
                        height: 2.5.h,
                        width: 5.5.w ,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                            color: Colors.white),
                      ),
                    ),

                  ),
                //),
              ),


            ]
              ),
          ),

        ],
      ),
    );
  }
}
