# SmartAutoLayout
`SmartAutoLayout` is an extended form of `NSLayoutConstraint` that provides the facility to add device specific layout constraints from Storyboard or Xib. 


# How To Use

1. Add `SmartLayoutConstraint.swift`, `NSLayoutConstraint+NSCoding.h` and `UIDeviceExt.swift` files in your project.
2. Create Bridging Header for your project. [How to create Bridging Header](https://stackoverflow.com/questions/31716413/xcode-not-automatically-creating-bridging-header)
3. Import `NSLayoutConstraint+NSCoding.h` in your bridging header.

   ![alt text][logo]

[logo]: https://github.com/nagibazad/SmartAutoLayout/blob/master/ScreenShots/Screenshot%202018-12-23%20at%202.37.09%20PM.png ""

4. Select the `NSLayoutConstraint` in your interface builder and change the class to `SmartLayoutConstraint`

![alt text][logo1]

[logo1]: https://github.com/nagibazad/SmartAutoLayout/blob/master/ScreenShots/Screenshot%202018-12-23%20at%203.55.45%20PM.png ""

5. Choose the devices in which you want to make active/inactive your Layout Constraint.

![alt text][logo2]

[logo2]: https://github.com/nagibazad/SmartAutoLayout/blob/master/ScreenShots/Screenshot%202018-12-23%20at%202.31.13%20PM.png ""
