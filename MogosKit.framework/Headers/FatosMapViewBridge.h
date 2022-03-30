//
//  FatosMapViewBridge.h
//  Fatos
//
//  Created by 심규빈 on 2020/02/06.
//  Copyright © 2020 유춘성. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface FatosMapViewBridge : NSObject

+ (void) MapRefresh;
+ (void) MapRefreshBaseLayer:(NSArray *)arrBaseLayer;
+ (void) KsLinkRefresh;
+ (void) setViewMode:(nonnull NSNumber *)mode;
+ (void) setLayer:(NSDictionary *) baseLayerType bVisible:(NSDictionary *)bVisible;
+ (void) SetVisible:(NSArray *)arrObjType arrVisibility:(NSArray *)arrVisibility;
+ (void) SetVisibleBaseLayer:(NSArray *)arrObjType arrVisibility:(NSArray *)arrVisibility;
+ (void) SetFuelType:(NSString *)fuelType;
+ (void) SetMapRender:(bool)bRender;
+ (void) MapLevelIn:(nonnull NSNumber *)type;
+ (void) MapLevelOut:(nonnull NSNumber *)type;
+ (void) setMapLevel:(float)fLevel type:(nonnull NSNumber *)type;
+ (void) MapAuto;
+ (void) MapAuto:(bool)withAnimation;
+ (void) MapAuto:(int)nViewMode
        fScreenX:(float)fScreenX fScreenY:(float)fScreenY fLevel:(float)fLevel
           fTilt:(float)fTilt bAni:(bool)bAni bAutoState:(bool)bAutoState;
+ (void) SetMapScene:(int)nViewMode posX:(double)posX posY:(double)posY
            fScreenX:(float)fScreenX fScreenY:(float)fScreenY fLevel:(float)fLevel
               fTilt:(float)fTilt bAni:(bool)bAni bAutoState:(bool)bAutoState;
+ (void) MapAutoOnAutoScale:(float)tilt level:(float)level;
+ (void) MapAutoScale:(float)tilt level:(float)level;
+ (void) MapMove;
+ (void) MapMove:(float)fLonX fLatY:(float)fLatY;
+ (void) MapSelectRouteLine:(int)nIndex;
+ (void) SummaryMapSetting:(NSDictionary *)lineColor xScale:(float)xScale yScale:(float)yScale
                   hCenter:(float)hCenter vCenter:(float)vCenter blnViewMode:(BOOL)blnViewMode;
+ (void) DefaultMapSetting;
+ (void) SelectRouteLine:(int)index;
+ (void) ApplySelectRouteLine:(int)index;
+ (void) InitMarkerImage:(NSString*)strJsonFileName strFileName:(NSString*)strFileName;
+ (void) SetVisibleMarkerGroup:(NSString*)strJson;
+ (void) AddMarker:(NSString*)strJson;
+ (void) SetMarker:(NSString*)strJson;
+ (void) DelMarker:(NSString*)strJson;
+ (void) DelMarkerGroup:(NSString*)strJson;
+ (void) ClearMarker;
+ (void) SetMarkerTextVisible:(bool)bVisible;
+ (void) SetUserLine:(NSString*)strJson;
+ (void) SetMapCenter:(float)hCenter vCenter:(float)vCenter;
+ (void) SetMapShiftCenter:(float)hCenter vCenter:(float)vCenter;
+ (void) SetTouchState:(int)state;
+ (void) SetPosWGS84:(double)xlon ylat:(double)ylat;
+ (void) SetRouteLine3DShape:(int)shape;
+ (void) SetRouteLine3DColor:(NSDictionary *)top bottom:(NSDictionary *)bottom;
+ (void) SetRouteLine3DScale:(int)scale isZoomIn:(bool)isZoomIn;
+ (void) SetRouteLineDirectionShape: (int)shape;
+ (void) SetRouteDirShapeColor:(NSDictionary *)color;
+ (void) SetViewAngle:(float)angle;
+ (void) SetViewTilt:(float)tilt;
+ (void) SetUIViewSize:(CGSize)frame;
+ (void) SetBuildingOnOff:(BOOL)bVisible;
+ (void) SetBuildingHeight:(float)fHeight bVisibleOffAfterAnimation:(BOOL)bVisibleOffAfterAnimation;
+ (void) OnStartGoalSet:(int)sx sy:(int)sy sname:(const char*)sname gx:(int)gx gy:(int)gy gname:(const char*)gname;
+ (void) SetFlagPosWorld:(int)ObjType wpX:(int)wpX wpY:(int)wpY viaIndex:(int)viaIndex;
+ (void) SetRouteLineMode:(int)mode;
+ (int) GetViewMode;
+ (int) GetMapLevel;
+ (int) GetTouchState;
+ (int) GetDist:(CGPoint)start end:(CGPoint)end;

+ (NSMutableDictionary *) GetPosWorldFromScreen:(float)fCenterX fCenterY:(float)fCenterY;
+ (NSMutableDictionary *) ConvWorldtoWGS84:(int)x y:(int)y;
+ (NSMutableDictionary *) GetMapCenter;
+ (NSMutableDictionary *) GetMapShiftCenter;
+ (NSMutableDictionary *) GetPosWorldtoWGS84FromScreen:(float)fCenterX fCenterY:(float)fCenterY;
+ (NSMutableDictionary *) GetFitLevelMBR_wgs84:(NSDictionary *)dmin dmax:(NSDictionary *)dmax;
+ (NSMutableDictionary *) GetFitLevelPosArray:(NSDictionary *)vscaleScreen wgs84Array:(NSArray *)wgs84Array;
+ (NSArray *) GetFitLevelPos;
+ (NSArray *) GetFitLevelPos:(CGSize) scale;
+ (NSArray *) GetPosWGS84;
+ (NSArray *) GetPosWGS84FromScreen:(float)fCenterX fCenterY:(float)fCenterY;

+ (float) GetViewTilt;
@end

NS_ASSUME_NONNULL_END
