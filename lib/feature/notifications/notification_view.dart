import 'package:flutter/material.dart';
import 'package:insights_news/core/app_colors.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Your Source'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200,
              // childAspectRatio: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const SourceDetailsView(source: 'cnn'),
                // ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.containerBG,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text('data'),
              ),
            );
          },
        ),
      ),
    );
  }
}
