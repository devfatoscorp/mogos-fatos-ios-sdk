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

/// 유저에 의한 재탐색 요청
+ (void) ReRoute;

/// 경로 탐색 요청
/// @param startLat 출발지 Y
/// @param startLon 출발지 X
/// @param goalLat   목적지 Y
/// @param goalLon   목적지 X
+ (void) Route:(NSString *)startLat startLon:(NSString *)startLon
       goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon DEPRECATED_MSG_ATTRIBUTE("Use SetMvt instead.");

/// 경로 탐색 요청
/// @param startName 출발지 명칭
/// @param startLat 출발지 Y
/// @param startLon 출발지 X
/// @param goalName 목적지 명칭
/// @param goalLat 목적지 Y
/// @param goalLon 목적지 X
+ (void) Route:(NSString *)startName startLat:(NSString *)startLat startLon:(NSString *)startLon
      goalName:(NSString *)goalName goalLat:(NSString *)goalLat goalLon:(NSString *)goalLon DEPRECATED_MSG_ATTRIBUTE("Use SetMvt instead.");

/// 경유지 요청
/// @param strJson 미사용
+ (void) RouteViapoints:(NSString *)strJson DEPRECATED_MSG_ATTRIBUTE("Use SetMvt instead.");

/// 경탐 옵션 변경
/// @param strJson 미사용
+ (void) UpdateRouteParam:(NSString *)strJson DEPRECATED_MSG_ATTRIBUTE("Use SetMvt instead.");

/// 경로 취소 요청
+ (void) CancelRoute;

/// 시뮬 주행 재생 / 정지 컨트롤
/// @param value
+ (void) DriveControl:(int)value DEPRECATED_ATTRIBUTE;

/// 시뮬 주행 속도 조절
/// @param value
+ (void) DriveSpeed:(int)value DEPRECATED_ATTRIBUTE;

/// 시뮬 주행 종료
+ (void) DriveClose DEPRECATED_ATTRIBUTE;

/// 통합 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param searchText 검색어
+ (void) Search:(id)target selector:(SEL)selector searchText:(NSString *)searchText;

/// 통합 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param searchText 검색어
/// @param option 0. 추천  1.명칭  2.거리
+ (void) SearchSort:(id)target selector:(SEL)selector searchText:(NSString *)searchText option:(int)option;

/// 통합 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param searchText 검색어
/// @param curPosX 현위치 X
/// @param curPosY 현위치 Y
/// @param option 0. 추천  1.명칭  2.거리
+ (void) SearchSort:(id)target selector:(SEL)selector searchText:(NSString *)searchText curPosX:(double)curPosX curPosY:(double)curPosY option:(int)option;

/// 주변 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param nCateID 카테고리 ID
/// @param nLocalCateID 로컬 카테고리 ID (int)
/// @param sLocalCateID 로컬 카테고리 ID (string)
/// @param dLongitude X
/// @param dLatitude Y
/// @param nRadius 검색 반경
/// @param nMaxRow ""
/// @param nOffset ""
/// @param bServer 서버에서 검색 결과 가져올지 여부
+ (void) SearchAround:(id)target selector:(SEL) selector nCateID:(int)nCateID nLocalCateID:(int)nLocalCateID sLocalCateID:(NSString *)sLocalCateID
           dLongitude:(double)dLongitude dLatitude:(double)dLatitude nRadius:(int)nRadius nMaxRow:(int)nMaxRow nOffset:(int)nOffset bServer:(bool)bServer;

/// 특화 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param nCateCode 카테고리 코드
/// @param curPosX 현위치 X
/// @param curPosY 현위치 Y
+ (void) SearchSpecial:(id)target selector:(SEL)selector nCateCode:(int)nCateCode curPosX:(double)curPosX curPosY:(double)curPosY;

/// 통합 검색
/// @param target 검색 결과 콜백 함수 들고있는 객체
/// @param selector 검색 결과 콜백 함수
/// @param strParam ""
+ (void) SearchParam:(id)target selector:(SEL)selector strParam:(NSString *)strParam;

/// 경로 안내 시작
/// @param index 안내 받을 경로 인덱스
+ (void) StartRouteGuidance:(int)index;

