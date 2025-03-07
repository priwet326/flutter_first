import 'package:flutter/material.dart';

const String nameApp = 'Первый проектик Алхасов 23т';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // этот класс не меняется со временем тк наследуется именно так
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nameApp, // название приложения
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // цветовая тема приложения
      ),
      home: const MyHomePage(title: nameApp), // как я понял стартовая страница
    );
  }
}

class MyHomePage extends StatefulWidget { // изменяющаяся страница тк наследуется именно так
  const MyHomePage({super.key, required this.title});

  final String title; // константа которую можно инициализировать посреди работы

  @override // это говорит что дальше переопределяется родительский метод
  State<MyHomePage> createState() => _MyHomePageState(); //здесь пееропределяется метод создания состояния домашней страницыи возвращается экземляр класса тк это конструктор
}

class _MyHomePageState extends State<MyHomePage> { // класс в котором происходит обновление страницы и все действия на домашней странице, кстати он собирается управлять домашней страницей судя по наследованию
  int _counter = 0;

  void _incrementCounter() { // ничего интересного прото метод для увеличения переменной
    setState(() {// эта штука так важна капец, ну в общем она обновляет страницу MyHomePage. но в синтаксисе ещё предстоит разбираться
      _counter += 2;
    });
  }

  @override // опять что-то хотят переопределить
  Widget build(BuildContext context) { // собирает виджет а context это инструкция которая сообщает где его делать с учетом темы, размера экрана и тд
    return Scaffold( // один из стандартных виджетов в котором ещё другие есть и их можно использовать, так сказать набор виджетов

      /*appBar: AppBar( //верхняя панелька с названием
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // цвет фона панельки
        title: Text(widget.title), // текст панельки
      ), */

      body: Center( // виджет в данном случае вбирающий в себя другие виджеты и центрующий их
        child: Column( // дочерний объект ОН ЗДЕСЬ ОДИН но вбирает другие объекты
          mainAxisAlignment: MainAxisAlignment.center, // выравнивание по вертикали
          children: <Widget>[ //ого да этоже массив или лист дочерних виджетов
            const Text('тыкни на кнопку и всё изменится'), // дочь 1
            Text( // дочь 2
              '$_counter',// это форматирование строки с помощью доллара
              style: Theme.of(context).textTheme.headlineMedium, //задание стиля текста
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( // наконец кнопка по которой можно жмякать
        onPressed: _incrementCounter, // по нажатию
        tooltip: 'НАЖМИ НА МЕНЯ', // текстик который появляется если зажать
        child: const Icon(Icons.add), // даже у кнопки есть ребёнок а точнее иконка плюсика в данном случае
      ),
    );
  }
}
