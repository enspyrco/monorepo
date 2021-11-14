import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _markdownData = '''
 # Minimal Markdown Test
 ---
 This is a simple Markdown test. Provide a text string with Markdown tags
 to the Markdown widget and it will display the formatted output in a
 scrollable widget.

 ## Section 1
 Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
 aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
 eget est condimentum, vitae porttitor diam ornare.

 ### Subsection A
 Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae
 venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend
 accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi
 ornare, in ullamcorper magna congue.
 ''';

class TaskDescriptionView extends StatelessWidget {
  const TaskDescriptionView({required List<String> lines, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Markdown(data: _markdownData));
  }
}
