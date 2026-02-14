import 'package:movies_clean_arch_mvvm/core/app_imports.dart';


class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FontSizeManager.s150,
      width: FontSizeManager.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FontSizeManager.s20),
        image: DecorationImage(
          image: NetworkImage('${Constants.imageUrl}${movie.poster}'),
        ),
      ),
    );
  }
}
