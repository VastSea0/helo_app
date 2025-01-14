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
  final storage = LocalStorage('todo_app.json');
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  Future<void> _loadList() async {
    await storage.ready;
    setState(() {
      list = storage.getItem('todos') ??
          [
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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Awesome to-do list app on flutter',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Text('${list.length}',
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter item',
                      labelStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Label rengini tema ile eşleştir
                      ),
                      hintText: 'Type something...',
                      hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary, // İpucu yazı rengini tema ile eşleştir
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // Odaklanınca kenar rengi
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // TextField içine yazılan metin rengi
                    ),
                    onSubmitted: (String value) {
                      _incrementCounter();
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[Divider()],
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
