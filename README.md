# OutputTo

[![CI Status](http://img.shields.io/travis/paulz/OutputTo.svg?style=flat)](https://travis-ci.org/paulz/OutputTo)
[![Version](https://img.shields.io/cocoapods/v/OutputTo.svg?style=flat)](http://cocoapods.org/pods/OutputTo)
[![License](https://img.shields.io/cocoapods/l/OutputTo.svg?style=flat)](http://cocoapods.org/pods/OutputTo)
[![Platform](https://img.shields.io/cocoapods/p/OutputTo.svg?style=flat)](http://cocoapods.org/pods/OutputTo)

## Usage

[Kiwi](https://github.com/kiwi-bdd/Kiwi) Spec example to verify NSLog() output
```objc
[[[PZOutputTo log:^{
    [subject doSomething];
}] should] containString:@"something has been done successfully"];
```
See more Kiwi Spec examples in [PZOutputToSpec.m](Example/Tests/PZOutputToSpec.m)

To run the example project, clone the repo, open [Example/OutputTo.xcworkspace](Example/OutputTo.xcworkspace) and run tests.

## Requirements

NSLog, printf or compatible to standard output stream loggers

## Installation

OutputTo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OutputTo'
```

## Author

Paul Zabelin, http://github.com/paulz

## License

OutputTo is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
