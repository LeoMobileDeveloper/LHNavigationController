
[![Build Status](https://travis-ci.org/LeoMobileDeveloper/LHNavigationController.svg?branch=master)](https://travis-ci.org/LeoMobileDeveloper/LHProgressHUD)  [![License: MIT](https://img.shields.io/cocoapods/l/LHNavigationController.svg?style=flat)](http://opensource.org/licenses/MIT)  [![Version](https://img.shields.io/cocoapods/v/LHNavigationController.svg?style=flat)](http://cocoapods.org/pods/LHNavigationController)


# LHNavigationController

LHNavigationController能够让你的App像网易新闻那样支持全屏的push/pop.

## 安装

```
pod LHNavigationController
```

## 效果

默认效果

<img src="https://raw.github.com/LeoMobileDeveloper/LHNavigationController/master/ScreenShots/gif.gif" width="200">

3d效果

<img src="https://raw.github.com/LeoMobileDeveloper/LHNavigationController/master/ScreenShots/gif2.gif" width="200">

## 类
主要有四个类

* LHNavigationController
* LHViewController
* LHTableViewController
* LHCollectionViewController

通常，你应该以这四个类为基类来建立你的App


## Pop

想要支持全屏的Pop手势很简单，只需要把你的UINavigationController替换成LHNavigationController即可

## Push

实现全屏的Push需要你设置LHNavigationController的代理 `lhDelegate`

 ```
 @property (weak,nonatomic) id<LHNavigationControllerDelegate> lhDelegate;

 ```
 
然后，在对应的方法中，返回将要push的controller

```
- (UIViewController *)viewControllerAfterController:(UIViewController *)controller{
   //这里的controller是导航堆栈最上面的那个
}

``` 

## 属性

LHViewController

```
// 访问导航栏 
@property (strong,nonatomic,readonly)UINavigationBar * lh_navigationBar;

// 访问navigationItem
@property (strong,nonatomic,readonly)UINavigationItem * lh_navigationItem;

// 用这个作为ContainView来增加删除subview
@property (strong,nonatomic,readonly)UIView * lh_view;

// 访问LHNativationController
@property (strong,nonatomic,readonly)LHNavigationController * lh_navigationController;

// 设置NavigationBar背景色
@property (strong,nonatomic)UIColor * barTintColor;

// 设置BarButton颜色
@property (strong,nonatomic)UIColor * barItemsTintColor;
// 设置BarTitle颜色
@property (strong,nonatomic)UIColor * barTitlesTintColor
```

LHNavigationController

```
//设置转换风格，支持默认和3D两种
@property (assign,nonatomic) LHNavigationTransitionStyle lh_transtionStyle;

```
## 原理

我在[这篇博客](http://blog.csdn.net/hello_hwc/article/details/51764459)里详细的讲解了这个库的实现原理。

## Author

Leo, leomobiledeveloper

## License

LHNavigationController is available under the MIT license. See the LICENSE file for more info.
