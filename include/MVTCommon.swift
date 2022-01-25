//
//  CommonStructs.swift
//  fatoshi-swift
//
//  Created by Heecheon Park on 2021/06/10.
//

import Foundation
import SwiftProtobuf

let MVT_CONFIG_VERSION = 20210605
let MVT_RG_VERSION = 20210605
let MVT_VOICE_VERSION = 20210605

typealias mvt_geom_type = VectorTile_Tile.GeomType
typealias mvt_vertex32 = [VERTEX32]
typealias mvt_vertex32d = [VERTEX32D]
typealias mvt_lines32  = [mvt_vertex32]
typealias mvt_lines32d  = [mvt_vertex32d]
typealias mvt_poloygons32d = (mvt_vertex32d, [mvt_vertex32d])

let MGL_WORLD_SHIFT_X           = 180
let MGL_WORLD_SHIFT_Y           = 180
let MGL_WORLD_SHIFT_X_REAL      = 180.0
let MGL_WORLD_SHIFT_Y_REAL      = 180.0
let MGL_WORLD_BASE              = 4096
let MGL_WORLD_UNIT              = 1048576
let MGL_WORLD_UNIT_REAL         = 1048576.0
let MGL_WORLD_UNIT_REAL_REVERS  = 0.000000953674316
let EARTH_RADIUS                = 6371.0 * 1000.0

public enum mvt_operation: UInt32, CaseIterable {
    case mvt_moveto_t = 1
    case mvt_lineto_t = 2
    case mvt_closepath_t = 7
}

public enum mvt_coordinate: UInt32, CaseIterable {
    case mvt_coordinate_none = 0
    case mvt_tile_t          = 1
    case mvt_world_t         = 2
    case mvt_lonlat_t        = 3
}

public enum site_type: Int32, CaseIterable {
    case none_t       = 0 //
    case fatos_t      = 1 //
    case naver_link_t = 2 //
    case max_t        = 3
}

public enum express_link_type: Int32, CaseIterable {
    case none_t         = 0 //
    case service_area_t = 1 //  휴게소
    case rest_area_t    = 2 //  졸음 쉼터
    case interchange_t  = 3 //  인터체인지
    case junction_t     = 4 //  정션
    case tollgate_t     = 5 //  톨게이트
    case via_t          = 6 //  경유지
    case express_in_t   = 7 //  고속도로 진입
    case max_t          = 8
}

public enum route_request_type: Int32, CaseIterable {
    case none_t                 = 0   // 사용안함
    case route_first_t          = 1   // 초탐
    case route_re_t             = 2   // 이탈 재탐
    case route_user_t           = 3   // 사용자 재탐
    case route_periodic_t       = 4   // 주기적 재탐
    case route_alternative_t    = 5   // 대안 경로
    case route_user_first_t     = 6   // 옵션 변경 재탐
    case route_user_add_t       = 7   // 경로 옵션 추가
    case route_continue_t       = 8   // 경로 이어 보기
    case route_manual_t         = 9   // 초탐 : 경로 지점이 다름
    
    case voice_tts_send_t       = 101  // TTS 내용 전달
    case voice_wave_send_t      = 102  // 음원 전달
    case config_set_t           = 201  // 설정값 셋팅
    case route_revert_t         = 301  // 경로 원복
	case route_change_first_t   = 302  // 맵매칭 경로를 첫번째 경로로 설정
    case route_summary_t        = 303  // 경로요약 진입
    case route_summary_cancel_t = 304  // 경로요약 취소
    
    case mvt_command_t          = 10000 // mvt 명령어 사용
}

public enum rg_command_type: Int32, CaseIterable {
    case none_t                 = 0
    case is_last_route_t        = 1     // 마지막 경로 존재 여부 얻기 (is_last_route_st 참조)
    case load_last_route_t      = 2     // 마지막 경로 로딩 (인자 없음)
    case rg_pause_t             = 3     // 경로 안내 일시 정지 (인자 없음)
    case rg_resume_t            = 4     // 경로 안내 재개 (인자 없음)
    case waypoint_pass_t        = 5     // 경유지 통과 (인자 없음)
    case remove_last_route_t    = 6     // 마지막 경로 제거 (인자 없음)
}

public enum tollgate_type: Int32, CaseIterable {
    // TG 타입 (0:미정의, 1:개방, 2:폐쇄, 3:원톨)
    case none_t  = 0
    case open_t  = 1
    case close_t = 2
    case one_t   = 3
    case max_t
}

public enum service_area_type: Int, CaseIterable {
    case truck                  = 0             // 화물차 휴게소 (ui show)
    case sleeping               = 1             // 수면실 (ui show)
    case shower                 = 2             // 샤워실 (ui show)
    case laundry                = 3             // 세탁실 (ui show)
    case car_wash               = 4             // 세차장 (ui show)
    case repair_shop            = 5             // 정비소 (ui show)
    case pharmacy               = 6             // 약국 (ui show)
    case restaurant             = 7             // 음식점
    case convenience_store      = 8             // 편의점
    case toilet                 = 9             // 화장실
    case lowest_gas_station     = 10            // 최저가 주유소
    case ev_charging_station    = 11            // 전기차 충전소
}

public enum sdi_display_type: Int32, CaseIterable {
    case none_t = 0  //
    case main_t = 1  // main type
    case sub_t  = 2  // sub type
    case max_t
}

