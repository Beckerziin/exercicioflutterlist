import 'package:exercicioflutterlist/produto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produtos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListaProdutosTela(),
    );
  }
}

class ListaProdutosTela extends StatelessWidget {
  const ListaProdutosTela({super.key});

  final List<Produto> produtos = const [
    Produto(
      nome: 'Caneca',
      preco: 30.00,
      imagemProdutoUrl: 'https://picsum.photos/id/30/200/200',
    ),
    Produto(
      nome: 'Notebook',
      preco: 1500.00,
      imagemProdutoUrl: 'https://picsum.photos/id/6/200/200',
    ),
    Produto(
      nome: 'Café Torrado 500g',
      preco: 85.00,
      imagemProdutoUrl: 'https://picsum.photos/id/425/200/200',
    ),
    Produto(
      nome: 'Bandeira EUA',
      preco: 60.00,
      imagemProdutoUrl: 'https://picsum.photos/id/580/200/200',
    ),
    Produto(
      nome: 'Kindle',
      preco: 85.00,
      imagemProdutoUrl: 'https://picsum.photos/id/367/200/200',
    ),
  ];

  void _mostrarDetalhesProduto(BuildContext context, Produto produto) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  produto.imagemProdutoUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                produto.nome,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(produto.imagemProdutoUrl),
            ),
            title: Text(produto.nome),
            subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
            onTap: () => _mostrarDetalhesProduto(context, produto),
          );
        },
      ),
    );
  }
}
