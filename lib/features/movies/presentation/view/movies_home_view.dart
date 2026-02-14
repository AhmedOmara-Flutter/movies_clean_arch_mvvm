import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class MoviesHomeView extends StatelessWidget {
  const MoviesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesCubit(NowPlayingUseCase(RepositoryImpl(RemoteDataSourceImpl())))
            ..getNowPlayingMovies(),
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {
          if (state is NowPlayingMoviesLoadedError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = MoviesCubit.get(context);

          if (state is NowPlayingMoviesLoadedLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NowPlayingMoviesLoadedError) {
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
                CustomListView(movie: cubit.nowPlayingMovies),
                CustomHorizontalText(text: 'Top Rated'),
                CustomListView(movie: cubit.nowPlayingMovies),
                SizedBox(width: FontSizeManager.s15),
              ],
            ),
          );
        },
      ),
    );
  }
}
