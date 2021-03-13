import * as admin from 'firebase-admin';
const db = admin.firestore();

export async function saveDetails(user : admin.auth.UserRecord) {
    // add all auth data to the user doc 
    await db.doc('/users/'+user.uid).set({
        displayName: user.displayName ?? null,
        email: user.email ?? null,
        photoURL: user.photoURL ?? null, 
        phoneNumber: user.phoneNumber ?? null,
        providerData: user.providerData.map(info => ({
            displayName: info.displayName ?? null,
            email: info.email ?? null,
            phoneNumber: info.phoneNumber ?? null,
            photoURL: info.photoURL ?? null,
            providerId: info.providerId,
            uid: info.uid
        }))
    });
}


