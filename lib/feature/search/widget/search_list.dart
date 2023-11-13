import 'package:flutter/material.dart';
import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/core/news_model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchListViewWidget extends StatelessWidget {
  const SearchListViewWidget({
    super.key,
    required this.model,
  });
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = model.articles![index];
            return GestureDetector(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(data.url!))) {
                  await launchUrl(Uri.parse(data.url!));
                } else {
                  throw 'Could not launch';
                }
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.containerBG,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        data.urlToImage ?? '',
                        width: 160,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                              width: 160,
                              height: 100,
                              child: Icon(
                                Icons.error,
                              ));
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            data.title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.white),
                          ),
                          Text(
                            data.author ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.grey),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/read.png'),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Read',
                                style: TextStyle(color: AppColors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: model.articles!.length),
    );
  }
}
