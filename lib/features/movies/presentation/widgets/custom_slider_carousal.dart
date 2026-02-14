import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class CustomSliderCarousal extends StatelessWidget {
  const CustomSliderCarousal({super.key, required this.movie});

  final List<Movie> movie;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movie.map((movie) => _buildCarouselImage(movie)).toList(),
      options: CarouselOptions(
        height: FontSizeManager.s500,
        enlargeCenterPage: false,
        enlargeFactor: FontSizeManager.s0_25,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: Constants.carousalAutoPlayInterval,
        ),
        autoPlayAnimationDuration: const Duration(
          milliseconds: Constants.carousalAutoPlayAnimation,
        ),
        viewportFraction: 1,
        aspectRatio: 16 / 9,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildCarouselImage(Movie movie) {
    return Stack(
      children: [
        Image.network(
          '${Constants.imageUrl}${movie.poster}',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorManager.baseColor,
                ColorManager.baseColor.withOpacity(0.1),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
