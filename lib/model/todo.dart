class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });


  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Make a To do List App with flutter', isDone: true),
      ToDo(id: '02', todoText: 'Study Python', isDone: true),
      ToDo(id: '03', todoText: 'Buy Groceries in Lee',),
      ToDo(id: '04', todoText: 'Make a website',),
      ToDo(id: '05', todoText: 'Pay 3900 to BPI',),
      ToDo(id: '06', todoText: 'Make wireframe in Figma',),

    ];
  }
}