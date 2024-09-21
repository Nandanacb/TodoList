import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget{
  const Firstpage({super.key});
  @override
  State<Firstpage> createState()=> _FirstpageState();
  }
class _FirstpageState extends State<Firstpage>{

  TextEditingController _controller=TextEditingController();
  List<String> todoItems=[];

  void _addToDoItem() {
    setState(() {
      if (_controller.text.isNotEmpty){
        todoItems.add(_controller.text);
        _controller.clear();
      }
    });
  }

  void _removeToDoItem(int index){
    setState(() {
      todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),

      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a task'),
                ),
              ),
              IconButton( icon: Icon(Icons.add),
              onPressed: _addToDoItem
              ),
            ],
          ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount:todoItems.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(todoItems[index]),
                  trailing: IconButton(onPressed: (){
                    _removeToDoItem(index);
                  }, icon: Icon(Icons.delete)),
                );
              }),
          )

          
        ],
      ),
    );
  }
  }
