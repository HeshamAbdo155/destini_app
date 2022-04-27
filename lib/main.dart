import 'package:destini_app/brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

Brain braain = Brain();

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPage createState() => _StoryPage();
}

class _StoryPage extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      braain.getStory(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      setState(() {
                        braain.nextStory(1);
                      });
                    },
                    child: Text(
                      braain.getChoice1(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Visibility(
                    visible: braain.buttonShouldBeVisible(),
                    child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          braain.nextStory(2);
                        });
                      },
                      child: Text(
                        braain.getChoice2(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
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
    );
  }
}
