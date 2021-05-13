import 'dart:math';

import 'package:book_anim/app/modules/home/home_controller.dart';
import 'package:book_anim/app/modules/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({this.title = "Home"});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.pageViewController.addListener(controller.listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.pageViewController.removeListener(controller.listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
            'assets/images/bg.png',
          ),
          )
        ),
        child: ValueListenableBuilder<double>(
            valueListenable: controller.scrollNotifier,
            builder: (context, double value, child) {
              return PageView.builder(
                  controller: controller.pageViewController,
                  itemCount: books_list.length,
                  itemBuilder: (context, index) {
                    final book = books_list[index];
                    double percentage = index - value;
                    double rotate = percentage.clamp(0, 1);
                    var fixRotate = pow(rotate,0.5);
                 
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                             Container(
                                height: sizes.height *.6,
                                width: sizes.width*0.6,
                               decoration: BoxDecoration(
                                 color: Colors.white,boxShadow: <BoxShadow>[
                                   BoxShadow(
                                     color: Colors.black54,
                                     offset: Offset(7.0,7.0),
                                     blurRadius: 10
                                   )
                                 ]
                               ),
                              ),
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(1.8 * fixRotate)..translate(
                                 - rotate * sizes.width *.7
                                )..scale(1+rotate),
                              child: Container(
                                height: sizes.height *.6,
                                width: sizes.width*0.6,
                                child: Image.asset(
                                  book.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                     Opacity(
                       opacity:1- rotate,
                                child: Column(
                         children: [
                              Text(
                            book.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(book.subTitle,
                              style: Theme.of(context).textTheme.caption),
                         ],
                       ),
                     )
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
