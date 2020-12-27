import { firebaseAdmin } from '../../utils/firebase_admin';
import * as admin from 'firebase-admin';

const db = firebaseAdmin.getFirestore();

export async function saveDetails(user : admin.auth.UserRecord) : Promise<void> {
    // add all auth data to the profile doc
    await db.doc('/profiles/'+user.uid).set({
        displayName: user.displayName ?? null,
        email: user.email ?? null,
        photoURL: user.photoURL ?? null,
        googleAuth: 'waitingForInput',
    });
}
