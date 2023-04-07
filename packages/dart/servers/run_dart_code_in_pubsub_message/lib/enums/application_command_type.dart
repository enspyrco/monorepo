// Application Command Types
enum ApplicationCommandType {
  // Slash commands; a text-based command that shows up when a user types /
  chatInput(1, 'CHAT_INPUT'),
  // A UI-based command that shows up when you right click or tap on a user
  user(2, 'USER'),
  // A UI-based command that shows up when you right click or tap on a message
  message(3, 'MESSAGE');

  const ApplicationCommandType(this.value, this.name);

  /// [value] is [1,3] and [values] is [0,2] so we subtract 1
  factory ApplicationCommandType.fromJsonValue(int i) =>
      ApplicationCommandType.values[i - 1];

  final int value;
  final String name;
}
