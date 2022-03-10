//
//  FatosNavi.h
//  FatosRNApp
//
//  Created by 유춘성 on 04/04/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FatosNaviModuleDelegate <NSObject>

- (void) onUpdateRG:(NSData *)rgMvt;
- (void) onRouteStart:(int)nType ierror:(int)ierror;
- (void) onRouteResult:(int)nType ierror:(int)ierror;
- (void) onRouteResultMvt:(NSData *) resMvt;
- (void) onRouteCancel;
- (void) onRouteComplete;
- (void) onRouteViaComplete:(NSString *)viaJson;
- (void) onMapAuto;
- (void) onInitializeStatus:(int)status value:(NSString *)value;

@end

@interface FatosNaviModule : NSObject {

  NSDictionary *routeDic;
  bool mbln_MapMoveCurrentEvent;
}
- (id)initNaviModule:(NSString *)sdkKey;
- (void) initFatosNaviEngine:(double)lon :(double)lat :(int)angle;

- (void) onUpdateRG:(NSData *)rgMvt;
- (void) OnRouteResult:(int)itype ierr:(int)ierr pCtx:(void*)pCtx isLocal:(BOOL)isLocal;

- (BOOL) InitFolder;
- (BOOL) InitServiceURL;
- (BOOL) InitResource;

- (BOOL) InitNavi:(double)lon :(double)lat :(int)angle;
- (void) ReleaseNavi;

- (void) routeExternal:(NSDictionary *)jsonDic strFeeOption:(NSString *)strFeeOption bRequest:(BOOL)bRequest;
- (void) ReRoute;
- (void) Route:(NSString *)startLat startLon:(NSString *)startLon goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon strFeeOption:(NSString *)strFeeOption;
- (void) Route:(NSString *)startName startLat:(NSString *)startLat startLon:(NSString *)startLon
       goalName:(NSString *)goalName goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon strFeeOption:(NSString *)strFeeOption;
- (void) CancelRoute;
- (void) StartSimulation:(int)index;
- (void) StartRouteGuidance:(int)index;
- (void) StartAndoGuidance;
- (void) DriveControl:(int)value;
- (void) DriveSpeed:(int)value;
- (void) DriveClose;
- (void) SetNightMode:(int)value;
- (NSString *)GetRouteSummaryJson;
- (void) SetEnableFATOSGuideWDB:(bool)val;
- (void) SetRouteAutoTime:(int)val;
- (void) SetLanguage:(int)index;
- (void) SetSDKKey:(NSString *)sdkKey;
- (NSString *)RequestTmapSearchService:(NSString *)keywordName;
- (NSString *)RequestFtsSearchService:(NSString *)keywordName option:(int)option;
- (NSString *)RequestFtsSearchService:(NSString *)keywordName curPosX:(double)curPosX curPosY:(double)curPosY option:(int)option;
- (NSString *)RequestFtsSearchAroundService:(int)nCateID nLocalCateID:(int)nLocalCateID sLocalCateID:(NSString *)sLocalCateID
                                 dLongitude:(double)dLongitude dLatitude:(double)dLatitude nRadius:(int)nRadius
                                    nMaxRow:(int)nMaxRow nOffset:(int)nOffset bServer:(bool)bServer;
- (NSData *)  RequestFtsSearchSpecialService:(int)nCateCode curPosX:(double)curPosX curPosY:(double)curPosY;
- (NSString *)RequestFtsSearchService:(NSString *)strParam;
- (void) SpeakUtterance:(NSString *)strSpeech;
- (NSString *)GetVersion;
- (void) SetAutoCurrentPos:(bool)val;
- (NSString *) GetErrorString:(int)err_code;
- (NSString *) GetGeoCodeString:(double)lon lat:(double)lat;
- (NSString *) GetPosWorldGeoCodeString:(int)x lat:(int)y bSync:(bool)bSync;
- (NSString *) GetGeoCodeStringByTile:(double)lon lat:(double)lat;
- (NSString *) GetGeoCodeStringFromWorldByTile:(int)x y:(int)y;
- (NSString *) GetLabMenu;
- (NSData *) GetMvt:(NSData *)reqMvt nGetType:(int)nGetType;
- (NSData *) GetComplexCrossImage:(int)imgId bNight:(bool)bNight;
- (void) SetMvt:(NSData *)reqMvt nSetType:(int)nSetType;
- (void) SetMvt:(NSData *) reqMvt nSetType:(int)nSetType nHashKey:(uint64_t)nHashKey;
- (void) RevertRoute;
+ (void) SetStartFlagYX:(double)y x:(double)x;
+ (void) SetGoalYX:(double)y strX:(double)x;

- (BOOL) IsRoute;
- (void) SetSendTrackerData:(bool)val;
+ (void) SetSDIFilter:(int *)pcodes pbuses:(bool*)pbuses nArray:(int)nArray;
+ (void) OnMapMoveCurrentTimer;
+ (double) getCurrentLonX;
+ (double) getCurrentLatY;
+ (int) getClientSite;
+ (BOOL) IsInitNaviEngine;
+ (void) setStartFlagYX:(double)y x:(double)x;
+ (void) setGoalYX:(double)y strX:(double)x;
+ (double) getSelectStartFlagLonX;
+ (double) getSelectStartFlagLatY;
+ (double) getDestLonX;
+ (double) getDestLatY;

// 나비모듈 싱글턴 테스트 [Swift에서 국가선택 이후 재초기화 기능 점검]
+ (instancetype)sharedInstance;
+ (void)destroySharedInstance;
@property(strong, nonatomic) id<FatosNaviModuleDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