public enum sdi_visibility_type: Int32, CaseIterable {
    case none_t = 0
    case show_t = 1
    case hide_t = 2
    case max_t
}

public enum sdi_type: Int32, CaseIterable {
    case none_t = 0                    // 사용안함
    case cam_fixed_speed_t             // 1    = 고정식 카메라 (과속단속)
    case cam_fixed_bus_speed_t         // 2    = 고정식 카메라 (과속및버스전용단속)
    case cam_fixed_360_t               // 3    = 고정식 카메라 (360도카메라)
    case cam_fixed_section_t           // 4    = 고정식 카메라 (구간단속 sp)
    case cam_fixed_section_end_t       // 5    = 고정식 카메라 (구간 or 차로 단속 ep)
    case cam_fixed_load_bad_t          // 6    = 고정식 카메라 (적재불량단속)
    case cam_fixed_sign_unattached_t   // 7    = 고정식 카메라 (표지판미부착카메라)
    case cam_fixed_bux_lane_t          // 8    = 버스전용차로단속카메라 (전용차로단속)
    case cam_mobile_t                  // 9    = 이동식 카메라 (안내포인트)
    case cam_locad_over_t              // 10    = 과적위반단속카메라 (계근측정불응도주카메라)
    case dvc_load_over_scale_t         // 11    = 과적위반단속카메라 (중량측정장치)
    case dvc_recognition_car_number_t  // 12    = 차량번호인식장치 (차량번호인식장치)
    case dvc_collect_traffic_t         // 13    = 교통정보수집장치 (통행시간산정카메라)
    case cam_violation_signal_t        // 14    = 신호위반(다기능)카메라 (신호위반(다기능)카메라)
    case cam_violation_signal_mockup_t // 15    = 신호위반(다기능)카메라 (모형 카메라)
    case cam_parking_stop_t            // 16    = 주정차단속 카메라
    case cam_side_of_road_t            // 17    = 갓길감시 카메라
    case cam_cut_in_t                  // 18    = 끼어들기단속 카메라
    case cam_variable_lane_t           // 19    = 가변차로단속 카메라
    case cam_tail_t                    // 20    = 꼬리물기단속카메라
    case tunnel_t                      // 21    = 터널
    case black_ice_start_t             // 22    = 결빙구간 시점
    case black_ice_end_t               // 23    = 결빙구간 종점
    case toll_open_t                   // 24    = 개방형 톨게이트
    case toll_in_t                     // 25    = 폐쇄형(진입) 톨게이트
    case toll_out_t                    // 26    = 폐쇄형(진출) 톨게이트
    case reserve_27_t                  // 27    = 사용안함
    case cctv_t                        // 28    = 방범용CCTV
    case restarea_t                    // 29    = 졸음쉼터
    case accident_t                    // 30    = 사고다발지역
    case sharp_curve_t                 // 31    = 급커브지역
    case fog_area_t                    // 32    = 안개지역
    case school_zone_in_t              // 33    = 어린이보호구역 시점
    case school_zone_out_t             // 34    = 어린이보호구역 종점
    case cross_railroad_t              // 35    = 철길 건널목
    case hump_t                        // 36    = 과속방지턱
    case water_danger_in_t             // 37    = 위수지역(관제용) 진입링크
    case water_danger_area_t           // 38    = 위수지역(관제용) 실제링크
    case height_limit_t                // 39    = 트럭 높이제한
    case weight_limit_t                // 40    = 트럭 중량제한
    case height_weight_limit_t         // 41    = 트럭 높이,중량제한

    // CDG 추가 (이미지 별도 처리 하기 위해 별도 분리함)
    case cdg_sharp_curve_left_t       // 42    = 왼쪽 급커브지역
    case cdg_sharp_curve_right_t      // 43    = 오른쪽 급커브지역
    case cdg_winding_left_t           // 44    = 왼쪽으로 시작한 구불구불 지역
    case cdg_winding_right_t          // 45    = 오른쪽으로 시작한 구불구불 지역
    case cdg_zigzag_left_t            // 46    = 왼쪽으로 시작한 지그재그 지역
    case cdg_zigzag_right_t           // 47    = 오른쪽으로 시작한 지그재그 지역
    case cdg_narrows_t                // 48    = 좁아지는 도로
    case cdg_narrows_left_t           // 49    = 왼쪽 좁아지는 도로
    case cdg_narrows_right_t          // 50    = 오른쪽 좁아지는 도로
    case cdg_narrows_bridge_t         // 51    = 교량 좁아지는 도로
    case cdg_cross_railway_t          // 52    = 철길 건널목
    case cdg_cross_railway_barriers_t // 53    = 장벽이있는 철길 건널목
    case cdg_cross_railway_junction_t // 54    = 교차로 근처 철길 건널목
    case cdg_width_limit_t            // 55    = 차량  폭(2.5m)제한
    case cdg_height_limit_t           // 56    = 차량 높이(2.5m)제한
    case cdg_steep_upwards_t          // 57    = 오르막 도로
    case cdg_steep_downwards_t        // 58    = 내리막 도로
    case cdg_slippery_road_t          // 59    = 미끄러운 길
    case cdg_loose_surface_t          // 60    = 느스한 표면 도로
    case cdg_falling_rocks_t          // 61    = 낙석지역
    case cdg_warning_sign_t           // 62    = 경고 표시
    case cdg_protected_child_t        // 63    = 어린이보호구역
    case cdg_animal_crossing_t        // 64    = 동물의 횡단 주의 구간
    case cdg_no_overtaking_t          // 65    = 추월 금지 시작
    case cdg_end_restriction_t        // 66    = 제한 종료
    case cdg_speed_hump_t             // 67    = 과속방지턱
    case cdg_accident_t               // 68    = 사고다발지역
    case cdg_cam_redlight_t           // 69    = 레드라이트 카메라(브레이크등 체크)    ,     300m, 100m, 0m, -100m 안내 (0m를 통과하면 100m 유지)
    case cdg_cam_lanechange_t         // 70    = 차선 변경 금지 카메라 (후방)    ,     300m, 100m, 0m, -100m 안내 (0m를 통과하면 100m 유지)

