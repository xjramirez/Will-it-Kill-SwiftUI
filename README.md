# Will it Kill SwiftUI
 Fighting Game "Will it Kill" presentation using Adin Ackerman's SwiftUI PresentationKit  
   
### Attributions
AdinAck's PresentationKit for SwiftUI: [https://github.com/AdinAck/PresentationKit](https://github.com/AdinAck/PresentationKit). Very useful framework to create simple and elegant presentations.  

Sajam: [https://www.youtube.com/@SupermanSajam](https://www.youtube.com/@SupermanSajam). Inspiration behind the project idea. Most (if not all) clips were taken from his series.

### Context for the Project
This project was made for Triton Fighters' booth at Triton Gaming's 2023 Division Showcase at UCSD. A presenter asks the guests for a game category, then begins begins playing the randomly selected clip from the game they selected. Once the clip pauses, the presenter asks the guests whether or not they think the combo will kill (and does some crowd-work). Then, once all the guests have decided, the presenter restarts the clip, and the crowd gets to watch the combo through to completion. The presenter gave their event punch card a stamp if they guessed the outcome of the clip correctly, then repeated the process for the next group of guests.  

Overall, this went very well at the event. It was very easy to teach the presenters how to use the program, and guests understood the premise quickly, even if they were unfamiliar with certain fighting game concepts.

### Usage
Clips must be added to Assets, with the naming scheme "*game*_*clip no*_*clip order*". (a_b_1 is the clip up until the first hit, a_b_2 is the entire clip)  
When a new clip is added, the "*game*size" variable in Videos.swift should be incremented, basically it has to equal the number of clips in Assets.  
When first ran, it will load on the game select screen. Click a category, then press **CMD + N** to start to play the clip up to the point where the first hit happens (or whenever it is made to "pause"), then **CMD + N** again to restart the clip and have it play until the end.  
Once the clips are over completely, press **CMD + B** twice to return to the game select screen.  
This process of picking a game, playing with **CMD + N**, restarting with **CMD + N**, then returning to the select screen with **CMD + B** twice can now be repeated.