/// 안전 운전 시작
+ (void) StartAndoGuidance;

/// 시뮬 주행 시작
/// @param index 시뮬 주행할 경로 인덱스
+ (void) StartSimulation:(int)index DEPRECATED_ATTRIBUTE;

/// 음성안내 말하기
/// @param strSpeech 음성안내 텍스트
+ (void) SpeakUtterance:(NSString *)strSpeech;

/// 출발지 핀 꼽기
/// @param y 출발지 Y
/// @param x 출발지 X
+ (void) SetStartFlagYX:(double)y x:(double)x;

/// 목적지 핀 꼽기
/// @param y 목적지 Y
/// @param x 목적지 X
+ (void) SetGoalYX:(double)y strX:(double)x;

/// SDK 키 세팅
/// @param sdkKey SDK Key
+ (void) SetSDKKey:(NSString *)sdkKey;

/// 경로 존재 여부
+ (BOOL) IsRoute DEPRECATED_MSG_ATTRIBUTE("Use rg_one.ui.has_route instead");

/// 경탐 결과 요약 Json
+ (NSString *) GetRouteSummaryJson DEPRECATED_ATTRIBUTE;

/// 마지막으로 저장된 좌표
+ (NSString *) GetLastLocation DEPRECATED_ATTRIBUTE;

/// 현위치 좌표
+ (NSDictionary *) GetCurrentPosition DEPRECATED_ATTRIBUTE;

/// 지오코딩 함수
/// @param x 월드 좌표 X
/// @param y 월드 좌표 Y
+ (NSString *) GetPosWorldGeoCodeString:(int)x lat:(int)y;

/// 비동기 지오코딩 함수
/// @param target 콜백 함수 들고있는 객체
/// @param selector 콜백 함수
/// @param x 월드 좌표 X
/// @param y 월드 좌표 Y
+ (void) GetAsyncTaskPosWorldGeoCodeString:(id)target selector:(SEL)selector lon:(int)x lat:(int)y;

/// 지오코딩 함수
/// @param lon WGS84 X
/// @param lat WGS84 Y
+ (NSString *) GetGeoCodeString:(double)lon lat:(double)lat;

/// 지오코딩 함수 (타일 기반)
/// @param lon WGS84 X
/// @param lat WGS84 Y
+ (NSString *) GetGeoCodeStringByTile:(double)lon lat:(double)lat;

/// 지오코딩 함수 (타일 기반)
/// @param x 월드 좌표 X
/// @param y 월드 좌표 Y
+ (NSString *) GetGeoCodeStringFromWorldByTile:(int)x y:(int)y;

/// 현위치 X
+ (NSString *) GetCurrentLonX;

/// 현위치 Y
+ (NSString *) GetCurrentLatY;

/// 엔진쪽에서 받고 싶은 값을 동기로 요청 (요청한 mvt에 값이 생성되어서 리턴됨)
/// @param reqMvt rg_mvt (rg 명령어)
/// @param nGetType mvt enum 요청 타입 참조
+ (NSData *) GetMvt:(NSData *) reqMvt nGetType:(int)nGetType;

/// 복잡 교차로 이미지 언어오는 함수
/// @param imgId 이미지 ID
/// @param bNight 주/야간 구분
+ (NSData *) GetComplexCrossImage:(int)imgId bNight:(bool)bNight;

/// 엔진쪽 비동기 작업 요청 (경탐 / 환경 설정 등등)
/// @param reqMvt 요청마다 다른 mvt 사용
/// @param nSetType mvt enum 요청 타입 참조
+ (void) SetMvt:(NSData *) reqMvt nSetType:(int)nSetType;

/// 엔진쪽 비동기 작업 요청 (경탐 / 환경 설정 등등)
/// @param reqMvt 요청마다 다른 mvt 사용
/// @param nSetType mvt enum 요청 타입 참조
/// @param nHashKey 해쉬 키
+ (void) SetMvt:(NSData *) reqMvt nSetType:(int)nSetType nHashKey:(uint64_t)nHashKey;

/// 경로 원복
+ (void) RevertRoute;

@end

NS_ASSUME_NONNULL_END
