import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldHome(),
    );
  }
}

class ScaffoldHome extends StatelessWidget {
  const ScaffoldHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calcula Gorjetas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade50,
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late double _resultado;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _resultado = 0;
    _textEditingController = TextEditingController();
    super.initState();
  }

  void calcula() {
    setState(() {
      _resultado = double.parse(_textEditingController.value.text) * 1.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('images/jarra-de-gorjeta.png'),
              ),
              border: Border.all(width: 2, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _textEditingController,
              onChanged: (value) => calcula(),
              decoration: InputDecoration(

                hintText: "Digite o valor da conta",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.monetization_on_outlined),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          /*
          ElevatedButton(
            onPressed: () => calcula(),
            style: ElevatedButton.styleFrom(
                elevation: 5.0, backgroundColor: Colors.grey.shade600),
            child: Text(
              "Calcular",
              style: TextStyle(color: Colors.white),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "R\$ ${_resultado.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
