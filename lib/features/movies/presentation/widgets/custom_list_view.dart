import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.movie});
final List<Movie> movie;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: FontSizeManager.s150,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: FontSizeManager.s10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CustomMovieCard(movie: movie[index]),
        separatorBuilder: (context, index) =>
            SizedBox(width: FontSizeManager.s10),
        itemCount: movie.length,
      ),
    );
  }
}