    case max_t // SDI 코드 개수
}

public struct mvt_tile_box {
    var is_layer    : Bool      = false
    var numTiles    : UInt32    = 0
    var mbr         : MBR32D      = MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0))
    var diff        : VERTEX32D   = VERTEX32D(dx: 0, dy: 0)
    var zoom        : Int       = 0
    var column      : Int       = 0
    var row         : Int       = 0
    
    mutating public func setMBR(mbr: MBR32D) -> Void {
        self.mbr = mbr
    }
    
    mutating public func setDiff(diff: VERTEX32D) -> Void {
        self.diff = diff
    }
    
    mutating public func clear() -> Void {
        self.is_layer    = false
        self.numTiles    = 0
        self.mbr         = MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0))
        self.diff        = VERTEX32D(dx: 0, dy: 0)
        self.zoom        = 0
        self.column      = 0
        self.row         = 0
        
    }
}

public struct mvt_geoms {
    
    var geom_type   : mvt_geom_type     = .unknown
    var length      : Double            = 0
    var coordinate  : mvt_coordinate    = mvt_coordinate.mvt_coordinate_none
    var mbr         : MBR32D            = MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0))
    var points      : mvt_vertex32d     = [VERTEX32D]()
    var lines       : mvt_lines32d         = [mvt_vertex32d]()
    var polygons    : [mvt_poloygons32d]   = [mvt_poloygons32d]()
    
    mutating public func clear() -> Void {
        self.geom_type = .unknown
        self.coordinate = .mvt_coordinate_none
        self.length = 0
        self.points.removeAll()
        self.lines.removeAll()
        self.polygons.removeAll()
    }
}

public struct MBR32D {
    var min : VERTEX32D
    var max : VERTEX32D
    
    mutating public func reset() -> Void {
        min.reset()
        max.dx = Double.greatestFiniteMagnitude
        max.dy = Double.greatestFiniteMagnitude
    }
}

public struct MBR32 {
    var min : VERTEX32
    var max : VERTEX32
    
    mutating public func reset() -> Void {
        min.x = Int.max
        min.y = Int.max
        max.x = 0
        max.y = 0
    }
}

public struct VERTEX32 {
    var x : Int
    var y : Int
    
    mutating public func reset() -> Void {
        x = 0
        y = 0
    }
}

public struct VERTEX32D {
    var dx : Double
    var dy : Double
    
    mutating public func reset() -> Void {
        dx = 0
        dy = 0
    }
}

func CheckCmdId(cmdIdCount: UInt32, cmdId: Int, count: Int) -> Void {
    let cmdId2 = cmdIdCount & 0x7
    let cmdCount2 = cmdIdCount >> 3
    if (cmdId != cmdId2 || count != cmdCount2) {
        assertionFailure("Invalid cmd id.")
    }
}

func mglDegreeToWorldX(f: Double) -> Int {
    return Int(((Double(MGL_WORLD_SHIFT_X) + f) * MGL_WORLD_UNIT_REAL) + 0.5)
}

func mglDegreeToWorldY(f: Double) -> Int {
    return Int(((Double(MGL_WORLD_SHIFT_Y) + f) * MGL_WORLD_UNIT_REAL) + 0.5)
}

func mglWorldToDegreeX(i: Int) -> Double {
    return ((Double(i) * MGL_WORLD_UNIT_REAL_REVERS) - Double(MGL_WORLD_SHIFT_X) )
}

func mglWorldToDegreeY(i: Int) -> Double {
    return ((Double(i) * MGL_WORLD_UNIT_REAL_REVERS) - Double(MGL_WORLD_SHIFT_Y) )
}

func zigZagDecode(_ n: Int) -> Int {
    return (n >> 1) ^ (-(n & 1))
}

func zigZagEncode(_ n: Int) -> Int {
    return (n << 1) ^ (n >> 31)
}

func zigZagDecode32(_ n: UInt32) -> UInt32 {
    return UInt32((n >> 1) ^ UInt32((-Int32((n & 1)))))
}

func CheckWindingi(pts: mvt_vertex32) -> Double {
    var total : Double = 0
    for i in 0..<pts.count {
        let i2 = (i + 1) % pts.count
        let val : Double = Double((pts[i2].x - pts[i].x) * (pts[i2].y - pts[i].y))
        total += val
    }
    return -total
}

func tilex2long(x: Int, z: Int) -> Double {
    return Double(x) / pow(2.0, Double(z)) * 360.0 - 180
}

func tiley2lat(y: Int, z: Int) -> Double {
    let n : Double = pow(2.0, Double(z))
    let ymax : Int = 1 << z
    let y = ymax - y - 1
    let latRad = atan(sinh( Double.pi * (1 - (2.0 * Double(y) / n))))
    return 180.0 / Double.pi * latRad
}

