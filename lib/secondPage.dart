import 'package:flutter/material.dart';
import 'landingPage.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key, required this.title});

  final String title;

  @override
  State<secondPage> createState() => _secondPage();
}

class _secondPage extends State<secondPage> {
  final List<Widget> _tasks = [];

  void _createCard() {
    setState(() {
      _tasks.add(
        Card(
          color: Colors.grey,
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter Task",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _deleteCard(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _createCard();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.black87,
        title: Text("Todo List", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child:
            _tasks.isEmpty
                ? Center(child: Text("No current tasks!"))
                : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Dismissible(key:
                        Key('$index'),
                      onDismissed: (direction){
                      _deleteCard(index);
                      },
                      direction: DismissDirection.startToEnd,
                      child: _tasks[index],
                      );
                  },
                ),
      ),

    );
  }
}

Route _firstRoute() {
  return PageRouteBuilder(
    pageBuilder:
        (context, animation, secondaryAnimation) => const landingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
