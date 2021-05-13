import 'package:book_anim/app/modules/home/home_store.dart';
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
  final _pageViewController = PageController();
  var _scrollNotifier = ValueNotifier(0.0);

  void _listener() {
    _scrollNotifier.value = _pageViewController.page!;
  }

  @override
  void initState() {
    _pageViewController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ValueListenableBuilder(
            valueListenable: _scrollNotifier,
            builder: (context, double value, child) {
              return PageView.builder(
                  controller: _pageViewController,
                  itemCount: books_list.length,
                  itemBuilder: (context, index) {
                    final book = books_list[index];
                    double percentage = index - value;
                    double rotate = percentage.clamp(0, 1);
                    if (index == 1) print(percentage);
                    return Center(
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(rotate),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 200,
                                width: 120,
                                child: Image.asset(book.image)),
                            Text(
                              book.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(book.subTitle,
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
