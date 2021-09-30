class DialogWindow {}

// class AccountButton extends StatelessWidget {
//   const AccountButton({
//     required String? photoUrl,
//     Key? key,
//   })  : _photoUrl = photoUrl,
//         super(key: key);

//   final String? _photoUrl;
//   final _overlayEntry =
//       OverlayEntry(builder: (context) => const FloatingMenu());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ProfileAvatar(_photoUrl, onPressed: () {
//         Overlay.of(context)?.insert();
//         // context.dispatch(NavigateToProfileAction());
//       }),
//     );
//   }
// }

// class FloatingMenu extends StatelessWidget {
//   const FloatingMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 10,
//       top: 10,
//       child: SizedBox(
//         width: 150,
//         child: Material(
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               MaterialButton(
//                   onPressed: () => context.dispatch<AppState>(SignOutAction()),
//                   child: const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text('Sign Out'))),
//               MaterialButton(
//                 onPressed: () {},
//                 child: const Align(
//                     alignment: Alignment.centerLeft, child: Text('Cancel')),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
