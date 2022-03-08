import 'package:flutter/material.dart';

Color color = const Color.fromARGB(255, 209, 90, 10);

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mohamed Hassan"),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 146, 214, 253),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 146, 214, 253),
              Color.fromARGB(255, 242, 254, 255)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) => const CurveItem(
                            text1: "العلم المهتم بالتأسيس",
                            text2: "العلم المهتم بالتأسيس",
                          ))),
            ],
          ),
        ));
  }
}

class CurveItem extends StatelessWidget {
  const CurveItem({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: color, width: 4)),
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 104, left: 64),
                  child: WhiteContainer(
                    text: text1,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 104,
                  right: 64,
                ),
                child: WhiteContainer(text: text2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 55,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3))
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 3,
                color: color,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(text)
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 12.5),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12.5)),
            child: const Icon(
              Icons.done_rounded,
              color: Colors.white,
              size: 24,
            ))
      ],
    );
  }
}
