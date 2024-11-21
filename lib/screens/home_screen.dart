import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_list_app/models/movie_controller.dart';
import 'package:movie_list_app/widgets/movies_slider.dart';
import 'package:movie_list_app/widgets/trending_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieController = Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/cinevault.png',
          fit: BoxFit.cover,
          height: 55,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (movieController.trendingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return TrendingSlider(
                  snapshot: movieController.trendingMovies,
                );
              }),
              const SizedBox(height: 20),
              Text(
                'Top Rated Movies',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (movieController.topRatedMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return MoviesSlider(
                  snapshot: movieController.topRatedMovies,
                );
              }),
              const SizedBox(height: 20),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (movieController.upcomingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return MoviesSlider(
                  snapshot: movieController.upcomingMovies,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
