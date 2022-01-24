//
//  FatosDevelopBridge.h
//  Fatos
//
//  Created by 심규빈 on 2020/02/24.
//  Copyright © 2020 유춘성. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FatosDevelopBridge : NSObject

+ (void) SetDrawSDILine:(BOOL)value;
+ (void) SetSendTrackerData:(BOOL)value;

+ (NSString *) GetSimulationMode;
+ (NSString *) GetSimulGps;
+ (NSString *) GetDrawGpsPoint;

@end

NS_ASSUME_NONNULL_END
