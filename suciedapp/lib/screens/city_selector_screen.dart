import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CitySelectorScreen extends StatefulWidget {
  const CitySelectorScreen({super.key});

  @override
  State<CitySelectorScreen> createState() => _CitySelectorScreenState();
}

class _CitySelectorScreenState extends State<CitySelectorScreen> {
  List<String> allCities = [];
  List<String> filteredCities = [];
  String? selectedCity;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadCityList();
  }

Future<void> loadCityList() async {
  try {
    final String jsonString = await rootBundle.loadString('lib/utils/municipios.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<String> nombres = jsonList.map((element) => element["nombre"] as String).toList();

    setState(() {
      allCities = nombres;
      filteredCities = nombres;
    });

  } catch (e) {
    print("❌ Error cargando el JSON: $e");
  }
}


  void filterCities(String query) {
    setState(() {
      filteredCities = allCities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void confirmSelection() {
    if (selectedCity != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Municipio seleccionado: $selectedCity")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, selecciona un municipio")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfaf9f3),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const SizedBox(height: 100),

            const Text(
                "Selecciona tu municipio",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 42,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF10182b),
                ),
            ),

            const SizedBox(height: 36),

            TextField(
              onChanged: filterCities,
              decoration: const InputDecoration(
                labelText: "Buscar municipio",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(
              height: 400,
              child: filteredCities.isEmpty
                  ? const Center(child: Text("No se encontraron resultados"))
                  : ListView.builder(
                      itemCount: filteredCities.length,
                      itemBuilder: (context, index) {
                        final city = filteredCities[index];
                        final isSelected = city == selectedCity;
                        return ListTile(
                          title: Text(city),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle, color: Colors.green)
                              : null,
                          onTap: () {
                            setState(() {
                              selectedCity = city;
                            });
                          },
                        );
                      },
                    ),
            ),

            const SizedBox(height: 32),

            ElevatedButton(
                onPressed: confirmSelection,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 16),
                  backgroundColor: selectedCity == null ? Color(0xFFC3C5C4) : Color(0xFF00af75),
                ),
                child: const Text(
                  "Empezar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
