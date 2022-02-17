//
//  FatosBaseAppDelegate.h
//  Fatos
//
//  Created by 심규빈 on 2020/01/22.
//  Copyright © 2020 유춘성. All rights reserved.
//

//#ifndef FatosBaseAppDelegate_h
//#define FatosBaseAppDelegate_h

#import <UIKit/UIKit.h>

@class GPSService;
@class FatosNaviModule;

@interface FatosBaseAppDelegate : UIResponder <UIApplicationDelegate> {
    
}

+ (FatosBaseAppDelegate *)sharedAppDelegate;
+ (FatosNaviModule *)sharedNaviModule;
+ (void)setNaviModuleDelegate:(id)delegate;
+ (void)destroySharedNaviModule;
+ (UIViewController *)getRootViewController;
+ (void)resetAppToRootController;
+ (void)showAlert:(NSString *)title message:(NSString *)message;
+ (void)initSharedFatosNaviEngine;


- (int)getLBSX;
- (int)getLBSY;

- (void)initFatosNaviEngine;
- (FatosNaviModule *)getNaviModule;
- (GPSService *)getGpsService;
- (NSMutableDictionary *)getDriveInfo;
- (NSMutableDictionary *)getRgData;
- (void) setRouteStartListener:(id)target selector:(SEL)selector;
- (void) setRouteResultListener:(id)target selector:(SEL)selector;
- (void) setRouteCancelListener:(id)target selector:(SEL)selector;
- (void) setRouteCompleteListener:(id)target selector:(SEL)selector;

@end

//#endif /* FatosBaseAppDelegate_h */
