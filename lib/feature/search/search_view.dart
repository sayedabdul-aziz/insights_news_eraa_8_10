import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/feature/news/cubit/news_cubit.dart';
import 'package:insights_news/feature/search/widget/search_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Search News'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        context.read<NewsCubit>().getSearch(value);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.sacffoldBG,
                          ),
                          hintText: 'Search for news',
                          fillColor: AppColors.grey,
                          filled: true),
                    ),
                    BlocBuilder<NewsCubit, NewsState>(
                      builder: (context, state) {
                        if (state is SearchSuccessState) {
                          return Expanded(
                              child: SearchListViewWidget(
                            model: state.model,
                          ));
                        } else if (state is SearchErrorState) {
                          return Text(state.error);
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            color: AppColors.lomanda,
                          ));
                        }
                      },
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
