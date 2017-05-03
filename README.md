# Pre-work - *Pitnus Calc*

**Pitnus Calc** is a tip calculator application for iOS.

Submitted by: **Vader1359**

Time spent: **48** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage. (Not use this)

The following **optional** features are implemented:
* [x] UI
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Redesign the UI and UX
- [x] DayMode and NighMode
- [ ] Swipe left and right to change the Theme, TipRate and Number of Payers value
- [ ] Add animation to the app
- [x] Organize the code ~~
- [ ] Fix error and minor improvements

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/vader1359/SunnyTip/blob/master/SunnyTipPreview.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [EZ-GIF]

## Notes

Describe any challenges encountered while building the app.
- Format text in the EditField with Currency and Thousand Separator
- Gesture Recognizer still not work
- Live update the total amount and each amount while updating the tipRate and numberOfPayers
- update the info from multiple resource (not yet touch)
- Input the tipAmount to change the tipRate and inverse
- UISegmentControl still not work
- Storing default value using NSUserDefaults
- Organizing the Code
- *** OPTIONAL BINDING*** Handling
- Storyboard error: Thread1: signal SIGABRT error ~
- Many minor errors ~

## License

    Copyright [2017] [Vader1359]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
