//
//  FatosNaviBridge.h
//  Fatos
//
//  Created by 심규빈 on 2020/02/06.
//  Copyright © 2020 유춘성. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FatosNaviBridge : NSObject

+ (void) ReRoute;
+ (void) Route:(NSString *)startLat startLon:(NSString *)startLon
       goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon;
+ (void) Route:(NSString *)startName startLat:(NSString *)startLat startLon:(NSString *)startLon
       goalName:(NSString *)goalName goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon;
+ (void) RouteViapoints:(NSString *)strJson;
+ (void) UpdateRouteParam:(NSString *)strJson;
+ (void) CancelRoute;
+ (void) DriveControl:(int)value;
+ (void) DriveSpeed:(int)value;
+ (void) DriveClose;
+ (void) Search:(id)target selector:(SEL)selector searchText:(NSString *)searchText;
+ (void) SearchSort:(id)target selector:(SEL)selector searchText:(NSString *)searchText option:(int)option;
+ (void) SearchSort:(id)target selector:(SEL)selector searchText:(NSString *)searchText curPosX:(double)curPosX curPosY:(double)curPosY option:(int)option;
+ (void) SearchAround:(id)target selector:(SEL) selector nCateID:(int)nCateID nLocalCateID:(int)nLocalCateID sLocalCateID:(NSString *)sLocalCateID
           dLongitude:(double)dLongitude dLatitude:(double)dLatitude nRadius:(int)nRadius nMaxRow:(int)nMaxRow nOffset:(int)nOffset bServer:(bool)bServer;
+ (void) SearchSpecial:(id)target selector:(SEL)selector nCateCode:(int)nCateCode curPosX:(double)curPosX curPosY:(double)curPosY;

+ (void) SearchParam:(id)target selector:(SEL)selector strParam:(NSString *)strParam;
+ (void) StartRouteGuidance:(int)index;
+ (void) StartAndoGuidance;
+ (void) StartSimulation:(int)index;
+ (void) SpeakUtterance:(NSString *)strSpeech;
+ (void) SetStartFlagYX:(double)y x:(double)x;
+ (void) SetGoalYX:(double)y strX:(double)x;
+ (void) SetSDKKey:(NSString *)sdkKey;

+ (BOOL) IsRoute;
+ (NSString *) GetRouteSummaryJson;
+ (NSString *) GetLastLocation;
+ (NSDictionary *) GetCurrentPosition;
+ (NSString *) GetPosWorldGeoCodeString:(int)x lat:(int)y;
+ (void) GetAsyncTaskPosWorldGeoCodeString:(id)target selector:(SEL)selector lon:(int)x lat:(int)y;
+ (NSString *) GetGeoCodeString:(double)lon lat:(double)lat;
+ (NSString *) GetGeoCodeStringByTile:(double)lon lat:(double)lat;
+ (NSString *) GetGeoCodeStringFromWorldByTile:(int)x y:(int)y;
+ (NSString *) GetCurrentLonX;
+ (NSString *) GetCurrentLatY;
+ (NSData *) GetMvt:(NSData *) reqMvt nGetType:(int)nGetType;
+ (NSData *) GetComplexCrossImage:(int)imgId bNight:(bool)bNight;
+ (void) SetMvt:(NSData *) reqMvt nSetType:(int)nSetType;
+ (void) SetMvt:(NSData *) reqMvt nSetType:(int)nSetType nHashKey:(uint64_t)nHashKey;
+ (void) RevertRoute;

@end

NS_ASSUME_NONNULL_END
