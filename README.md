# Pre-work - CalcTip

CalcTip is a tip calculator application for iOS.

Submitted by: Justin Sin

Time spent: 20 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly.

The following **optional** features are implemented:

* [x] UI animations
* [] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!

* Conversion from US to Yuan currency
* Conversion from US to Euro currency

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![ezgif com-gif-maker](https://user-images.githubusercontent.com/48116685/140548896-f5055db5-3c83-48a8-ba87-ac413aa9c329.gif)

GIF created with [ezgif](https://ezgif.com/maker).

## Notes

Describe any challenges encountered while building the app.

The biggest challenge for me was creating the settings page and passing the data between view controllers. It took a lot of trial and error before I was finally able to get the data on the view controller from the settings view controller. 

Another challenge I encountered was with implementing the UIPicker so users could select the background color for the app. There were multiple steps in setting up the components, number of rows, the title in each row, and lastly, the code that runs when a user selects a specific color in the UIPicker.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
