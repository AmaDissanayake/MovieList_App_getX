import 'package:get/get.dart';
import 'package:movie_list_app/api/api.dart';
import 'package:movie_list_app/models/movie.dart';

class MovieController extends GetxController {
  var trendingMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;
  var upcomingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingMovies();
    fetchTopRatedMovies();
    fetchUpcomingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    try {
      var movies = await Api().getTrendingMovies();
      trendingMovies.assignAll(movies);
    } catch (e) {
      print('Error fetching trending movies: $e');
    }
  }

  Future<void> fetchTopRatedMovies() async {
    try {
      var movies = await Api().getTopRatedMovies();
      topRatedMovies.assignAll(movies);
    } catch (e) {
      print('Error fetching top-rated movies: $e');
    }
  }

  Future<void> fetchUpcomingMovies() async {
    try {
      var movies = await Api().getUpcomingMovies();
      upcomingMovies.assignAll(movies);
    } catch (e) {
      print('Error fetching upcoming movies: $e');
    }
  }
}
