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
        title: 'Perritos Api',
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
        title: Text('Fotos Random de Perritos'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                provider.isLoading
                    ? CircularProgressIndicator()
                    : provider.dogImage != null
                        ? Column(
                            children: [
                              Image.network(provider.dogImage!.imageUrl),
                              SizedBox(height: 20),
                              Text(
                                'Link de la imagen: ${provider.dogImage!.imageLink}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        : Text(
                            '¡Presiona el botón de refresh para ver fotos random de perritos!',
                            textAlign: TextAlign.center,
                          ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    provider.fetchRandomDogImage();
                  },
                  child: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
