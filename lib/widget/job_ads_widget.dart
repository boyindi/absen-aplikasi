import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobAdsWidget extends StatefulWidget {
  const JobAdsWidget({super.key});

  @override
  _JobAdsWidgetState createState() => _JobAdsWidgetState();
}

class _JobAdsWidgetState extends State<JobAdsWidget> {
  late Future<List<JobAd>> jobAds;

  @override
  void initState() {
    super.initState();
    jobAds = fetchJobAds();
  }

  Future<List<JobAd>> fetchJobAds() async {
    final response = await http
        .get(Uri.parse('https://dummyjsofn.com/products/search?q=phone'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => JobAd.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load job ads');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Advertisements'),
      ),
      body: FutureBuilder<List<JobAd>>(
        future: jobAds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load job ads'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No job ads available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class JobAd {
  final String title;
  final String description;

  JobAd({required this.title, required this.description});

  factory JobAd.fromJson(Map<String, dynamic> json) {
    return JobAd(
      title: json['title'],
      description: json['description'],
    );
  }
}
