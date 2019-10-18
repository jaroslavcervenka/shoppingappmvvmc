# ShoppingAppMVVMC - iOS mobile application

The ShoppingAppMVVC is an example mobile application for proof patterns, concepts, libraries on iOS platform. Created for learning purpose.

## How to use

Just download source code and unzip the downloaded folder and opne project in Xcode.

**Using Terminal:**

```bash
  git clone https://github.com/wormware/shoppingappmvvmc
  ```

## Requirements

Xcode 11

## Development platforms

There are a few development platforms for devops, analytics, data storage, but I think the best platform is Google Firebase.

- [Google Firegase](https://firebase.google.com/)
- [Microsoft App Center](https://appcenter.ms/)
- [Amazon AWS Mobile](https://aws.amazon.com/getting-started/use-cases/mobile/)

## Development

### IDE, tools

Here is a list of usefull and smarty tools to have development easy and happy:

- [AppCode](https://www.jetbrains.com/objc/) - smart IDE from JetBrains for iOS/macOS development, but still you need Xcode
- [REVEAL](https://revealapp.com/) - powerful runtime view debugging
- [Sherlock](https://sherlock.inspiredcode.io/) - edit views and layout constraints in real time and more
- [InjectionIII](https://apps.apple.com/us/app/injectioniii/id1380446739?mt=12) - adds a limited form of “Hot Reload” capability to your iOS
- [bitrise](https://www.bitrise.io/) - CI and CD for mobile apps
- [fastlane](https://fastlane.tools/) - open source platform aimed at simplifying Android and iOS deployment
- [Charles](https://www.charlesproxy.com/overview/) - web debugging proxy app
- [mockable.io](https://www.mockable.io/) - the Fastest way to mock your API

### Builds

For CI and CD builds I have used wonderful service [bitrise](https://www.bitrise.io/).

### Tests

The app contains a few test examples. UI testing uses [accesibility identifiers](https://blog.novoda.com/ui-testing-part-2/) which are set programatically via **Accessible.generateAccessibilityIdentifiers** in view controllers.

There are a few services which provide run tests on simulators or real devices, for example: [Google Firebase](https://firebase.google.com/), [Microsoft App Center](https://appcenter.ms/), [BrowserStack](https://www.browserstack.com), [SOURCELABS](https://saucelabs.com/)

For beta testing you can use [Apple Test Flight](https://developer.apple.com/testflight/) or [Google Firebase](https://firebase.google.com/).

### Package dependency management

There are 2 dependency managers used in the app - CocoaPods(centralized, automatically integrated Carthage) and Carthage(decentralized, manually integrated into project). Usage depends on a package which is used in the app. There are many differences. Please read a documentation.

- [CocoaPods](https://cocoapods.org)
- [Carthage](https://github.com/Carthage/Carthage)

### Design pattern MVVM

Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:

**Models** hold application data. They’re usually structs or simple classes.

**Views** (view controllers) display visual elements and controls on the screen.

**View models** transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

### Navigation

Navigation is based on the Coordinator pattern - MVVM-C. coordinator is responsible for the application's flow. Coordinators create, present and dismiss UIViewControllers while keeping the UIViewControllers separate and independent. Similar to how UIViewControllers manage UIViews, Coordinators manage UIViewControllers.

XCoordinator, a navigation framework based on the Coordinator pattern. It's especially useful for implementing MVVM-C, Model-View-ViewModel-Coordinator.

[XCoordinator + RxSwift](https://github.com/quickbirdstudios/XCoordinator)

MVVM-C diagram (from [XCoordinator site](https://github.com/quickbirdstudios/XCoordinator)):

![Coordinator pattern](/.attachments/mvvmc.png)

App flow diagram:

![App flow - coordinators](/.attachments/app-flow.png)

### Dependency injection

**Swinject** is a lightweight dependency injection framework for Swift.
Dependency injection (DI) is a software design pattern that implements Inversion of Control (IoC) for resolving dependencies. In the pattern, Swinject helps your app split into loosely-coupled components, which can be developed, tested and maintained more easily. Swinject is powered by the Swift generic type system and first class functions to define dependencies of your app simply and fluently.

- [Swinject](https://github.com/Swinject/Swinject)
- [SwinjectAutoregistration](https://github.com/Swinject/SwinjectAutoregistration)

### UI binding, reactive programing

**RxSwift: ReactiveX for Swift** is a Swift version of Rx - a generic abstraction of computation expressed through Observable\<Element> interface.

Like the original Rx, its intention is to enable easy composition of asynchronous operations and event/data streams.

KVO observing, async operations and streams are all unified under abstraction of sequence. This is the reason why Rx is so simple, elegant and powerful.

**ReactiveCocoa** wraps various aspects of Cocoa frameworks with the declarative ReactiveSwift primitives.

**ReactiveX** is an API for asynchronous programming with observable streams.

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
- [ReactiveX](http://reactivex.io/)

### Images - downloading, caching

**Kingfisher** is a powerful, pure-Swift library for downloading and caching images from the web. It provides you a chance to use a pure-Swift way to work with remote images in your next app.

- [Kingfisher](https://github.com/onevcat/Kingfisher)

### Layout

Storyboards are used for building an user interface. Storyboards allow you to prototype and design multiple view controller views within one file. Each storyboard file is its own scene folder.

[Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/) dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views. There are two apreaches how to define constraints. The first one defines constraints with storyboard view in XCODE and second one defines constraints programatically using **SnapKit**.

[SnapKit](https://github.com/SnapKit/SnapKit) is a DSL to make Auto Layout easy on both iOS and OS X. Simple & Expressive chaining DSL allows building constraints with minimal amounts of code while ensuring they are easy to read and understand. Type Safe by design to reduce programmer error and keep invalid constraints from being created in the first place for maximized productivity.

### Resources - type safe

[SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool to auto-generate Swift code for resources of your projects, to make them type-safe to use.

Swift code is generated during a build procedure. If you want to add new resources - modify a config file swiftgen.yml [more info](https://github.com/SwiftGen/SwiftGen/blob/master/Documentation/ConfigFile.md)
and once the build is successfully finished just add new generated file to project in path 'Generated'.

### Localization

For translation is used translation service **TranslationServiceImpl** which downloads translations from fake API provider. UI controls like UILabel, UITextField and UIButton have their own class to replace their texts with value of LocalizationKey. But **better way** is to download a resource file from some translation service endpoint before a build and include into application package - app does not need to get it when the app is starting.

### Settings

Application data is stored system storage UserDefaults as JSON string. There are two screens - first as tab view and second as page in iOS settings.

## Sources with ideas, patterns

### Examples with concepts used in the app - MMVM-C, Dependency Injection, data binding

- [igorkulman/iOSSampleApp](https://github.com/igorkulman/iOSSampleApp)
- [MVVM + Coordinators + RxSwift and sample iOS application with authentication](https://wojciechkulik.pl/ios/mvvm-coordinators-rxswift-and-sample-ios-application-with-authentication)

### Modular architecture

There are a few tips how to split the app into small pieces to reduce development time, build time and increase productivity, e.g. each feature in its own project:

- [Modular Architecture on iOS and how I decreased build time by 50%](https://medium.com/freelancer-engineering/modular-architecture-on-ios-and-how-i-decreased-build-time-by-50-23c7666c6d2f)
- [iOS Modular Architecture](https://github.com/freelancer/ios-modular-architecture)
- [Modular Architecture in iOS](https://medium.com/flawless-app-stories/a-modular-architecture-in-swift-aafd9026aa99)

[µFeatures](https://github.com/tuist/microfeatures-guidelines) is an architectural approach to structure iOS applications to enable scalability, optimizing build and testing cycles, and ensuring good practices in your team. Its core idea is to build your apps by building independent features that are interconnected using clear and concise APIS.

### iOS frameworks, libraries, tutorials

[Awesome iOS](https://github.com/vsouza/awesome-ios) - a curated list of awesome iOS frameworks, libraries, tutorials, Xcode extensions and plugins, components and much more.

## License

MIT License

Copyright (c) 2019 Jaroslav Červenka

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
