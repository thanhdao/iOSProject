//
//  MacroUtilities.h
//  MKNetworkKitExtend
//
//  Created by Dato - horseuvn@gmail.com on 9/6/12.
//  Copyright (c) 2012 Techmaster VN. All rights reserved.
//
/************************ Enable hoac disable cac nhom macro ************************/

//Comment dong duoi de disable chuc nang show log
//#define MU_DEBUG

/************************ Khai bao cac macro ************************/

/*
 * Macro duong dan thu muc dac biet
 */
#ifndef MU_DOCUMENT_DIRECTORY_PATH
#   define MU_DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#endif

#ifndef MU_LIBRARY_DIRECTORY_PATH
#   define MU_LIBRARY_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#endif

#ifndef MU_RESOURCE_DIRECTORY_PATH
#   define MU_RESOURCE_DIRECTORY_PATH [[NSBundle mainBundle] resourcePath]
#endif

#ifndef MU_CREATE_UUID
#   define MU_CREATE_UUID(string) {\
CFUUIDRef theUUID = CFUUIDCreate(NULL);\
CFStringRef stringUUID = CFUUIDCreateString(NULL, theUUID);\
CFRelease(theUUID);\
string = (__bridge_transfer NSString *) stringUUID; \
}
#endif

/*
 *  Macro de xac dinh kieu cua NSNumber
 */
#ifndef MU_NSNUMBER_IS_BOOLEAN
#   define MU_NSNUMBER_IS_BOOLEAN(v) (strcmp([v objCType], @encode(BOOL)) == 0)
#endif

#ifndef MU_NSNUMBER_IS_INTERGER
#   define MU_NSNUMBER_IS_INTERGER(v) (strcmp([v objCType], @encode(NSInteger)) == 0)
#endif

#ifndef MU_NSNUMBER_IS_DOUBLE
#   define MU_NSNUMBER_IS_DOUBLE(v) (strcmp([v objCType], @encode(double)) == 0)
#endif

#ifndef MU_NSNUMBER_IS_FLOAT
#   define MU_NSNUMBER_IS_FLOAT(v) (strcmp([v objCType], @encode(float)) == 0)
#endif

/*
 *  Macro cho viec debug
 */

#ifdef MU_DEBUG
#   ifndef MU_DLog
#       define MU_DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   endif
#   ifndef MU_ELog
#       define MU_ELog(err) {if(err) MU_DLog(@"%@", err)}
#   endif
#else
#   ifndef MU_DLog
#       define MU_DLog(...)
#   endif
#   ifndef MU_ELog
#       define MU_ELog(err)
#   endif
#endif


/*
 *  System Versioning Preprocessor Macros
 */
#ifndef MU_SYSTEM_VERSION_EQUAL_TO
#   define MU_SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#endif

#ifndef MU_SYSTEM_VERSION_GREATER_THAN
#   define MU_SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#endif

#ifndef MU_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO
#   define MU_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#endif

#ifndef MU_SYSTEM_VERSION_LESS_THAN
#   define MU_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#endif

#ifndef MU_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO
#   define MU_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#endif    

/*
 *  Singleton Pattern Preprocessor Macros
 */

#ifndef MU_SINGLETON_INTERFACE_PATTERN
#   define MU_SINGLETON_INTERFACE_PATTERN(class_name) \
+ (class_name *) shared;\
+ (BOOL) isInitialize;    
#endif

#ifndef MU_SINGLETON_IMPLEMENTATION_PATTERN
#   define MU_SINGLETON_IMPLEMENTATION_PATTERN(class_name) \
    static class_name *_instance = nil;\
    static BOOL _isInitialize;\
    + (class_name *) shared\
    {\
        @synchronized([class_name class])\
        {\
            if (!_instance)\
            {\
                _instance = [[self alloc] init];\
                _isInitialize = TRUE;\
            }\
            \
            return _instance;\
        }\
        \
        return nil;\
    }\
    + (id) alloc\
    {\
        @synchronized([class_name class])\
        {\
            NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");\
            _instance = [super alloc];\
            return _instance;\
        }\
        return nil;\
    }\
    + (BOOL)isInitialize{\
        return _isInitialize;\
    }
#endif

/*
 *  Macros cho phep so sanh
 */

#ifndef AND
#   define AND &&
#endif

#ifndef OR
#   define OR ||
#endif

#ifndef EQUALS
#   define EQUALS ==
#endif

/*
 *  Macros kiem tra nam nhuan
 */
#ifndef MU_IS_LEAP_YEAR
#   define MU_IS_LEAP_YEAR(year) (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0))
#endif


/*
 *  Macros kiem tra thiet bi la iPad hay iPhone
 */
#ifndef MU_IS_IPAD
#   define MU_IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#endif

#ifndef MU_IS_IPHONE
#   define MU_IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#endif

/*
 *  Macros kiem tra orientation cua thiet bi
 */
#ifndef MU_DEVICE_ON_PORTRAIT
#   define MU_DEVICE_ON_PORTRAIT (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
#endif

#ifndef MU_DEVICE_ON_LANDSCAPE
#   define MU_DEVICE_ON_LANDSCAPE (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
#endif

/*
 *  Macros kiem tra iPhone 3.5 inch hay la iPhone 4 inch
 */
#ifndef MU_DEVICE_IS_IPHONE_3_5_INCH
#   define MU_DEVICE_IS_IPHONE_3_5_INCH ([[UIScreen mainScreen] bounds].size.height == 480.0)
#endif

#ifndef MU_DEVICE_IS_IPHONE_4_0_INCH
#   define MU_DEVICE_IS_IPHONE_4_0_INCH ([[UIScreen mainScreen] bounds].size.height == 568.0)
#endif

/*
 *  Macros show alert
 */
#ifndef MU_ALERT
#   define MU_ALERT(title, content) [[[UIAlertView alloc] initWithTitle:title message:content delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show]
#endif

/*
 *  Macros get current app version
 */
#ifndef MU_CURRENT_APP_VERSION
#   define MU_CURRENT_APP_VERSION \
[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] floatValue];
#endif

/*
 *  Macros random float: 0.0f->1.0f
 */
#ifndef MU_RANDOM_FLOAT
#   define MU_RANDOM_FLOAT \
((float)arc4random() / 0x100000000)
#endif

/*
 *  Macros random int: min->max
 */
#ifndef MU_RANDOM_INT
#   define MU_RANDOM_INT(min,max) \
((arc4random() % (max-min + 1)) + min)
#endif

/*
 *  Macros for getting keyboard height, word on both virtual keyboard and external keyboard
 */
#ifndef MU_KEYBOARD_HEIGHT
#   define MU_KEYBOARD_HEIGHT(keyboard_notification,param_keyboard_height) \
NSValue* aKeyboardValue = [[keyboard_notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];\
CGRect keyboardRect = [aKeyboardValue CGRectValue];\
if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait){\
    param_keyboard_height = [UIScreen mainScreen].bounds.size.height - keyboardRect.origin.y;\
}\
else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown){\
    param_keyboard_height = keyboardRect.size.height + keyboardRect.origin.y;\
}\
else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft){\
    param_keyboard_height = [UIScreen mainScreen].bounds.size.width - keyboardRect.origin.x;\
}\
else{\
    param_keyboard_height = keyboardRect.size.width + keyboardRect.origin.x;\
}
#endif
