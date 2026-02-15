import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class MoviesHomeView extends StatelessWidget {
  const MoviesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesCubit(
              instance<NowPlayingUseCase>(),
              instance<UpComingUseCase>(),
              instance<TopRatedUseCase>(),
            )
            ..getNowPlayingMovies()
            ..getUpComingMovies()
            ..getTopRatedMovies(),
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {
          if (state is MoviesLoadedError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = MoviesCubit.get(context);

          if (state is MoviesLoadedLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MoviesLoadedError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text(state.message, textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      cubit.getNowPlayingMovies();
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              spacing: FontSizeManager.s10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSliderCarousal(movie: cubit.nowPlayingMovies),
                CustomHorizontalText(text: 'Now Playing'),
                CustomListView(movie: cubit.upComingMovies),
                CustomHorizontalText(text: 'Top Rated'),
                CustomListView(movie: cubit.topRatedMovies),
                SizedBox(width: FontSizeManager.s15),
              ],
            ),
          );
        },
      ),
    );
  }
}
