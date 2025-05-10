import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Алхасов Арсен 23т',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин электроники АШАН'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          ProductCard(
            name: 'Смартфон Premium X',
            price: 799,
            imageAsset: 'assets/phone.jpg', // Локальное изображение
            networkImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.4Cc9HwVukXlLcChgCSW8tgHaGQ%26pid%3DApi&f=1&ipt=0dbed28b92b7e60811a609e51d359b21bcbe608b58d2036b5c6eaf184ee7d113&ipo=images', // Сетевой URL
            description: 'Флагманский смартфон с лучшей защитой от грабителей',
          ),
          ProductCard(
            name: 'Ноутбук Pro 15',
            price: 1299,
            imageAsset: 'assets/laptop.jpg',
            networkImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmacnoob.ru%2Fwp-content%2Fuploads%2F2023%2F02%2F2023-02-07_22-05-14.jpg&f=1&nofb=1&ipt=5746a0f551d1a53b01f5ec3663dedae60451b1758c9df8d9354bad654e9c8771',
            description: 'Мощный ноутбук для работы и творчества, для любителей линукса',
          ),
          CounterWidget(title: 'Количество товаров в корзине'),
          ProductCard(
            name: 'Наушники Elite',
            price: 299,
            imageAsset: 'assets/HF.jpeg',
            networkImage: '',
            description: 'Проводные наушники с шумоподавлением и сигналоподавлением(поставляется без провода)',
          ),
        ],
      ),
    );
  }
}

// StatelessWidget - карточка товара
class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageAsset;
  final String networkImage;
  final String description;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageAsset,
    required this.networkImage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Используем локальное изображение с fallback на сетевое
          Image.asset(
            imageAsset,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
              networkImage,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// StatefulWidget - счетчик
class CounterWidget extends StatefulWidget {
  final String title;

  const CounterWidget({super.key, required this.title});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrementCounter,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _incrementCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }
}