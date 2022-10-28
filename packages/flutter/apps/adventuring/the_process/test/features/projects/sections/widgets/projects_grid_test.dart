import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/projects/models/project_state.dart';
import 'package:the_process/projects/widgets/grid-view/new_project_item.dart';
import 'package:the_process/projects/widgets/grid-view/project_item.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid.dart';

void main() {
  testWidgets('Lays out ProjectItem widgets & NewProjectItem', (tester) async {
    var projectA = ProjectState.initWith(name: 'a');
    var projectB = ProjectState.initWith(name: 'b');
    var projectC = ProjectState.initWith(name: 'c');
    AppState initialState = AppState.initial.copyWith
        .projects(all: ISet([projectA, projectB, projectC]));

    final harness = WidgetTestHarness<AppState>.withFakeStore(
        initialState: initialState, widgetUnderTest: const ProjectsGrid());

    await tester.pumpWidget(harness.widget);

    // expect(harness.state.projects.all, ISet([projectA, projectB, projectC]));

    // Check the 3 Projects in the AppState have become ProjectItem widgets
    expect(find.byType(ProjectItem), findsNWidgets(3));
    // Check the NewProjectItem widget has been laid out
    expect(find.byType(NewProjectItem), findsOneWidget);

    expect(find.widgetWithText(ProjectItem, 'a'), findsOneWidget);
  });
}
