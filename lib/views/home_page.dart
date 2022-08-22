import 'package:flutter/material.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/dimension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'News 24',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<News?>(
          valueListenable: NewsC.newsList,
          builder: (_, value, __) {
            if (value == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        // bottom: 65,
                        top: 20,
                        right: 10,
                        left: 24,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: screenWidth / 3.25,
                            width: 137,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              image: DecorationImage(
                                image: NetworkImage(
                                    value.articles![index].urlToImage!),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${value.articles![index].title}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      "By ${value.articles![index].author}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: const [
                                        Text(
                                          "World",
                                          style: TextStyle(
                                              color: Color(0xFF69BDFD)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }),
    );
  }
}
