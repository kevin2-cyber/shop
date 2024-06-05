import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/service/data_service.dart';


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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DataService dataService = DataService();


  // @override
  // void initState() {
  //   super.initState();
  //   fetchProducts();
  // }

  // void fetchProducts() async {
  //   try {
  //     setState(() {
  //       _productResponse = DataService.getProducts();
  //     });
  //   } catch (error) {
  //     // Handle error (e.g., display error message)
  //     if (kDebugMode) {
  //       print("Error fetching product: <span class=\"$error\">error");
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: dataService.get(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['name']),
                );
              },
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
