# Firebase Config

[<< README]

1. Get a private key from your project's Firebase console:

<img width="1122" alt="Screen Shot 2022-01-12 at 10 52 30 pm" src="https://user-images.githubusercontent.com/1059276/149256026-a899be23-01e1-4fad-bbbc-5ebb6b2ef0df.png">

2. Open the downloaded .json file in a text editor and copy the file contents to the clipboard

3. [Create a secret] with FIREBASE_SERVICE_ACCOUNT for the `name` and paste the clipboard into the `value` section.

[<< README]: ../README.md
[Create a secret]: https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository
