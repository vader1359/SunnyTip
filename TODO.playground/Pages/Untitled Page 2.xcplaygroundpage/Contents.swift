/*
 -------------------------------------------------------------------
 MAIN SCREEN: The screen shows the calculator
 -------------------------------------------------------------------
 */

/*
 -------------------
 List of Views
 - backgroundImg
 - billTf
 - tipTf
 - totalLabel
 - eachPayerAmountLabel
 - tipRateLabel
 - numberOfPayersLabel
 - updateSunBackgroundImg or sunController
 - updateSunLabel***
 - currencyBar***
 - tipRateBar***
 - hiddenBackground
 -------------------
 */

/*
 -------------------------------------------------------------------
 ~BACKGROUND~
 - Link: BillTf
 - Swipe left to load picture DayMode, spie right to NightMode
 - An ImageView loads the DayMode or NightMode pictures
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~billTF~
 - Link: Background, Keyboard
 - A TextField allow user to input the bill
 - Must respond first when open the app
 - The keyboard must be always on
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~tipTf~
 - Link: tipRateLabel
 - A TextField allow user to input the amount of tip
 - When the tipRateLabel update -> tipTf also update and inverse
 - Swipe left to decrease rate, Swipe right to increase rate
 - The rate is 0, 5, 10, 15, 20 % - 5 levels
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~totalLabel~
 - Link: billTf, tipTf, numberOfPayerLabel
 - Display the result of the calculateTipFunction
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~eachPayerAmountLabel~
 - Link: numberOfPayersLabel
 - Display the result
 - Swipe left to decrease the number of Payers, swipe right to increase
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~tipRateLabel~
 - Link: tipTf
 - A Label to display the % of TipRate
 - When the tipRateLabel update -> tipTf also update and inverse
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~numberOfPayersLabel~
 - Link: eachPaymentAmountLabel
 - Display the number of payers, changed by the eachPayeymentAmountLabel
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~updateSunBackgroundImage (V2) or sunController (V1)
 (v2)
 - Link: updateSunLabel
 - This is simply a circle background image for attaching updateSunLabel
 - Long press to change the theme
 (v1)
 - Link: tipRateBar, currencyBar, hiddenBackground
 - Move this controller around to choose the tip rate and the currency
 - When it's moved down, hiddenBackground becomes darker and inverse
 - Long press to change the theme
 -------------------------------------------------------------------
 */

/*
 -------------------
 - updateSunLabel*** (v2)
 - currencyBar*** (v1)
 - tipRateBar*** (v1)
 - hiddenBackground (v1)
 -------------------
 */

/*
 -------------------------------------------------------------------
 ~updateSunLabel (v2)
 - Link: tipTf, numberOfPayersLabel, BackgroundImg
 - Live display the update of tip amount and the number of payers while slide to change
 - Change between the Sun and the Moon (DayMode and NightMode)
 - Occasionally disappear to show the swipe left-right hint
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~currencyBar~
 - Link: updateSunBackgroundImage, updateSunLabel, tipRateBar
 - Show 3 currencies (localeSpecific, USD, Yen)
 - Play roles as the x axis of SunController
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~tipRateBar~
 - Link: updateSunBackgroundImage, updateSunLabel, currencyBar
 - Show 5 tip rate 0,5,10,15,20
 - Play roles as the y axis of the SunController
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ~hiddenBackground~
 - Link: sunController
 - Display a black image, which can becomes gray, visualize the light when moving the sun
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 USER CASE
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ** V1 **
 - User input the bill amount from the keyboard
 - The default tip rate is 10% and the number of Payers is 1
 - User swipe the tip view left to decrease, right to increase the tip
 - The number will be updated in TipLabel and sunUpdate
 - Similarly to the number of Payers, swiping the eachView for the change
 -------------------------------------------------------------------
 */

/*
 -------------------------------------------------------------------
 ** V2 **
 - User input the bill amount from the keyboard
 - The default tip rate is 10% and the number of Payers is 1
 - User move the sun to choose the interest rate and the currency and the yen and long press to change the theme
 -------------------------------------------------------------------
 */




