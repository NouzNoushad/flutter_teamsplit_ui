import 'package:flutter/material.dart';
import 'package:team_dinner_ui/split_slider.dart';
import 'package:team_dinner_ui/splitter_recipt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.6, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 66, 109),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appBarDesign(),
            const SplitterReceipt(),
            const TeamSplitSlider(),
            confirmButton(),
          ],
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 55, 50, 88),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(60),
          right: Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlideTransition(
            position: _animation,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                primary: const Color.fromARGB(255, 72, 66, 109),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(60),
                    right: Radius.circular(60),
                  ),
                ),
              ),
              child: const Text(
                "Confirm Split",
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 191, 138),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const Icon(
            Icons.fast_forward_rounded,
            size: 35,
            color: Color.fromARGB(255, 72, 66, 109),
          ),
        ],
      ),
    );
  }

  Widget appBarDesign() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 55, 50, 88),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 235, 191, 138),
            size: 20,
          ),
        ),
        Row(
          children: [
            const Text(
              "Split Now",
              style: TextStyle(
                color: Color.fromARGB(255, 235, 191, 138),
                fontSize: 22,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromARGB(255, 235, 191, 138),
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
