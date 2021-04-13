These are three small apps written in swift language for iOS. 

#### Simple Game
The first one is a simple game in which the player sets the slider control position so that it is as close to the random value as possible.
After setting the slider, the user presses the "Check" button, which displays an Alert with the number of points, and the "Play" button, which takes him to the next round. 
The game starts again after passing 10 rounds or pressing the Restart button. 
#### Smile
The second one displays a smiley face drawn with the addArc and addQuadCurve methods.
From this screen, user go to two other screens. On the first one, the color of the face can be set with sliders, while on the second one user can choose whether the face is smiling or sad. Data is transferred between screens using the unwind segue (first screen) or using the protocol (second one).
#### Santa
The last app but not least implements gesture recognition and location. It consists of three views. On the first one there is a Santa image, on which pan, pinch and rotate gesture can be made. The second one has a counter that is started after performing the tap gesture with one finger, is stopped after the tap gesture with two fingers, and is reset when the gesture swipe right with one finger is performed. And the third view with two buttons: get location, after pressing which the latitude and longitude are displayed, and the button: get address, transforming location into an address using reverseGeocoding.

<br>
All apps were created for Mobile Technologies course on Silesian University of Technology.
