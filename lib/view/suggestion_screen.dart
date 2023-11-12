import 'package:flutter/material.dart';
import 'package:rtc_app/constants/card_submit.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/models/news_model.dart';
import '../constants/card_information.dart';
import '../constants/card_view.dart';
import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';
import '../repo/news_repository.dart';
import '../view-model/news_view_model.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({Key? key, required this.user}) : super(key: key);
  final LoginModel user;

  @override
  SuggestionScreenState createState() => SuggestionScreenState();
}

class SuggestionScreenState extends State<SuggestionScreen>
    with SingleTickerProviderStateMixin {
  NewsViewModel newsViewModel = NewsViewModel();
  NewsRepository api = NewsRepository();
  String namePage = "Suggestion";
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(user: widget.user),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: 'Information'),
              Tab(text: 'View'),
              Tab(text: 'Submit'),
            ],
            onTap: (index) {},
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const MyCard(),
                Center(
                  child: FutureBuilder<List<NewsModel>>(
                    future: api.getSuggestionCards(widget.user.hRID!),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error occurred while fetching data.'),
                        );
                      } else {
                        final model = snapshot.data!;
                        return ListView.builder(
                            itemCount: model.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CardItem(
                                model: model,
                                index: index,
                                namePage: namePage,
                                liked: false,
                                comment: true,
                                seeMoreBool: false,
                              );
                            });
                      }
                    },
                  ),
                ),
                const SubmitCard(
                  isSubmitCV: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
