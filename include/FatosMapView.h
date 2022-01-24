//
//  FatosMapView.h
//  FatosRNApp
//
//  Created by 유춘성 on 13/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FatosMapViewDelegate <NSObject>
- (void) MapLevelUpdateListener:(float)fLevel;
- (void) PosWorldLocationUpdateListener:(NSString *)strLocation;
- (void) TouchMoveModeListener:(int)nMode;
- (void) MapLongTouchListener:(int)x y:(int)y;
- (void) UpdatePickerInfo:(NSString *)strID nLong:(int)nLong nLat:(int)nLat;
- (void) UpdateMapAngle:(float)fAngle;
- (void) UpdateViewMode:(int)nViewMode;
- (void) MapReadyListener;
- (void) FlingAnimationEndListener;
@end

@interface FatosMapView : GLKView {
  
};
- (void) mapRefresh;
- (void) mapRefreshBaseLayer:(NSArray *)arrBaseLayer;
- (void) ksLinkRefresh;

- (void) componentWillUnmount;
- (void) viewSizeUpdate;
- (void) panGesture:(UIPanGestureRecognizer *)gestureRecognizer inView:(UIView*)view;
- (void) setViewMode:(NSNumber *)mode;
- (void) setAirlineMode:(NSDictionary *) baseLayerType bVisible:(NSDictionary *)bVisible;
- (void) setMapLevelIn:(int)nType;
- (void) setMapLevelOut:(int)nType;
- (void) setMapLevel:(float)fLevel nType:(int)nType;
- (float) getMapLevel;
- (void) setMapAuto:(double)fLonX fLatY:(double)fLatY;
- (void) setMapAuto:(double)fLonX fLatY:(double)fLatY withAnimation:(bool)withAnimation;
- (void) setMapAutoOnAutoScale:(double)fLonX fLatY:(double)fLatY tilt:(float)tilt level:(float)level withAnimation:(bool)withAnimation;
- (void) setMapMove:(double)fLonX fLatY:(double)fLatY;
- (int) GetViewMode;
- (float) GetViewAngle;
- (float) GetViewTilt;
- (void) SetViewAngle:(float)angle;
- (void) SetViewTilt:(float)tilt;
- (int) getTouchState;
- (BOOL) IsFling;
- (void) SetVisible:(NSArray *)arrObjType arrVisibility:(NSArray *)arrVisibility;
- (void) SetVisibleBaseLayer:(NSArray *)arrObjType arrVisibility:(NSArray *)arrVisibility;
- (void) SetBuildingOnOff:(BOOL)bVisible;
- (void) SummaryMapSetting:(NSDictionary *)lineColor xScale:(float)xScale yScale:(float)yScale
                   hCenter:(float)hCenter vCenter:(float)vCenter blnViewMode:(BOOL)blnViewMode;
- (void) DefaultMapSetting;
- (BOOL) isSummaryMode;
- (BOOL) SetBuildingHeight:(float)fHeight bVisibleOffAfterAnimation:(BOOL)bVisibleOffAfterAnimation;


- (void) onAutoScale:(float)tilt level:(float)level;
/*
  mgl_esview_define.h - sjpark
 enum PATH_ROUTE_NOCUT_TYPE
 {
     PATH_ROUTE_NOCUT_FASTEST,               //Temporary Color : Red     - sjpark
     PATH_ROUTE_NOCUT_FASTEST_NO_CHARGE,     //Temporary Color : Orange  - sjpark
     PATH_ROUTE_NOCUT_SHORTEST,              //Temporary Color : Gold    - sjpark
     PATH_ROUTE_NOCUT_SHORTEST_NO_CHARGE,    //Temporary Color : Bumblebee - sjpark

     PATH_ROUTE_NOCUT_DEFAULT,              //Temporary Color : Prism Top Color - Green
 };
*/
- (void) MapSelectRouteLine:(int)nSelected nSelectedType:(int)nSelectedType;
- (void) ApplySelectRouteLine:(int)nSelected;
- (void) SetFlagName:(int)ObjType pszName:(const char *)pszName viaIndex:(int)viaIndex;
- (void) SetFlagPosWorld:(int)ObjType wpX:(int)wpX wpY:(int)wpY viaIndex:(int)viaIndex;
- (void) SetPosWGS84:(double)xlon ylat:(double)ylat;
- (NSArray *) GetPosWGS84;
- (int)  GetDist:(CGPoint)start end:(CGPoint)end;
- (void) GetPosWorldFromScreen:(float)fCenterX fCenterY:(float)fCenterY nMapCurPosX:(int*)nMapCurPosX nMapCurPosY:(int*)nMapCurPosY;
- (void) ConvWorldtoWGS84:(int)x y:(int)y xlon:(double*)xlon ylat:(double*)ylat;

