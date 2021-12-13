import 'package:flutter/material.dart';

import '../../../types.dart';
import '../../../widgets.dart';
import '../../auth/link-providers/widgets/link_providers_view.dart';

class ProfilePage<T extends RedFireState> extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: LinkProvidersView<T>(),
    );
  }
}

// Old Profile Page, assumes a Profile model is stored in DB, not sure if we want that? 
// StoreConnector<T, ProfileData?>(
//         onInit: (store) => store.dispatch(TapProfileAction()),
//         onDispose: (store) => store.dispatch(TapProfileAction(turnOff: true)),
//         distinct: true,
//         converter: (store) => store.state.profile,
//         builder: (context, profileData) {
//           return Center(
//               child: Column(
//             children: [
//               if (profileData == null)
//                 const WaitingIndicator('Connecting to database...')
//               else ...[
//                 Text(
//                     profileData.displayName ?? 'they who have yet to be named'),
//                 Row(
//                   children: [
//                     if (profileData.authorizationStatus[ProvidersEnum.google] ==
//                         AuthorizationEnum.gettingAuthorized)
//                       const CircularProgressIndicator()
//                     else
//                       GoogleAuthorizationButton(
//                           step: profileData
//                                   .authorizationStatus[ProvidersEnum.google] ??
//                               AuthorizationEnum.unknown),
//                     if (profileData.authorizationStatus[ProvidersEnum.asana] ==
//                         AuthorizationEnum.gettingAuthorized)
//                       const CircularProgressIndicator()
//                     else
//                       AsanaAuthorizationButton(
//                           step: profileData
//                                   .authorizationStatus[ProvidersEnum.asana] ??
//                               AuthorizationEnum.unknown)
//                   ],
//                 ),
//               ],
//             ],
//           ));
//         },
//       ),
