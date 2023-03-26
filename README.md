# Memory Game

🔨 Memory Game is a mobile game app built with Flutter framework. It's a simple game where users have to match pairs of cards with the same image. The game starts with a shuffled deck of cards and the user has to flip two cards at a time to see if they match. If the cards match, they stay flipped, otherwise, they are flipped back over. The game ends when all pairs of cards are matched.

## Getting Started

To get started with Memory Game, you can clone the project from GitHub repository: git clone https://github.com/Konjuhi/memorie-game.git
After cloning the repository, navigate to the project directory and run the following command to install the dependencies: flutter pub get

## Running the App

You can run the app on an emulator or physical device. To run the app on an emulator, you can use the following command: flutter emulators --launch <emulator_id> Replace <emulator_id> with the ID of the emulator you want to launch.
To run the app on a physical device, you need to enable USB debugging on the device and connect it to your computer using a USB cable. Then, run the following command to install and launch the app: flutter run

## How to Play

The Memory Game project consists of a home screen that displays a "New Game" button. When the "New Game" button is pressed, the game screen appears, displaying the shuffled cards face down.

The player can then flip over cards by tapping on them to reveal their images. If the two cards match, they will remain face up, and the player earns points. If the two cards do not match, they will flip back over, and the player can continue to flip cards until all pairs have been matched.

The game also has a timer that starts when the player begins the game, and the player must match all pairs before the timer runs out. The game ends when the player has matched all pairs or when the timer runs out.

## Architecture

Memory Game is built using the Flutter framework and follows the Provider architecture pattern. The app is divided into several components, including:

Screens: the UI screens of the app, including the home screen and game screen.
Provider: the app's state management component that handles the game logic and data.
Widgets: reusable UI components, such as the card widget and the timer widget.

## Conclusion

The Memory Game project is a simple yet challenging game that tests a player's memory and concentration skills. It was implemented using the Flutter framework and the Provider package for state management, making it easy to maintain and update.
If you have any suggestions or feedback on the project, feel free to submit an issue or pull request on the project's GitHub repository.









https://user-images.githubusercontent.com/44701013/222915073-47f1f037-dd23-4b2d-a276-05fcc73de1b5.mov


