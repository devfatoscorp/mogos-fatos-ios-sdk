//
//  FatosInterface.h
//  Fatos
//
//  Created by Heecheon Park on 2022/02/18.
//  Copyright © 2022 유춘성. All rights reserved.
//

#ifndef FatosInterface_h
#define FatosInterface_h

#import <CoreGraphics/CoreGraphics.h>
#import <FatosNaviModule.h>
#import <GPSService.h>

NS_ASSUME_NONNULL_BEGIN

@interface FatosInterface : NSObject

//MARK: - Map Function BEGIN
//- (void) Map_RegisterMapDelegate:(id<FatosMapViewDelegate>_Nonnull) delegate;
- (void) Map_MapRefresh;
- (void) Map_MapRefreshBaseLayer:(NSArray *_Nonnull)arrBaseLayer;
- (void) Map_KsLinkRefresh;
- (void) Map_SetViewMode:(nonnull NSNumber *)mode;
- (void) Map_SetLayer:(NSDictionary *_Nonnull) baseLayerType :(NSDictionary *_Nonnull)bVisible;
- (void) Map_SetVisible:(NSArray *_Nonnull)arrObjType :(NSArray *_Nonnull)arrVisibility;
- (void) Map_SetVisibleBaseLayer:(NSArray *_Nonnull)arrObjType :(NSArray *_Nonnull)arrVisibility;
- (void) Map_SetFuelType:(NSString *_Nonnull)fuelType;
- (void) Map_SetMapRender:(bool)bRender;
- (void) Map_MapLevelIn:(bool)bAni;
- (void) Map_MapLevelOut:(bool)bAni;
- (void) Map_SetMapLevel:(float)fLevel :(nonnull NSNumber *)type;
- (void) Map_MapAuto:(bool)bAni;
- (void) Map_MapAutoOnAutoScale:(float)tilt :(float)level;
- (void) Map_MapAutoScale:(float)tilt :(float)level;
- (void) Map_MapMove:(float)fLon :(float)fLat;
- (void) Map_MapSelectRouteLine:(NSNumber *)nIndex;
- (void) Map_SelectRouteLine:(NSNumber *)nIndex;
- (void) Map_ApplySelectRouteLine:(NSNumber *)nIndex;
- (void) Map_InitMarkerImage:(NSString*)strJsonFileName :(NSString*)strFileName;
- (void) Map_SetVisibleMarkerGroup:(NSString*)strJson;
- (void) Map_MapAddMarker:(NSString*)strJson;
- (void) Map_MapSetMarker:(NSString*)strJson;
- (void) Map_MapDelMarker:(NSString*)strJson;
- (void) Map_MapDelMarkerGroup:(NSString*)strJson;
- (void) Map_ClearMarker;
- (void) Map_SetMarkerTextVisible:(bool)bVisible;
- (void) Map_SetUserLine:(NSString*)strJson;
- (void) Map_SetMapCenter:(float)hCenter :(float)vCenter;
- (void) Map_SetMapShiftCenter:(float)hCenter :(float)vCenter;
- (void) Map_SetTouchState:(int)state;
- (void) Map_SetPosWGS84:(float)fLon :(float)fLat;
- (void) Map_SetRouteLineDirectionShape:(int)nShape;
- (void) Map_SetRouteDirShapeColor:(NSDictionary *)color;
- (void) Map_SetViewAngle:(float)fAngle;
- (void) Map_SetViewTilt:(float)fTilt;
- (void) Map_SetUIViewSize:(CGSize)frame;
- (void) Map_SetBuildingOnOff:(bool)bVisible;
- (void) Map_SetBuildingHeight:(float)fHeight bVisibleOffAfterAnimation:(bool)bVisibleOffAfterAnimation;
- (void) Map_SetRouteLineMode:(int)nMode;
- (void) Map_SetFlag:(int)viewObj :(double)posX :(double)posY :(int) viaIdx;
- (void) Map_SetStartGoalFlag:(NSString *)startName :(double)startX :(double)startY
                             :(NSString *)goalName :(double)goalX :(double)goalY;
- (int) Map_GetViewMode;
- (int) Map_GetMapLevel;
- (int) Map_GetTouchState;
- (int) Map_GetDist:(CGPoint)start :(CGPoint)end;
- (NSMutableDictionary *) Map_GetMapCenter;
- (NSMutableDictionary *) Map_GetMapShiftCenter;
- (NSMutableDictionary *) Map_GetFitLevelMBR_wgs84:(NSDictionary *)dmin :(NSDictionary *)dmax;
- (NSMutableDictionary *) Map_GetFitLevelPosArray:(NSDictionary *)vscaleScreen wgs84Array:(NSArray *)wgs84Array;
- (NSArray *) Map_GetFitLevelPos;
- (NSArray *) Map_GetFitLevelPos:(CGSize) scale;
- (NSArray *) Map_GetPosWGS84;
- (float) Map_GetViewTilt;
//MARK: - Map Function END

