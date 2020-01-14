# SBSpinnerView

Custom Activity Indicator for iOS

[![Platform](https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=4BC51D)](#installation)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![LICENSE](https://img.shields.io/badge/License-MIT-4BC51D.svg?style=flat)](#license)

![Screenshot](https://raw.githubusercontent.com/smbhuin/SBSpinnerView/master/screenshot.png)

## INSTALLATION

#### Manual
1. Open your XCode project and the SBSpinnerView project as sub-project.
or
2. Drag the "SBSpinnerView" directory into your project.

#### Carthage 
You can use [Carthage](https://github.com/Carthage/Carthage). 
Specify in Cartfile:

```ruby
github "smbhuin/SBSpinnerView"
```

Run `carthage` to build the framework and drag the built SBSpinnerView.framework into your Xcode project. Follow [build instructions](https://github.com/Carthage/Carthage#getting-started).

## HOW TO USE

 ```objc
 SBSpinnerView *spv = [[SBSpinnerView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
 [spv setColor:[UIColor orangeColor]];
 [self.view addSubview:spv];
 [spv startAnimation];
 ```
 
## LICENSE

This library is licensed under MIT. Full license text is available in [LICENSE](https://github.com/smbhuin/SBSpinnerView/blob/master/LICENSE).
