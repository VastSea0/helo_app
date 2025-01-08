import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.title});
  final String title;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> list = [];
  final storage =  LocalStorage('todo_app.json');
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  void _loadList() async {
    await storage.ready;
    setState(() {
      list = storage.getItem('todos') ?? [
        "Helo!",
      ];
      initialized = true;
    });
  }

  void _saveList() {
    storage.setItem('todos', list);
  }

  void _incrementCounter() {
    setState(() {
      if (_controller.text == "") {
        _controller.text = "This field cant be empty";
      } else {
        list.add(_controller.text);
        _controller.text = "";
        _saveList();
      }
    });
  } 

  void deleteItemFromList(int index) {
    setState(() {
      list.removeAt(index);
      _saveList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Awesome to-do list app on flutter'),
            Text('${list.length}',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter item',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[Divider(color: Colors.black)],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: OutlinedButton(
                          onPressed: () {
                            deleteItemFromList(index);
                          },
                          child: const Icon(Icons.delete),
                        ),
                        title: Text(list[index]),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
