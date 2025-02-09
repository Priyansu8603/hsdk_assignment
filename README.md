# Adhicine - Tracking Of Medicine Routines

Adhicine is a Flutter-based application designed to help users track and manage their medicine intake efficiently. The app utilizes Firebase for authentication, database management, and notifications to enhance the user experience.

## Features

- **User Authentication**: Implemented using Firebase Authentication (Google Sign-In).
- **Medicine Tracking**: Users can log their medicines and get reminders.
- **Firestore Database**: All user data is securely stored in Firebase Firestore.
- **Push Notifications**: Firebase Cloud Messaging (FCM) is used to send reminders.
- **MVVM Architecture**: Ensures clean code, better maintainability, and scalability.

## Project Structure

The app follows a feature-wise segregation inside the `lib/` directory, ensuring modularity and scalability. Each feature follows the MVVM (Model-View-ViewModel) architecture.

```
lib/
|-- features/
|   |-- auth/  (Authentication related files)
|   |-- home/  (Home screen and dashboard)
|   |-- reminders/  (Medicine reminders and notifications)
|   |-- user_profile/  (User profile management)
|
|-- core/
|   |-- services/  (Firebase services, API handling)
|   |-- utils/  (Helper classes, constants, and common widgets)
|
|-- main.dart  (Entry point of the app)
```

## Getting Started

Follow these steps to set up the project:

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/hsdk_assignment.git
   cd hsdk_assignment
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Configure Firebase:
    - Set up Firebase in your project by following [FlutterFire documentation](https://firebase.flutter.dev/docs/overview/).
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files to the respective folders.
4. Run the app:
   ```sh
   flutter run
   ```

## Dependencies

The project uses the following dependencies:

- **Firebase Authentication**: `firebase_auth`
- **Cloud Firestore**: `cloud_firestore`
- **Firebase Cloud Messaging**: `firebase_messaging`
- **State Management**: Bloc
- **Other utilities**: `flutter_local_notifications`, etc.

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.


For any issues or queries, feel free to open an issue or contact the project maintainer.

Happy Coding! 🚀

