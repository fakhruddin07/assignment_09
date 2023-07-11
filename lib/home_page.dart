import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = "";
  String weatherDescription = "";
  String temperature = "";
  String weatherImage = "";
  late int timeOut;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    weatherGetRequest("Dhaka");
    setState(() {});
  }

  Future<void> weatherGetRequest(String place) async {
    isLoading = true;
    if (mounted) {
      setState(() {});
    }

    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$place&appid=f807d5cd9805a3bf5e96334b30da6c88&units=metric");

    Response response = await get(url);

    final decodedResponse = jsonDecode(response.body);
    final description = decodedResponse["weather"][0];
    final temp = decodedResponse["main"];

    if (response.statusCode == 200) {
      weatherDescription = description["description"];
      location = decodedResponse["name"];
      timeOut = decodedResponse["timezone"];
      temperature = temp["temp"].toString();
      weatherImage = description["icon"];
    } else {
      throw Exception("Error fetching weather data");
    }

    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weather"),
        elevation: .6,
        backgroundColor: const Color(0xFF873bcc),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff450185),
                  Color(0xFF873bcc),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(location,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 20),

                  // Text("Updated: $timeOut"),
                  Text(
                    "Updated: ${DateFormat.jm().format(DateTime.now())}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        "http://openweathermap.org/img/w/$weatherImage.png",
                        fit: BoxFit.fill,
                        height: 100,
                        errorBuilder: (_, __, ___) {
                          return const Icon(
                            Icons.cloud,
                            size: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                      Text("$temperature°C",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(weatherDescription,
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
    );
  }
}
