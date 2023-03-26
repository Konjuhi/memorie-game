# Memory Game

🔨 Memory Game is a mobile game app built with Flutter framework. It's a simple game where users have to match pairs of cards with the same image. The game starts with a shuffled deck of cards and the user has to flip two cards at a time to see if they match. If the cards match, they stay flipped, otherwise, they are flipped back over. The game ends when all pairs of cards are matched.

## Getting Started

To get started with Memory Game, you can clone the project from GitHub repository: git clone https://github.com/Konjuhi/memorie-game.git
After cloning the repository, navigate to the project directory and run the following command to install the dependencies:flutter pub get

## Running the App

You can run the app on an emulator or physical device. To run the app on an emulator, you can use the following command: flutter emulators --launch <emulator_id> Replace <emulator_id> with the ID of the emulator you want to launch.
To run the app on a physical device, you need to enable USB debugging on the device and connect it to your computer using a USB cable. Then, run the following command to install and launch the app: flutter run

## How to Play

When you open the app, you'll be taken to the home screen where you can start a new game or resume an existing game. If you start a new game, you'll be taken to the game screen where you'll see a deck of cards.

To play the game, you can tap on any two cards to flip them over. If the cards match, they stay flipped, otherwise, they are flipped back over. Your goal is to match all pairs of cards before the time runs out.

The game ends when you match all pairs of cards or the time runs out. If you match all pairs of cards, you'll see a message showing how many pairs you matched and how much time it took you to complete the game. You can then choose to restart the game or go back to the home screen.

## Architecture

Memory Game is built using the Flutter framework and follows the Provider architecture pattern. The app is divided into several components, including:

Screens: the UI screens of the app, including the home screen and game screen.
Provider: the app's state management component that handles the game logic and data.
Widgets: reusable UI components, such as the card widget and the timer widget.





https://user-images.githubusercontent.com/44701013/222915073-47f1f037-dd23-4b2d-a276-05fcc73de1b5.mov


