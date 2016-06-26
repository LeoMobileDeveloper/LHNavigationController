
[![Version](https://img.shields.io/cocoapods/v/LHNavigationController.svg?style=flat)](http://cocoapods.org/pods/LHNavigationController)


# LHNavigationController

LHNavigationController contains a collection of UIViewControllers that allow you to user full screen push/pop.

* LHNavigationController hides its own navigation bar
* LHViewControlelr/LHTableviewController create a `UINavigationBar` and add it as a subview during `viewDidLoad`

## Install

```
pod LHNavigationController
```

## Gif

<img src="https://raw.github.com/LeoMobileDeveloper/LHNavigationController/master/ScreenShots/gif.gif" width="300">

## Classes

There are main three classes

* LHNavigationController
* LHTableViewController
* LHViewController

You must use these 3 classes or subclass to build the parts that using the feature of full screen push/pop.


## Pop

Using full screen pop gesture is quite simple,you just need to use `LHNavigationController`


## Push

First set the `lhDelegate` of `LHNavigationController`

 ```
 @property (weak,nonatomic) id<LHNavigationControllerDelegate> lhDelegate;

 ```
 Then, return the viewController you want to push in 

```
- (UIViewController *)viewControllerAfterController:(UIViewController *)controller{
   //Here controller is the top most controller
}

``` 

## Propertys

```
// access navigationBar
@property (strong,nonatomic,readonly)UINavigationBar * lh_navigationBar;

// access navigationItem
@property (strong,nonatomic,readonly)UINavigationItem * lh_navigationItem;

// add subview
@property (strong,nonatomic,readonly)UIView * lh_view;

// access the NativationController
@property (strong,nonatomic,readonly)LHNavigationController * lh_navigationController;

// set the background color of NavigationBar
@property (strong,nonatomic)UIColor * barTintColor;

// set the color of barbutton items
@property (strong,nonatomic)UIColor * barItemsTintColor;
// set the color of bar title
@property (strong,nonatomic)UIColor * barTitlesTintColor
```


## Author

Leo, leomobiledeveloper

## License

LHNavigationController is available under the MIT license. See the LICENSE file for more info.