func long2tilex(lon: Double, z: Int) -> Int {
    return Int(floor((lon + 180.0) / 360.0 * pow(2.0, Double(z))))
}

func lat2tiley(lat: Double, z: Int) -> Int {
    let partial = (1.0 - log(tan(lat * Double.pi / 180.0) + 1.0 / cos(lat * Double.pi / 180.0)) / Double.pi)
    if (partial.isNormal) {
        var y : Int = Int(floor(partial / 2.0 * pow(2.0, Double(z))))
        var ymax = 1 << z
        y = ymax - y - 1
        return y
    } else { return 0 }
}

//    private func mbr_extent(mbr: inout MBR, tileZoom: inout UInt32, tileColumn: inout UInt32, tileRow: inout UInt32) -> Int32 {
func mbr_extent(mbr: inout MBR32D, layer: inout VectorTile_Tile.Layer) -> Int32 {
    var extent : Int = 4096
    var cx, cy, max_width : Int
    var wp1, wp2, wpCenter : VERTEX32D
    
    wp1 = VERTEX32D(dx: mbr.min.dx, dy: mbr.min.dy)
    wp2 = VERTEX32D(dx: mbr.max.dx, dy: mbr.min.dy)
    cx = Int(geoRoughMeters(start_x: wp1.dx, start_y: wp1.dy, end_x: wp2.dx, end_y: wp2.dy))
    
    wp1 = VERTEX32D(dx: mbr.min.dx, dy: mbr.min.dy)
    wp2 = VERTEX32D(dx: mbr.min.dx, dy: mbr.max.dy)
    cy = Int(geoRoughMeters(start_x: wp1.dx, start_y: wp1.dy, end_x: wp2.dx, end_y: wp2.dy))
    
    max_width = cx > cy ? cx : cy
    layer.tz = 0
    
    for i in stride(from: 14, to: -1, by: -1) {
        layer.tz = UInt32(i)
        var width : Int = 40075016
        width = width >> i
        if (max_width <= width) { break }
    }
    
    let x = mbr.min.dx + (mbr.max.dx - mbr.min.dx) / 2
    let y = mbr.min.dy + (mbr.max.dy - mbr.min.dy) / 2
    
    wpCenter = VERTEX32D(dx: x, dy: y)
    
    layer.tx = UInt32(long2tilex(lon: wpCenter.dx, z: Int(layer.tz)))
    layer.ty = UInt32(lat2tiley(lat: wpCenter.dy, z: Int(layer.tz)))
    
    extent = 4096 << (14 - layer.tz)
    
    return Int32(extent)
}

func mbr_extent(mbr: inout MBR32, tileZoom: inout UInt32, tileColumn: inout UInt32, tileRow: inout UInt32) -> Int32 {
    var extent : Int = 4096
    var cx, cy, max_width : Int
    var wp1, wp2, wpCenter : VERTEX32
    
    wp1 = VERTEX32(x: mbr.min.x, y: mbr.min.y)
    wp2 = VERTEX32(x: mbr.max.x, y: mbr.min.y)
    cx = Int(geoRoughMeters(start_x: mglWorldToDegreeX(i: wp1.x),
                            start_y: mglWorldToDegreeY(i: wp1.y),
                            end_x: mglWorldToDegreeX(i: wp2.x),
                            end_y: mglWorldToDegreeY(i: wp2.y)))
    
    wp1 = VERTEX32(x: mbr.min.x, y: mbr.min.y)
    wp2 = VERTEX32(x: mbr.min.x, y: mbr.max.y)
    cy = Int(geoRoughMeters(start_x: mglWorldToDegreeX(i: wp1.x),
                            start_y: mglWorldToDegreeY(i: wp1.y),
                            end_x: mglWorldToDegreeX(i: wp2.x),
                            end_y: mglWorldToDegreeY(i: wp2.y)))
    
    max_width = cx > cy ? cx : cy
    tileZoom = 0
    
    for i in stride(from: 14, to: -1, by: -1) {
        tileZoom = UInt32(i)
        var width : Int = 40075016
        width = width >> i
        if (max_width <= width) { break }
    }
    
    let x = mbr.min.x + (mbr.max.x - mbr.min.x) / 2
    let y = mbr.min.y + (mbr.max.y - mbr.min.y) / 2
    
    wpCenter = VERTEX32(x: x, y: y)
    
    tileColumn = UInt32(long2tilex(lon: mglWorldToDegreeX(i: wpCenter.x), z: Int(tileZoom)))
    tileRow = UInt32(lat2tiley(lat: mglWorldToDegreeY(i: wpCenter.y), z: Int(tileZoom)))
    
    extent = 4096 << (14 - tileZoom)
    
    return Int32(extent)
}


func geoRoughMeters(start_x: Double, start_y: Double, end_x: Double, end_y: Double) -> Double {
    let deltaLon = Degree2Rad(degree: end_x - start_x)
    let deltaLat = Degree2Rad(degree: end_y - start_y)
    let a = pow(sin(deltaLat / 2.0), 2.0) + cos(Degree2Rad(degree: start_y)) * cos(Degree2Rad(degree: end_y)) * pow(sin(deltaLon / 2.0), 2.0)
    let c = 2.0 * atan2(sqrt(a), sqrt(1.0 - a))
    return EARTH_RADIUS * c
}

func Degree2Rad(degree: Double) -> Double {
    let coef: Double = Double.pi / 180.0
    return degree * coef
}