- (void) onStartGoalSet:(int)sx sy:(int)sy sname:(const char*)sname gx:(int)gx gy:(int)gy gname:(const char*)gname;
- (void) SetEnvRouteLineColor:(int)nIndex;
- (void) SetRouteLineColor:(int)nContextIndex strLineColor:(NSString *)strLineColor strOutLineColor:(NSString *)strOutLineColor;
- (void) SetCarvata:(int)nIndex;
- (void) SetDem:(bool)val;
- (void) SetWalkMode:(bool)val;

- (int) InitMarkerImage:(NSString *)strJsonFileName strFilaPath:(NSString *)strFileName;
- (BOOL) SetVisibleMarkerGroup:(NSString *)strJson;
- (BOOL) AddMarker:(NSString *)strJson;
- (BOOL) SetMarker:(NSString *)strJson;
- (BOOL) DelMarker:(NSString *)strJson;
- (BOOL) DelMarkerGroup:(NSString *)strJson;
- (void) ClearMarker;
- (void) SetMarkerTextVisible:(bool)bVisible;
- (void) SetUserLine:(NSString *)strJson;
- (void) SetMapCenter:(float)hCenter vCenter:(float)vCenter;
- (void) GetMapCenter:(float*)hCenter vCenter:(float*)vCenter;
- (void) SetMapShiftCenter:(float)hCenter vCenter:(float)vCenter;
- (void) GetMapShiftCenter:(float*)hCenter vCenter:(float*)vCenter;
- (void) SetTouchState:(int)state;
- (void) SetRouteLineMode:(int)mode;
- (void) SetUIViewSize:(CGSize)frame;
- (void) SetFuelType:(NSString *)fuelType;
- (NSArray *) GetFitLevelPos;
- (NSArray *) GetFitLevelPos:(CGSize)scale;
- (BOOL) GetFitLevelMBR_wgs84:(CGPoint)dmin dmax:(CGPoint)dmax fLevel:(float*) fLevel;
- (BOOL) GetFitLevelPosArray:(CGPoint)vscaleScreen fLevel:(float*)fLevel wgs84Center:(CGPoint*)wgs84Center wgs84Array:(NSArray*)wgs84Array;
- (BOOL) SetDrawSDILine:(bool)val;
- (BOOL) SetDrawCandidateLink:(bool)val;
- (BOOL) SetRouteLine3DShape:(int)shape;
- (BOOL) SetRouteLine3DColor:(NSDictionary *)top bottom:(NSDictionary *)bottom;
- (BOOL) SetRouteLine3DScale:(int)scale isZoomIn:(bool)isZoomIn;
- (BOOL) SetRouteLineDirectionShape:(int)shape;
- (BOOL) SetRouteDirShapeColor:(NSDictionary *)color;


@property(strong, nonatomic) CADisplayLink* displayLink;
@property(weak, nonatomic) id<FatosMapViewDelegate> delegate;
@property(nonatomic, assign) BOOL isRender;

+ (FatosMapView *)sharedMapView;

@end

NS_ASSUME_NONNULL_END
