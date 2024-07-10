import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Dog Image Demo',
        home: DogImageScreen(),
      ),
    );
  }
}

class DogImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Imágenes Random de Perritos'),
      ),
      body: Center(
        child: provider.isLoading
            ? CircularProgressIndicator()
            : provider.dogImage != null
                ? Image.network(provider.dogImage!.imageUrl)
                : Text('¡Presiona el botón de refresh para ver perritos!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.fetchRandomDogImage();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
