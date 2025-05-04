import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      appBar: _buildAppBar(),
      body: Stack(
        children:[ 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:50, bottom: 50),
                        child: Text('Do It NOW!', 
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w500,
                          ),
                          ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                      ToDoItem(todo: todo,
                      onToDoChanged:  _handleToDoChange,
                      onDeleteitem: _deleteToDoItem,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: 
              Container(margin: EdgeInsets.only(bottom: 20, 
              right: 20,
              left: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: 
              BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(
                color: Colors.grey, 
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
                ),],
                borderRadius: BorderRadius.circular(10),
              ),
               child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Add new',
                  border: InputBorder.none
                ),
              ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 40, color: Colors.white),),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

    void _handleToDoChange(ToDo todo) {
    setState(() {
    todo.isDone = !todo.isDone;
    });
  }


    void _deleteToDoItem(String id) {
      setState (() {
        todosList.removeWhere((item) => item.id == id);
      });

    }

    void _addToDoItem(String toDo){
      setState(() {
        
      
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo)); 

      });
      _todoController.clear(); 

    }

    void _runFilter(String enteredKeyword) {
      List<ToDo> results = [];
      if( enteredKeyword.isEmpty) {
        results = todosList;
      }else {
        results = todosList
        .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
        .toList();
      }
      setState(() {
        _foundToDo = results; 
      });
    }

    





  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: tdWhite,
        borderRadius: BorderRadius.circular(20),
        ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon
        (Icons.search, 
        color: tdBlack, 
        size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25
        ),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _buildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      elevation: 0,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: tdBlack, size: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/logo.png', height: 50, width: 50
                ),
              ),
            ],
          ),
          Image.asset('assets/images/a.png',
          height: 60,
          width: 100,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
