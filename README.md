# AlertPro

[![Version](https://img.shields.io/cocoapods/v/AlertPro.svg?style=flat)](http://cocoapods.org/pods/AlertPro)
[![License](https://img.shields.io/cocoapods/l/AlertPro.svg?style=flat)](http://cocoapods.org/pods/AlertPro)
[![Platform](https://img.shields.io/cocoapods/p/AlertPro.svg?style=flat)](http://cocoapods.org/pods/AlertPro)

UIViewController category for easy creating and showing UIAlertController.

## Usage

So simple, lol.


```objective-c
[self hrShowActionSheetWithTitle:@"Title" message:@"Message" buttonTitles:@[@"First", @"Second"] actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
    [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
} andCancelActionHandler:^{
    [self showHandleAlertWithMessage:@"Cancel button is tapped"];
}];

-(void)showHandleAlertWithMessage:(NSString *)message {
    [self hrShowAlertWithTitle:@"Handle!" message:message];
}
```

For another methods usage see [documentation](http://cocoadocs.org/docsets/AlertPro).

## Requirements

Objective-C and iOS 8.0 or higher.

## Installation

AlertPro is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AlertPro'
```

## Author

Ivan Shevelev, ivan.shevelev@sibers.com

## License

AlertPro is available under the MIT license. See the LICENSE file for more info.
