import { auth } from 'firebase-admin';
import { FirebaseAdmin } from '../../services/firebase_admin';

export async function saveDetails(user : auth.UserRecord) : Promise<void> {

    const db = FirebaseAdmin.getInstance().getFirestore();

    // add all auth data to the profile doc
    await db.doc('/profiles/'+user.uid).set({
        displayName: user.displayName ?? null,
        email: user.email ?? null,
        photoURL: user.photoURL ?? null,
        authorizationStatus: {
            google: 'waitingForInput',
            asana: 'waitingForInput',
        },
    });
}