func Rad2Degree(rad: Double) -> Double {
    let coef: Double = 180.0 / Double.pi
    return rad * coef
}

extension VectorTile_Tile.Layer {
    public func get_key_values(tags: [UInt32]) -> [String:String] {
        let keys = self.keys
        let values : [Any] = self.values.map { value -> Any in
            if value.hasStringValue { return value.stringValue }
            else if value.hasIntValue { return Int(value.intValue) }
            else if value.hasBoolValue { return value.boolValue }
            else if value.hasDoubleValue { return value.doubleValue }
            else if value.hasFloatValue { return Double(value.floatValue) }
            else if value.hasUintValue { return UInt(value.uintValue) }
            else if value.hasSintValue { return Int(value.sintValue) }
            else { return "" }
        }
        var tagMap : [String:String] = [:]
        if values.count == 0,
           keys.count == 0 { return tagMap }
        for tagIndex in stride(from: 0, to: tags.count-1, by: 2) {
            let keyIndex = Int(tags[tagIndex])
            let valueIndex = Int(tags[tagIndex + 1])
            tagMap["\(keys[keyIndex])"] = "\(values[valueIndex])"
        }
        return tagMap
    }
    
    mutating public func add_key_values(key: String, value: String, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.stringValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Float, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.floatValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Double, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.doubleValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Int, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.intValue = Int64(value)
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Int32, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.intValue = Int64(value)
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Int64, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.sintValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: UInt, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.uintValue = UInt64(value)
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: UInt32, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.uintValue = UInt64(value)
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: UInt64, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.uintValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    mutating public func add_key_values(key: String, value: Bool, feature: inout VectorTile_Tile.Feature) -> Void {
        var newValue = VectorTile_Tile.Value()
        newValue.boolValue = value
        self.keys.append(key)
        self.values.append(newValue)
        feature.tags.append(UInt32(self.keys.count - 1))
        feature.tags.append(UInt32(self.values.count - 1))
    }
    
    public func get_value(tagMap: [String:String], tagKey: String, value: inout String) -> Void {
        value = tagMap[tagKey] ?? ""
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout Float) -> Void {
        value = (tagMap[tagKey] as NSString?)?.floatValue ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout Int) -> Void {
        value = Int(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout Int32) -> Void {
        value = Int32(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout Int64) -> Void {
        value = Int64(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout UInt) -> Void {
        value = UInt(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout UInt32) -> Void {
        value = UInt32(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout UInt64) -> Void {
        value = UInt64(tagMap[tagKey] ?? "0") ?? 0
    }
    public func get_value(tagMap: [String:String], tagKey: String, value: inout Bool) -> Void {
        value = Bool(tagMap[tagKey] ?? "false") ?? false
    }
    
}

extension VectorTile_Tile.Feature {
    public func get_geometry(tile_info: mvt_tile_box, coord: mvt_coordinate, extent: Int, geoms_out: inout mvt_geoms) -> Void {
        var points              : mvt_vertex32d         = mvt_vertex32d()
        var points_tilespace    : mvt_vertex32          = mvt_vertex32()
        var polygon             : mvt_poloygons32d      = (mvt_vertex32d(), [mvt_vertex32d]())
        var is_polygon_set      : Bool = false
        let geomList = self.geometry
        var prev_op             : UInt32 = 0
        var mbr                 : MBR32D = MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0))
        var wp                  : VERTEX32D = VERTEX32D(dx: 0, dy: 0)
        var wpPrev              : VERTEX32D = VERTEX32D(dx: 0, dy: 0)
        var cursor              : VERTEX32 = VERTEX32(x: 0, y: 0)
        var tilespace           : VERTEX32 = VERTEX32(x: 0, y: 0)
        var i                   : Int = 0
        
        while (i < self.geometry.count) {
            let geom = geomList[i]
            let op   = geom & 0x7
            let count = geom >> 3
            
            if (op == mvt_operation.mvt_moveto_t.rawValue) {
                for j in 0..<count {
                    var v = geomList[i + 1]
                    let value1 = zigZagDecode(Int(v))
                    v = geomList[i + 2]
                    let value2 = zigZagDecode(Int(v))
                    cursor.x += value1
                    cursor.y += value2

                    wp.dx = tile_info.diff.dx * Double(cursor.x) / Double(extent) + tile_info.mbr.min.dx
                    wp.dy = -tile_info.diff.dy * Double(cursor.y) / Double(extent) + tile_info.mbr.max.dy
                    
                    if (coord == .mvt_world_t) {
                        wp.dx = Double(mglDegreeToWorldX(f: wp.dx))
                        wp.dy = Double(mglDegreeToWorldX(f: wp.dy))
                    }
                    
                    mbr.min.dx = min(mbr.min.dx, wp.dx)
                    mbr.min.dy = min(mbr.min.dy, wp.dx)
                    mbr.max.dx = max(mbr.max.dx, wp.dx)
                    mbr.max.dy = max(mbr.max.dy, wp.dx)
                    
                    
                    if (self.type == mvt_geom_type.point) {
                        geoms_out.points.append(wp)
                    }
                    
                    if (self.type == mvt_geom_type.linestring && points.count > 0) {
                        geoms_out.lines.append(points)
                        points.removeAll()
                        points_tilespace.removeAll()
                    }
                    
//                    print("px: \(wp.dx) || py: \(wp.dy)")
                    
                    wpPrev = wp
                    tilespace.x = cursor.x
                    tilespace.y = cursor.y
                    i += 2
                    prev_op = op
                }
            }
            if (op == mvt_operation.mvt_lineto_t.rawValue) {
                for j in 0..<count {
                    if (prev_op != 2) {
                        points.append(wpPrev)
                        points_tilespace.append(tilespace)
                    }
                    
                    var v = geomList[i + 1]
                    let value1 = zigZagDecode(Int(v))
                    v = geomList[i + 2]
                    let value2 = zigZagDecode(Int(v))
                    
                    cursor.x += value1
                    cursor.y += value2

                    wp.dx = tile_info.diff.dx * Double(cursor.x) / Double(extent) + tile_info.mbr.min.dx
                    wp.dy = -tile_info.diff.dy * Double(cursor.y) / Double(extent) + tile_info.mbr.max.dy
                    
                    if (coord == .mvt_world_t) {
                        wp.dx = Double(mglDegreeToWorldX(f: wp.dx))
                        wp.dy = Double(mglDegreeToWorldX(f: wp.dy))
                    }
                    
                    mbr.min.dx = min(mbr.min.dx, wp.dx)
                    mbr.min.dy = min(mbr.min.dy, wp.dx)
                    mbr.max.dx = max(mbr.max.dx, wp.dx)
                    mbr.max.dy = max(mbr.max.dy, wp.dx)
                    
                    points.append(wp)
                    points_tilespace.append(cursor)
                    i += 2
                    prev_op = op
                }
            }
            if (op == mvt_operation.mvt_closepath_t.rawValue) {
                for j in 0..<count {
                    if (self.type == mvt_geom_type.polygon) {
                        let winding : Double = CheckWindingi(pts: points_tilespace)
                        if (winding >= 0) {
                            if (is_polygon_set) {
                                    geoms_out.polygons.append(polygon)
                                    polygon.0 = mvt_vertex32d()
                                    polygon.1 = mvt_lines32d()
                            }
                            polygon.0 = points
                            is_polygon_set = true
                        } else {
                            polygon.1.append(points)
                        }
                        
                        points.removeAll()
                        points_tilespace.removeAll()
                        prev_op = op
                    }
                }
            }
            i += 1
        }
        if (self.type == mvt_geom_type.linestring) {
            geoms_out.lines.append(points)
        }
        
        if (self.type == mvt_geom_type.polygon) {
            geoms_out.polygons.append(polygon)
        }
        geoms_out.mbr = mbr
        geoms_out.geom_type = self.type
        geoms_out.coordinate = coord
    }
}

extension VectorTile_Tile {
    static var tileInfo : mvt_tile_box {
        mvt_tile_box(is_layer: false,
                                    numTiles: 0,
                                    mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                    diff: VERTEX32D(dx: 0, dy: 0),
                                    zoom: 0,
                                    column: 0,
                                    row: 0)
    }
    
    internal static func encode_geometry(extent: Int,
                                  geoms: inout mvt_geoms,
                                  outFeature: inout VectorTile_Tile.Feature,
                                  bForce: Bool = false) -> Void {
        
        var cursorx = 0, cursory = 0
        outFeature.type = geoms.geom_type
        var tmpTileSpace : mvt_vertex32 = mvt_vertex32()
        var tmpTileSpace2 : mvt_vertex32 = mvt_vertex32()
        
        if (geoms.geom_type == .point) {
            to_tile_coords(coordinate: geoms.coordinate, points: geoms.points, extent: extent, out: &tmpTileSpace)
            encode_tile_points(points: &tmpTileSpace, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
        }
        
        if (geoms.geom_type == .linestring) {
            
            for i in 0..<geoms.lines.count {
                let line = geoms.lines[i]
                to_tile_coords(coordinate: geoms.coordinate, points: line, extent: extent, out: &tmpTileSpace)
                if (!bForce) {
                    remove_deduplicate_points(points: tmpTileSpace, out: &tmpTileSpace2)
                } else {
                    tmpTileSpace2.removeAll()
                    tmpTileSpace2 = mvt_vertex32(repeating: tmpTileSpace.first!, count: tmpTileSpace.count)
                }
                if (tmpTileSpace2.count < 2) { continue }
                
                var tmpPoints = mvt_vertex32()
                tmpPoints.append(tmpTileSpace2[0])
                encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: false, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
            }
        }
        
        if (geoms.geom_type == .polygon) {
            for i in 0..<geoms.polygons.count {
                let polygon = geoms.polygons[i]
                to_tile_coords(coordinate: geoms.coordinate, points: polygon.0, extent: extent, out: &tmpTileSpace)
                remove_deduplicate_points(points: tmpTileSpace, out: &tmpTileSpace2)
                if (tmpTileSpace2.count < 2) { continue }
                let reverseOuter = CheckWindingi(pts: tmpTileSpace2) < 0.0
                
                var tmpPoints = mvt_vertex32()
                if (reverseOuter) {
                    tmpPoints.append(tmpTileSpace2[tmpTileSpace2.count - 1])
                } else {
                    tmpPoints.append(tmpTileSpace2[0])
                }
                
                encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: reverseOuter, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                var cmdId : UInt32 = 7
                var cmdCount : UInt32 = 1
                var cmdIdCount : UInt32 = UInt32((cmdId & 0x7 | cmdCount << 3))
                
                outFeature.geometry.append(cmdIdCount)
                
                for j in 0..<polygon.1.count {
                    let inner = polygon.1[j]
                    to_tile_coords(coordinate: geoms.coordinate, points: inner, extent: extent, out: &tmpTileSpace)
                    if (tmpTileSpace2.count < 2) { continue }
                    let reverseInner = CheckWindingi(pts: tmpTileSpace2) >= 0.0
                    
                    var tmpPoints = mvt_vertex32()
                    if (reverseInner) {
                        tmpPoints.append(tmpTileSpace2[tmpTileSpace2.count - 1])
                    } else {
                        tmpPoints.append(tmpTileSpace2[0])
                    }
                    
                    encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                    
                    encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: reverseInner, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                    
                    cmdId = 7
                    cmdCount = 1
                    cmdIdCount = (cmdId & 0x7) | (cmdCount << 3)
                    outFeature.geometry.append(cmdIdCount)
                }
            }
        }
    }
    
    internal static func to_tile_coords(coordinate: mvt_coordinate, points: mvt_vertex32d, extent: Int, out: inout mvt_vertex32) {
        out.removeAll()
        var wp = VERTEX32(x: 0, y: 0)
        
        if (coordinate == .mvt_world_t) {
            for i in 0..<points.count {
                let cx : Double = (mglWorldToDegreeX(i: Int(points[i].dx) - Int(tileInfo.mbr.min.dx)) * Double(extent) / tileInfo.diff.dx)
                let cy : Double = (mglWorldToDegreeY(i: Int(points[i].dy) - Int(tileInfo.mbr.max.dy)) * Double(extent) / (-tileInfo.diff.dy))
                
                wp.x = Int(cx.rounded())
                wp.y = Int(cy.rounded())
                
                out.append(wp)
            }
        } else {
            for i in 0..<points.count {
                let cx : Double = (points[i].dx - tileInfo.mbr.min.dx) * Double(extent) / tileInfo.diff.dx
                let cy : Double = (points[i].dy - tileInfo.mbr.max.dy) * Double(extent) / (-tileInfo.diff.dy)
                
                wp.x = Int(cx.rounded())
                wp.y = Int(cy.rounded())
                
                out.append(wp)
            }
        }
    }
    
    internal static func encode_tile_points(points: inout mvt_vertex32,
                                     cmdId: Int,
                                     reverseOrder: Bool,
                                     startIndex: Int,
                                     cursorx: inout Int,
                                     cursory: inout Int,
                                     outFeature: inout VectorTile_Tile.Feature) -> Void {
        
        let cmdCount = points.count - startIndex
        let cmdIdCount : UInt32 = UInt32((cmdId & 0x7 | cmdCount << 3))
        CheckCmdId(cmdIdCount: cmdIdCount, cmdId: cmdId, count: cmdCount)
        outFeature.geometry.append(cmdIdCount)
        
        var value1 = 0,
            value2 = 0
        var value1enc : UInt32 = 0,
            value2enc : UInt32 = 0
        
        for i in 0..<points.count {
            var i2 = i
            if (reverseOrder) {
                i2 = points.count - 1 - i
            }
            
            value1 = points[i2].x - cursorx
            value2 = points[i2].y - cursory
            
            value1enc = UInt32(zigZagEncode(value1))
            value2enc = UInt32(zigZagEncode(value2))
            
            outFeature.geometry.append(value1enc)
            outFeature.geometry.append(value2enc)
            
            cursorx = points[i2].x
            cursory = points[i2].y
        }
    }
    
    internal static func remove_deduplicate_points(points: mvt_vertex32, out: inout mvt_vertex32) {
        
        out.removeAll()
        var px : Int = 0,
            py : Int = 0
        
        for i in 0..<points.count {
            if (i == 0 || px != points[i].x || py != points[i].y) {
                out.append(points[i])
            }
            
            px = points[i].x
            py = points[i].y
        }
    }
}

final class tile_mvt {
    internal var tileInfo : mvt_tile_box = mvt_tile_box(is_layer: false,
                                    numTiles: 0,
                                    mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                    diff: VERTEX32D(dx: 0, dy: 0),
                                    zoom: 0,
                                    column: 0,
                                    row: 0)
    
    
    internal func encode_geometry(extent: Int,
                                  geoms: inout mvt_geoms,
                                  outFeature: inout VectorTile_Tile.Feature,
                                  bForce: Bool = false) -> Void {
        
        var cursorx = 0, cursory = 0
        outFeature.type = geoms.geom_type
        var tmpTileSpace : mvt_vertex32 = mvt_vertex32()
        var tmpTileSpace2 : mvt_vertex32 = mvt_vertex32()
        
        if (geoms.geom_type == .point) {
            to_tile_coords(coordinate: geoms.coordinate, points: geoms.points, extent: extent, out: &tmpTileSpace)
            tile_mvt.encode_tile_points(points: &tmpTileSpace, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
        }
        
        if (geoms.geom_type == .linestring) {
            
            for i in 0..<geoms.lines.count {
                let line = geoms.lines[i]
                to_tile_coords(coordinate: geoms.coordinate, points: line, extent: extent, out: &tmpTileSpace)
                if (!bForce) {
                    tile_mvt.remove_deduplicate_points(points: tmpTileSpace, out: &tmpTileSpace2)
                } else {
                    tmpTileSpace2.removeAll()
                    tmpTileSpace2 = mvt_vertex32(repeating: tmpTileSpace.first!, count: tmpTileSpace.count)
                }
                if (tmpTileSpace2.count < 2) { continue }
                
                var tmpPoints = mvt_vertex32()
                tmpPoints.append(tmpTileSpace2[0])
                tile_mvt.encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                tile_mvt.encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: false, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
            }
        }
        
        if (geoms.geom_type == .polygon) {
            for i in 0..<geoms.polygons.count {
                let polygon = geoms.polygons[i]
                to_tile_coords(coordinate: geoms.coordinate, points: polygon.0, extent: extent, out: &tmpTileSpace)
                tile_mvt.remove_deduplicate_points(points: tmpTileSpace, out: &tmpTileSpace2)
                if (tmpTileSpace2.count < 2) { continue }
                let reverseOuter = CheckWindingi(pts: tmpTileSpace2) < 0.0
                
                var tmpPoints = mvt_vertex32()
                if (reverseOuter) {
                    tmpPoints.append(tmpTileSpace2[tmpTileSpace2.count - 1])
                } else {
                    tmpPoints.append(tmpTileSpace2[0])
                }
                
                tile_mvt.encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                tile_mvt.encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: reverseOuter, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                
                var cmdId : UInt32 = 7
                var cmdCount : UInt32 = 1
                var cmdIdCount : UInt32 = UInt32((cmdId & 0x7 | cmdCount << 3))
                
                outFeature.geometry.append(cmdIdCount)
                
                for j in 0..<polygon.1.count {
                    let inner = polygon.1[j]
                    to_tile_coords(coordinate: geoms.coordinate, points: inner, extent: extent, out: &tmpTileSpace)
                    if (tmpTileSpace2.count < 2) { continue }
                    let reverseInner = CheckWindingi(pts: tmpTileSpace2) >= 0.0
                    
                    var tmpPoints = mvt_vertex32()
                    if (reverseInner) {
                        tmpPoints.append(tmpTileSpace2[tmpTileSpace2.count - 1])
                    } else {
                        tmpPoints.append(tmpTileSpace2[0])
                    }
                    
                    tile_mvt.encode_tile_points(points: &tmpPoints, cmdId: 1, reverseOrder: false, startIndex: 0, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                    
                    tile_mvt.encode_tile_points(points: &tmpTileSpace2, cmdId: 2, reverseOrder: reverseInner, startIndex: 1, cursorx: &cursorx, cursory: &cursory, outFeature: &outFeature)
                    
                    cmdId = 7
                    cmdCount = 1
                    cmdIdCount = (cmdId & 0x7) | (cmdCount << 3)
                    outFeature.geometry.append(cmdIdCount)
                }
            }
        }
    }
    
    internal func to_tile_coords(coordinate: mvt_coordinate, points: mvt_vertex32d, extent: Int, out: inout mvt_vertex32) {
        out.removeAll()
        var wp = VERTEX32(x: 0, y: 0)
        
        if (coordinate == .mvt_world_t) {
            for i in 0..<points.count {
                let cx : Double = (mglWorldToDegreeX(i: Int(points[i].dx) - Int(tileInfo.mbr.min.dx)) * Double(extent) / tileInfo.diff.dx)
                let cy : Double = (mglWorldToDegreeY(i: Int(points[i].dy) - Int(tileInfo.mbr.max.dy)) * Double(extent) / (-tileInfo.diff.dy))
                
                wp.x = Int(cx.rounded())
                wp.y = Int(cy.rounded())
                
                out.append(wp)
            }
        } else {
            for i in 0..<points.count {
                let cx : Double = (points[i].dx - tileInfo.mbr.min.dx) * Double(extent) / tileInfo.diff.dx
                let cy : Double = (points[i].dy - tileInfo.mbr.max.dy) * Double(extent) / (-tileInfo.diff.dy)
                
                wp.x = Int(cx.rounded())
                wp.y = Int(cy.rounded())
                
                out.append(wp)
            }
        }
    }
    
    internal static func encode_tile_points(points: inout mvt_vertex32,
                                     cmdId: Int,
                                     reverseOrder: Bool,
                                     startIndex: Int,
                                     cursorx: inout Int,
                                     cursory: inout Int,
                                     outFeature: inout VectorTile_Tile.Feature) -> Void {
        
        let cmdCount = points.count - startIndex
        let cmdIdCount : UInt32 = UInt32((cmdId & 0x7 | cmdCount << 3))
        CheckCmdId(cmdIdCount: cmdIdCount, cmdId: cmdId, count: cmdCount)
        outFeature.geometry.append(cmdIdCount)
        
        var value1 = 0,
            value2 = 0
        var value1enc : UInt32 = 0,
            value2enc : UInt32 = 0
        
        for i in 0..<points.count {
            var i2 = i
            if (reverseOrder) {
                i2 = points.count - 1 - i
            }
            
            value1 = points[i2].x - cursorx
            value2 = points[i2].y - cursory
            
            value1enc = UInt32(zigZagEncode(value1))
            value2enc = UInt32(zigZagEncode(value2))
            
            outFeature.geometry.append(value1enc)
            outFeature.geometry.append(value2enc)
            
            cursorx = points[i2].x
            cursory = points[i2].y
        }
    }
    
    internal static func remove_deduplicate_points(points: mvt_vertex32, out: inout mvt_vertex32) {
        
        out.removeAll()
        var px : Int = 0,
            py : Int = 0
        
        for i in 0..<points.count {
            if (i == 0 || px != points[i].x || py != points[i].y) {
                out.append(points[i])
            }
            
            px = points[i].x
            py = points[i].y
        }
    }
}