//MARK: - Navi Function BEGIN
- (void) Navi_RegisterNaviDelegate:(id<FatosNaviModuleDelegate>_Nonnull) delegate;
- (void) Navi_InitializeNaviModule;
- (void) Navi_DestroyNaviModule;
- (void) Navi_ReRoute;
- (void) Navi_Route;
- (void) Navi_CancelRoute;
- (void) Navi_DriveControl:(int)nValue;
- (void) Navi_DriveSpeed:(int)nValue;
- (void) Navi_DriveClose;
- (void) Navi_Search:(id)target selector:(SEL)selector searchText:(NSString *)searchText;
- (void) Navi_SearchSort:(id)target selector:(SEL)selector searchText:(NSString *)searchText option:(int)option;
- (void) Navi_SearchAround:(id)target selector:(SEL) selector nCateID:(int)nCateID
              nLocalCateID:(int)nLocalCateID sLocalCateID:(NSString *)sLocalCateID
                dLongitude:(double)dLongitude dLatitude:(double)dLatitude
                   nRadius:(int)nRadius nMaxRow:(int)nMaxRow
                   nOffset:(int)nOffset bServer:(bool)bServer;
- (void) Navi_SearchSpecial:(id)target selector:(SEL)selector nCateCode:(int)nCateCode curPosX:(double)curPosX curPosY:(double)curPosY;
- (void) Navi_SearchParam:(id)target selector:(SEL)selector strParam:(NSString *)strParam;
- (void) Navi_StartRouteGuidance:(int)nIndex;
- (void) Navi_StartAndoGuidance;
- (void) Navi_StartSimulation:(int)nIndex;
- (void) Navi_SetStartFlagYX:(double)y x:(double)x;
- (void) Navi_SetGoalYX:(double)y x:(double)x;
- (bool) Navi_IsRoute;
- (NSString *) Navi_GetRouteSummaryJson;
- (NSString *) Navi_GetLastLocation;
- (NSDictionary *) Navi_GetCurrentPosition;
- (void) Navi_GetAsyncTaskPosWorldGeoCodeString:(id)target selector:(SEL)selector lon:(int)x lat:(int)y;
- (NSString *) Navi_GetGeoCodeString:(double)lon lat:(double)lat;
- (NSString *) Navi_GetGeoCodeStringByTile:(double)lon lat:(double)lat;
- (NSData *) Navi_GetMvt:(NSData *) reqMvt :(int)nGetType;
- (void) Navi_SetMvt:(NSData *) reqMvt :(int)nGetType;
- (void) Navi_SetMvt:(NSData *) reqMvt nSetType:(int)nSetType nHashKey:(uint64_t)nHashKey;
- (void) Navi_RevertRoute;
//MARK: - Navi Function END

//MARK: - Env Function BEGIN
- (void) Env_SetLanguage:(int)value;
- (void) Env_SetPathLineColor:(int)value;
- (void) Env_SetNavigationOptions:(NSArray *)array;
- (void) Env_SetMapColor:(int)value;
- (void) Env_SetSmartDrivingMode:(int)value;
- (void) Env_SetCameraOptions:(NSArray *)array;
- (void) Env_SetOperationState:(NSArray *)array;
- (void) Env_SetFacility:(NSArray *)array;
- (void) Env_SetGuidevoice:(int)value;
- (void) Env_SetRediscover:(int)value;
- (void) Env_SetWayPoint:(int)value;
- (void) Env_SetHiPass:(bool)value;
- (void) Env_SetCarType:(int)value;
- (void) Env_SetFuel:(int)value;
- (void) Env_SetSeatPosition:(int)value;
- (void) Env_SetCarvata:(int)value;
- (void) Env_SetDem:(bool)value;
- (void) Env_SetAutoCurrentPos:(bool)value;
- (void) Env_SetWalkMode:(bool)value;

- (NSString *) Env_GetPathLineColor;
- (NSString *) Env_GetLanguage;
- (NSString *) Env_GetNavigationOptions;
- (NSString *) Env_GetMapColor;
- (NSString *) Env_GetSmartDrivingMode;
- (NSString *) Env_GetCamreaOptions;
- (NSString *) Env_GetOperationState;
- (NSString *) Env_GetFacility;
- (NSString *) Env_GetGuidevoice;
- (NSString *) Env_GetRediscover;
- (NSString *) Env_GetWayPoint;
- (NSString *) Env_GetHiPass;
- (NSString *) Env_GetCarType;
- (NSString *) Env_GetFuel;
- (NSString *) Env_GetSeatPosition;
- (NSString *) Env_GetCarvata;
- (NSString *) Env_GetDem;
- (NSString *) Env_GetUUID;
- (NSString *) Env_GetVersionJson;
- (NSString *) Env_GetVersionName;
- (NSString *) Env_GetVersionCode;
- (NSString *) Env_GetAutoCurrentPos;
//MARK: - Env Function END


+ (instancetype _Nullable )sharedInstance;
- (instancetype _Nullable )init __attribute__((unavailable("init not available")));

@property(strong, nonatomic) id<FatosNaviModuleDelegate> _Nullable m_navi_module_delegate;
@end
#endif /* FatosInterface_h */
NS_ASSUME_NONNULL_END
