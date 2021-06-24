const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

const firestore = admin.firestore();
const settings = { timestampsInSnapshots: true };
firestore.settings(settings);

//For setup/creation of the user accounts...we can do this client side also, but that means more data usage / computation
//from the client...instead offloading this work to server side...

exports.createUserAccount = functions.auth.user().onCreate(event => {
    console.log('User id to be created..', event.uid);

    const userID = event.uid;
    const email = event.email;
    const photoURL = event.photoURL;
    const name = event.displayName;

    return firestore.collection('users').doc(`${userID}`).set({
        email: email,
        photoURL: photoURL,
        name: name
    }).then(function () {
        console.log("Created user... ", userID);
    }).catch(error => {
        console.error("Error while creating ", error);
    });
});

exports.deleteUserAccount = functions.auth.user().onDelete(event => {
    console.log('User id to be deleted..', event.uid);
    const userID = event.uid;

    return firestore.doc(`users/${userID}`).delete()
        .then(function () {
            console.log("Deleted user... ", userID);
        }).catch(error => {
            console.error("Error while deleting ", error);
        });
});

//This is for a particular collection/document...returns document snapshot
exports.whenLikeClicked = functions.https.onRequest((req, resp) => {
    const flutterCollPromise = admin.firestore().doc('flutter/actionSheet').get();

    flutterCollPromise.then(snapshot => {
        const data = snapshot.data();
        resp.send(data);

        console.log('Data is ', snapshot.data());
    }).catch(error => {
        console.error('Something is not right 🐞🐞🐞🐞', error);
        resp.status(500).send(error);
    });
});

//test before deploy --- running locally
//sudo firebase serve --only functions

//For all the collections...returns query snapshot
exports.whenLikeClickedAll = functions.https.onRequest((req, resp) => {
    const flutterCollPromise = admin.firestore().collection('flutter').get();

    flutterCollPromise.then(querySnapshot => {

        querySnapshot.forEach(function (qDoc) {
            console.log('Data is ', qDoc.data());
        });

        resp.send('In progress');

        // console.log('Data is ', querySnapshot.data());
    }).catch(error => {
        console.error('Something is not right 🐞🐞🐞🐞', error);
        resp.status(500).send(error);
    });
});

//For sending trigger whenever there is an update
exports.likeUpdated = functions.firestore.document('flutter/actionSheet').onUpdate(change => {
    //This after has the document snapshot of the data updated after....
    const after = change.after.data();

    //build fcm payload....fcm requires everything to be string...
    const payload = {
        data: {
            like: String(after.like),
            name: String(after.name),
            timeStamp: String(after.date),
            dislike: String(after.dislike)
        }
    };

    console.log('🎉🎉🎉 Update event triggered : ', payload);

    //send the payload
    return admin.messaging().sendToTopic('like_actionsheet_updated', payload)
        .then(function (response) {
            console.log("🎉🎉🎉 Successfully sent payload:", response);
        })
        .catch(error => {
            console.error('FCM failed 🐞🐞🐞🐞', error);
        });
    // return admin.messaging().sendToTopic('like_actionsheet_updated', payload).catch(error => {
    //     console.error('FCM failed 🐞🐞🐞🐞', error);
    // });
});

//For getting collection based on other collection
//the line in for loop gives each time a diff promise....
exports.favPages = functions.https.onRequest((req, resp) => {
    const favPromise = admin.firestore().doc('favorites/favPages').get();

    favPromise.then(docSnapshot => {
        const pages = docSnapshot.data().pages;
        const promisesAll = [];

        for (const page in pages) {
            const p = admin.firestore().doc(`flutter/${page}`).get();
            promisesAll.push(p);

            console.log('ℹ️ ℹ️ ℹ️ Paths retrieved : ', `flutter/${page}`)
        }

        //Wait for all the promises and send using Promise.all -> it also returns a new promise
        // const sumPromise = Promise.all(promisesAll); //or

        //Using this returns another promise and we can add another then to the main then below...
        return Promise.all(promisesAll);

        console.log('Data is ', docSnapshot.data());
    }).then(pagesSnapshots => {
        const results = [];
        pagesSnapshots.forEach(pSnap => {
            const data = pSnap.data();

            data.id = pSnap.id; //inserted id here.....
            results.push(data);
        });

        //Finally send the data...
        resp.send(results);

    }).catch(error => {
        console.error('Something is not right 🐞🐞🐞🐞', error);
        resp.status(500).send(error);
    });
});