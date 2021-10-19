import 'package:flutter/material.dart';
import 'package:the_process/home/widgets/app_account_button.dart';
import 'package:the_process/organisations/widgets/organisation_selector_view.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [AppAccountButton()],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              OrganisationSelectorView(),
            ],
          ),
          const ProjectsGridView()
        ],
      ),
    );
  }
}
