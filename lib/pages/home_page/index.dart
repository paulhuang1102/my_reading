import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';
import 'package:mighty_book/pages/home_page/widgets/book_item.dart';
import 'package:mighty_book/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SlidingCardsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(ROUTES.addBook);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  State<SlidingCardsView> createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;
  double? pageOffset = 0;
  final BookController _controller = BookController.to;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.55,
        child: Obx(() {
          int index = -1;
          return PageView(
            controller: pageController,
            children: _controller.list.map((l) {
              index++;
              return InkWell(
                onTap: () {
                  Get.toNamed(ROUTES.book, arguments: l);
                },
                child: BookItem(
                  name: l.name,
                  date: l.startAt.toString(),
                  assetName: 'assets/images/lulu_2.png',
                  offset: (pageOffset ?? 0) - index,
                ),
              );
            }).toList(),
          );
        }));
  }
}