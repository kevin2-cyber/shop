import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/service/data_service.dart';

import 'model/product.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // device orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Shopping());
}

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      home: Container(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Product> _productResponse;

  void fetchProducts() async {
    try {
      setState(() {
        _productResponse = DataService.getProducts();
      });
    } catch (error) {
      // Handle error (e.g., display error message)
      if (kDebugMode) {
        print("Error fetching product: <span class=\"$error\">error");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
      ),
      body: FutureBuilder<Product>(
        future: _productResponse,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: const Color(0xFFEBEBEB),
                child: Column(
                  children: [
                    Text(
                        snapshot.data!.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                        '${snapshot.data!.quantity}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                        '${snapshot.data!.unitPrice}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'No data received',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}

