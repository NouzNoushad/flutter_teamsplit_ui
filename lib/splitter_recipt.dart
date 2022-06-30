import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class SplitterReceipt extends StatefulWidget {
  const SplitterReceipt({Key? key}) : super(key: key);

  @override
  State<SplitterReceipt> createState() => _SplitterReceiptState();
}

class _SplitterReceiptState extends State<SplitterReceipt>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _splitAnimationToRight = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.65, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );
  late final Animation<Offset> _splitAnimationToLeft = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-0.65, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 191, 138),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 90,
            margin: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 55, 50, 88),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Receipt",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const DottedLine(
            dashColor: Color.fromARGB(255, 55, 50, 88),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Title",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 50, 88),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Team Dinner",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 50, 88),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Bill",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 50, 88),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ 750.86",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 50, 88),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 72, 66, 109),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: _splitAnimationToRight,
                          child: const CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 17,
                          ),
                        ),
                        SlideTransition(
                          position: _splitAnimationToLeft,
                          child: Transform(
                            transform: Matrix4.translationValues(5, 0, 0),
                            child: const CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 17,
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(-50, 0, 0),
                          child: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Splitting With",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
