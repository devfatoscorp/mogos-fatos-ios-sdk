//
//  ConfigStructs.swift
//  fatoshi-swift
//
//  Created by Heecheon Park on 2021/07/06.
//

import Foundation
import SwiftProtobuf

enum config_real_time_traffic_type : Int32 {
    case none_t = 0
    case five_minutes = 1
    case ten_minutes = 2
    case fifteen_minutes = 3
    case max_t = 4
}

enum config_route_navi_type : Int32 {
    case none_t = 0
    case minimum_time = 1                   // 최소시간
    case minimum_time_free = 2              // 최소시간(무료)
    case shortest_distance = 3              // 최단거리
    case shortest_distance_free = 4         // 최단거리(무료)
    case max_t = 5                          //
}

enum use_route_option_type : Int32 {
    case none = -1
    case fastest = 0
    case fastest_no_toll = 1
    case shortest = 2
    case shortest_no_toll = 3
}

enum ui_mode_type : Int32 {
    case none_t = 0                         // 사용 않함
    case tracking_t = 1                     // 트래킹 모드
    case safe_driving_t = 2                 // 안도 모드
    case route_driving_t = 3                // 경로 주행
}

enum config_traffic_info_type : Int32 {
    case none_t  = 0
    case avg = 1
    case current = 2
    case historical = 3
    case max_t
}

enum config_vehicle_info_type : Int32 {
    case none_t = 0
    case car    = 1
    case truck  = 2
    case motor_bike = 3
    case ev     = 4
    case max_t  = 5
}

enum config_fuel_type: Int32 {
    case none_t = 0
    case gas = 1
    case diesel = 2
    case npv = 3
    case lpg = 4
    case hydro = 5
    case ev = 6
    case max_t = 7
}

enum config_gas_type: Int32 {
    case none_t  = 0
    case gas_e85 = 1
    case gas_e20 = 2
    case gas_91 = 3
    case gas_95 = 4
    case gas_benzin = 5
    case max_t = 6
}

enum config_diesel_type: Int32 {
    case none_t  = 0
    case diesel_b20 = 1
    case diesel_diesel = 2
    case diesel_b7 = 3
    case diesel_b7_premium = 4
    case max_t = 5
}

enum config_language_type: Int32 {
    case none_t = 0
    case system = 1
    case th = 2         // 태국어
    case en = 3         // 영어
    case kr = 4         // 한국어
    case max_t = 5
}

enum config_country_type: Int32 {
    case none_t = 0
    case korea_t = 1
    case thai_t = 2
    case singapore_t = 3
    case max_t = 4
}

enum config_truck_detail_type: Int32 {
    case none_t  = 0
    case type_three = 1         // 3종
    case type_four = 4          // 4종
    case type_five = 5          // 5종
    case type_2A4W4T = 10       // 태국 2축 4휠 4타이어
    case type_2A4W6T = 11       // 태국 2축 4휠 6타이어
    case type_3A6W10T = 12      // 태국 3축 6휠 10타이어
    case type_4A8W12T = 13      // 태국 4축 8휠 12타이어
    case type_trailer = 14      // 태국 트레일러

    case max_t = 999
}


struct config_info_st {
    
    public var version          : Int32 = 0
    public var map_settings     : map_settings_st = map_settings_st()
    public var traffic          : traffic_st = traffic_st()                         // 교통정보 설정
    public var route_search     : route_search_st = route_search_st()               // 경로 탐색 설정
    public var vehicle          : vehicle_st   = vehicle_st()                       // 차량 정보 설정
    public var guidance_setting : guidance_setting_st = guidance_setting_st()       // 안전 운전 설정
    public var etc              : etc_st = etc_st()                                 // 기타
    public var truck            : truck_st = truck_st()                             // 트럭 설정(차량이 트럭일때만 사용)
    public var user             : user_st = user_st()                               // 유저 정보
    public var map_control      : map_control_st = map_control_st()                 // 지도 컨트롤 정보
    public var debug            : debug_st = debug_st()                             // 디버그 모드 온오프 여부
    
    mutating public func clear() -> Void {
        self.version          = 0
        self.map_settings     = map_settings_st()
        self.traffic          = traffic_st()
        self.route_search     = route_search_st()
        self.vehicle          = vehicle_st()
        self.guidance_setting = guidance_setting_st()
        self.etc              = etc_st()
        self.truck            = truck_st()
        self.user             = user_st()
    }
}

// 교통정보 설정
struct map_settings_st {
    
    public var map_color                : Int = 2
    public var cavata                   : Int = 0
    public var auto_map_level           : Bool = true
    public var favorite_map_display     : Bool = false
    public var fuel_prices_map_display  : Bool = true
    public var geoms                    : mvt_geoms = mvt_geoms()

    mutating public func clear() -> Void {
        self.map_color            = 2
        self.cavata               = 0
        self.auto_map_level       = true
        self.favorite_map_display = false
        self.fuel_prices_map_display = true
        self.geoms                = mvt_geoms()
    }
}

struct traffic_st {
    public var per_traffic_info         : Bool = false
    public var traffic_line             : Bool = false
    public var real_time_traffic_type   : config_real_time_traffic_type = .none_t
    public var geoms                    : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.per_traffic_info       = false
        self.traffic_line           = false
        self.real_time_traffic_type = .none_t
        self.geoms                  = mvt_geoms()
    }
}

struct route_search_st {
    public var minimum_time             : Bool  = false // 최소시간
    public var minimum_time_free        : Bool  = false // 최소시간(무료)
    public var shortest_distance        : Bool  = false // 최단거리
    public var shortest_distance_free   : Bool  = false // 최단거리(무료)
    public var use_route_option_type    : use_route_option_type = .shortest_no_toll  // 현재 사용중인 경로 옵션 정보
    public var add_route_option_type    : use_route_option_type = .shortest_no_toll  // 주행중 사용자가 추가한 경로 옵션 정보
    public var uphill_avoid             : Bool = false
    public var dest_direction           : Int32 = 1
    public var via_direction            : Bool = false
    public var school_zone_avoid        : Bool = false
    public var ferry_avoid              : Bool = false
    public var traffic_info_current     : Bool = false
    public var traffic_info_historical  : Bool = false
    public var traffic_info_type        : config_traffic_info_type = .none_t
    public var geoms                    : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.minimum_time             = false
        self.minimum_time_free        = false
        self.shortest_distance        = false
        self.shortest_distance_free   = false
        self.use_route_option_type    = .shortest_no_toll
        self.uphill_avoid             = false
        self.dest_direction           = 1
        self.via_direction            = false
        self.school_zone_avoid        = false
        self.traffic_info_type        = .none_t
        self.geoms                    = mvt_geoms()
    }
}
struct vehicle_st {
    public var vehicle_info_type    : config_vehicle_info_type = .none_t
    public var fuel_type            : config_fuel_type = .none_t
    public var gas_type             : config_gas_type = .none_t
    public var diesel_type          : config_diesel_type = .none_t
    public var left_driver_seat     : Bool = false
    public var geoms                : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.vehicle_info_type    = .none_t
        self.fuel_type            = .none_t
        self.gas_type             = .none_t
        self.diesel_type          = .none_t
        self.left_driver_seat     = false
        self.geoms                = mvt_geoms()
    }
}

struct guidance_setting_st {
    public var camera           : camera_st = camera_st()
    public var ando             : ando_st   = ando_st()
    public var guide_etc        : guide_etc_st = guide_etc_st()
    public var geoms            : mvt_geoms = mvt_geoms()
}

struct etc_st {
    public var warn_data_usage  : Bool = true
    public var language_type    : config_language_type = .none_t
    public var country_type     : config_country_type = .none_t
    public var geoms            : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.warn_data_usage = true
        self.language_type = .none_t
        self.country_type = .none_t
        self.geoms = mvt_geoms()
    }
}
struct truck_st {
    public var truck_detail_type     : config_truck_detail_type = .none_t
    public var truck_height_no_limit : Bool                = true
    public var truck_height          : Float               = 0.0
    public var truck_width_no_limit  : Bool                = true
    public var truck_width           : Float               = 0.0
    public var truck_weight_no_limit : Bool                = true
    public var truck_weight          : Float               = 0.0
    public var load_weight_no_limit  : Bool                = true
    public var load_weight           : Float               = 0.0
    public var truck_length_no_limit : Bool                = true
    public var truck_length          : Float               = 0.0
    public var u_turn_lane           : Int32               = 0
    public var geoms                 : mvt_geoms           = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.truck_detail_type      = .none_t
        self.truck_height_no_limit  = true
        self.truck_height           = 0.0
        self.truck_width_no_limit   = true
        self.truck_width            = 0.0
        self.truck_weight_no_limit  = true
        self.truck_weight           = 0.0
        self.load_weight_no_limit   = true
        self.load_weight            = 0.0
        self.truck_length_no_limit  = true
        self.truck_length           = 0.0
        self.u_turn_lane            = 0
        self.geoms                  = mvt_geoms()
    }
}

struct camera_st {
    public var red_light_camera_check  : Bool = false   // 태국 빨간불 단속
    public var lane_change_camera_check : Bool = false  // 태국 차선변경 단속
    public var over_speed_check        : Bool = false   // 과속 단속
    public var over_signal_check       : Bool = false   // 신호 과속 단속
    public var bus_only_lane_check     : Bool = false   // 버스전용차선 단속
    public var cut_in_check            : Bool = false   // 끼어들기 단속
    public var tail_gating_check       : Bool = false   // 꼬리물기 단속
    public var school_zone_check       : Bool = false   // 어린이보호구역
    public var senior_zones_check      : Bool = false   // 노인보호구역
    public var class_5_emission_checkl : Bool = false   // 5등급 배출 단속
    public var poor_load_check         : Bool = false   // 적재 불량 단속
    public var over_load_check         : Bool = false   // 과적 단속
    
    mutating public func clear() -> Void {
        self.red_light_camera_check   = false
        self.lane_change_camera_check = false
        self.over_speed_check = false
        self.over_signal_check = false
        self.bus_only_lane_check = false
        self.cut_in_check = false
        self.tail_gating_check = false
        self.school_zone_check = false
        self.senior_zones_check = false
        self.class_5_emission_checkl = false
        self.poor_load_check = false
        self.over_load_check = false
    }
}
struct ando_st {
    public var speed_bump         : Bool = false    // 과속방지턱
    public var accidents          : Bool = false    // 사고다발
    public var falling_rocks      : Bool = false    // 낙석주의
    public var fog_caution        : Bool = false    // 안개주의
    public var fall_caution       : Bool = false    // 추락주의
    public var railroad_crossing  : Bool = false    // 철길건널목
    public var sharp_curve        : Bool = false    // 급커브주의
    public var strong_wind        : Bool = false    // 강풍주의
    public var wildlife_sanctuary : Bool = false    // 야생동물보호구역
    public var freezing_section   : Bool = false    // 상습결빙구간
    
    public var th_sharp_curve           : Bool = false   // 급커브지역
    public var th_winding               : Bool = false   // 구불구불한 지역
    public var th_zig_zag               : Bool = false   // 지그재그 지역
    public var th_narrow                : Bool = false   // 좁아지는 도로
    public var th_narrow_bridge         : Bool = false   //좁아지는 교량
    public var th_railroad_crossing     : Bool = false   // 철길 건널목
    public var th_weight_limit          : Bool = false   // 중량제한
    public var th_height_limit          : Bool = false   // 높이제한
    public var th_uphill                : Bool = false   // 오르막길
    public var th_downhill              : Bool = false   // 내리막길
    public var th_slippery              : Bool = false   // 미끄러운길
    public var th_loose_surface         : Bool = false   // 느슨한 표면 길
    public var th_falling_rock          : Bool = false   // 낙석지역
    public var th_road_kill             : Bool = false   // 동물횡단주의구간
    public var th_no_overtaking         : Bool = false   // 추월금지 구간 시작
    public var th_end_restriction       : Bool = false   // 제한 종료 지점
    public var th_speed_hump            : Bool = false   //  과속방지턱
    public var th_accidental_area       : Bool = false   // 사고다발지역
    public var th_school_zone           : Bool = false   //  어린이보호구역
    
    mutating public func clear() -> Void {
        self.speed_bump         = false
        self.accidents          = false
        self.falling_rocks      = false
        self.fog_caution        = false
        self.fall_caution       = false
        self.railroad_crossing  = false
        self.sharp_curve        = false
        self.strong_wind        = false
        self.wildlife_sanctuary = false
        self.freezing_section   = false
        self.th_sharp_curve = false
        self.th_winding = false
        self.th_zig_zag = false
        self.th_narrow = false
        self.th_narrow_bridge = false
        self.th_railroad_crossing = false
        self.th_weight_limit = false
        self.th_height_limit = false
        self.th_uphill = false
        self.th_downhill = false
        self.th_slippery = false
        self.th_loose_surface = false
        self.th_falling_rock = false
        self.th_road_kill = false
        self.th_no_overtaking = false
        self.th_end_restriction = false
        self.th_speed_hump = false
        self.th_accidental_area = false
        self.th_school_zone = false
    }
}

struct guide_etc_st {
    public var collect_traffic_info : Bool = false
    
    mutating public func clear() -> Void {
        self.collect_traffic_info = false
    }
}

struct user_st {
    public var email            : String            = ""
    public var name             : String            = ""
    public var is_logged_in     : Bool              = false
    public var remain_time_toggle : Bool            = true          // 주행화면 잔여거리/예상도착시간 토글
    public var ui_mode          : ui_mode_type      = .none_t
    public var geoms            : mvt_geoms         = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.email              = ""
        self.name               = ""
        self.is_logged_in       = false
        self.remain_time_toggle = true
        self.ui_mode            = .none_t
        self.geoms = mvt_geoms()
    }
}

struct map_control_st {
    public var view_mode        : Int32             = 0
    public var aerial_mode      : Int32             = 0
    public var building_mode    : Int32             = 0
    public var geoms            : mvt_geoms         = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.view_mode = 0
        self.aerial_mode = 0
        self.building_mode = 0
        self.geoms = mvt_geoms();
    }
}

struct debug_st {
    public var simul_gps            : Bool              = false
    public var draw_gps_point       : Bool              = false
    public var send_tracker_data    : Bool              = false
    public var draw_sdi_line        : Bool              = false
    public var draw_candidate_link  : Bool              = false
    public var simulation_mode      : Bool              = false
    public var debug_mode           : Bool              = false
    public var lab_command          : String            = ""
    public var simul_idx            : Int32             = 0
    public var geoms                : mvt_geoms         = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.debug_mode = false
        self.geoms      = mvt_geoms()
    }
}

public class config_result: NSObject {
    lazy var info = config_info_st()
    var tileInfo = mvt_tile_box(is_layer: false,
                                numTiles: 0,
                                mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                diff: VERTEX32D(dx: 0, dy: 0),
                                zoom: 0,
                                column: 0,
                                row: 0)
    
    internal func encode(param_one: inout config_info_st) -> Data? {
        var mvt = VectorTile_Tile()
        info = param_one
        encode_layer(mvt: &mvt, map_settings: &info.map_settings, site: site_type.fatos_t, layer_name: "map_settings", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, traffic: &info.traffic, site: site_type.fatos_t, layer_name: "traffic", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, route_search: &info.route_search, site: site_type.fatos_t, layer_name: "route_search", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, vehicle: &info.vehicle, site: site_type.fatos_t, layer_name: "vehicle", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, guidance_setting: &info.guidance_setting, site: site_type.fatos_t, layer_name: "guidance_setting", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, etc: &info.etc, site: site_type.fatos_t, layer_name: "etc", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, truck: &info.truck, site: site_type.fatos_t, layer_name: "truck", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, user: &info.user, site: site_type.fatos_t, layer_name: "user", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, map_control: &info.map_control, site: site_type.fatos_t, layer_name: "map_control", version: MVT_CONFIG_VERSION)
        encode_layer(mvt: &mvt, debug: &info.debug, site: site_type.fatos_t, layer_name: "debug", version: MVT_CONFIG_VERSION)
        
        do {
            return try mvt.serializedData()
        } catch {
            return nil
        }
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               map_settings: inout map_settings_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "map_color", value: map_settings.map_color, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "cavata", value: map_settings.cavata, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "auto_map_level", value: map_settings.auto_map_level, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "favorite_map_display", value: map_settings.favorite_map_display, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "fuel_prices_map_display", value: map_settings.fuel_prices_map_display, feature: &_feat)

        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &info.map_settings.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               traffic: inout traffic_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "per_traffic_info", value: traffic.per_traffic_info, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "traffic_line", value: traffic.traffic_line, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "real_time_traffic_type", value: traffic.real_time_traffic_type.rawValue, feature: &_feat)
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &info.traffic.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               route_search: inout route_search_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
    
        mvt.layers[lastIndex].add_key_values(key: "minimum_time", value: route_search.minimum_time, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "minimum_time_free", value: route_search.minimum_time_free, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "shortest_distance", value: route_search.shortest_distance, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "shortest_distance_free", value: route_search.shortest_distance_free, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "use_route_option_type", value: route_search.use_route_option_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "add_route_option_type", value: route_search.add_route_option_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "uphill_avoid", value: route_search.uphill_avoid, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "dest_direction", value: route_search.dest_direction, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "via_direction", value: route_search.via_direction, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "school_zone_avoid", value: route_search.school_zone_avoid, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ferry_avoid", value: route_search.ferry_avoid, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "traffic_info_current", value: route_search.traffic_info_current, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "traffic_info_historical", value: route_search.traffic_info_historical, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "traffic_info_type", value: route_search.traffic_info_type.rawValue, feature: &_feat)
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &route_search.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               vehicle: inout vehicle_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "vehicle_info_type", value: vehicle.vehicle_info_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "fuel_type", value: vehicle.fuel_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "gas_type", value: vehicle.gas_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "diesel_type", value: vehicle.diesel_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "left_driver_seat", value: vehicle.left_driver_seat, feature: &_feat)
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &vehicle.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               guidance_setting: inout guidance_setting_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        //camera
        mvt.layers[lastIndex].add_key_values(key: "camera_red_light_camera_check", value: guidance_setting.camera.red_light_camera_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_lane_change_camera_check", value: guidance_setting.camera.lane_change_camera_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_camera_over_speed_check", value: guidance_setting.camera.over_speed_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_over_signal_check", value: guidance_setting.camera.over_signal_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_bus_only_lane_check", value: guidance_setting.camera.bus_only_lane_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_cut_in_check", value: guidance_setting.camera.cut_in_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_tail_gating_check", value: guidance_setting.camera.tail_gating_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_school_zone_check", value: guidance_setting.camera.school_zone_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_senior_zones_check", value: guidance_setting.camera.senior_zones_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_class_5_emission_checkl", value: guidance_setting.camera.class_5_emission_checkl, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_poor_load_check", value: guidance_setting.camera.poor_load_check, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "camera_over_load_check", value: guidance_setting.camera.over_load_check, feature: &_feat)
        // ando
        mvt.layers[lastIndex].add_key_values(key: "ando_speed_bump", value: guidance_setting.ando.speed_bump, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_accidents", value: guidance_setting.ando.accidents, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_falling_rocks", value: guidance_setting.ando.falling_rocks, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_fog_caution", value: guidance_setting.ando.fog_caution, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_fall_caution", value: guidance_setting.ando.fall_caution, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_railroad_crossing", value: guidance_setting.ando.railroad_crossing, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_sharp_curve", value: guidance_setting.ando.sharp_curve, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_strong_wind", value: guidance_setting.ando.strong_wind, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_wildlife_sanctuary", value: guidance_setting.ando.wildlife_sanctuary, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_freezing_section", value: guidance_setting.ando.freezing_section, feature: &_feat)
        
        mvt.layers[lastIndex].add_key_values(key: "ando_th_sharp_curve", value: guidance_setting.ando.th_sharp_curve, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_winding", value: guidance_setting.ando.th_winding, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_zig_zag", value: guidance_setting.ando.th_zig_zag, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_narrow", value: guidance_setting.ando.th_narrow, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_narrow_bridge", value: guidance_setting.ando.th_narrow_bridge, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_railroad_crossing", value: guidance_setting.ando.th_railroad_crossing, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_weight_limit", value: guidance_setting.ando.th_weight_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_height_limit", value: guidance_setting.ando.th_height_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_uphill", value: guidance_setting.ando.th_uphill, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_downhill", value: guidance_setting.ando.th_downhill, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_slippery", value: guidance_setting.ando.th_slippery, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_loose_surface", value: guidance_setting.ando.th_loose_surface, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_falling_rock", value: guidance_setting.ando.th_falling_rock, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_road_kill", value: guidance_setting.ando.th_road_kill, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_no_overtaking", value: guidance_setting.ando.th_no_overtaking, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_end_restriction", value: guidance_setting.ando.th_end_restriction, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_speed_hump", value: guidance_setting.ando.th_speed_hump, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_accidental_area", value: guidance_setting.ando.th_accidental_area, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ando_th_school_zone", value: guidance_setting.ando.th_school_zone, feature: &_feat)

        // etc
        mvt.layers[lastIndex].add_key_values(key: "guide_etc_collect_traffic_info", value: guidance_setting.guide_etc.collect_traffic_info, feature: &_feat)
        
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &guidance_setting.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               etc: inout etc_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        
        mvt.layers[lastIndex].add_key_values(key: "warn_data_usage", value: etc.warn_data_usage, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "language_type", value: etc.language_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "country_type", value: etc.country_type.rawValue, feature: &_feat)

        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &etc.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               truck: inout truck_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "truck_detail_type", value: truck.truck_detail_type.rawValue, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_height_no_limit", value: truck.truck_height_no_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_height", value: truck.truck_height, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_width_no_limit", value: truck.truck_width_no_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_width", value: truck.truck_width, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_weight_no_limit", value: truck.truck_weight_no_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_weight", value: truck.truck_weight, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "load_weight_no_limit", value: truck.load_weight_no_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "load_weight", value: truck.load_weight, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_length_no_limit", value: truck.truck_length_no_limit, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "truck_length", value: truck.truck_length, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "u_turn_lane", value: truck.u_turn_lane, feature: &_feat)

        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &truck.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               user: inout user_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "email", value: user.email, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "name", value: user.name, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "is_logged_in", value: user.is_logged_in, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "remain_time_toggle", value: user.remain_time_toggle, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "ui_mode", value: user.ui_mode.rawValue, feature: &_feat)
        
        var nmbr : MBR32 = MBR32(min: VERTEX32(x: 0, y: 0), max: VERTEX32(x: 0, y: 0))
        nmbr.reset()
        nmbr.max.y = mglDegreeToWorldY(f: user.geoms.mbr.max.dy)
        nmbr.min.y = mglDegreeToWorldY(f: user.geoms.mbr.min.dy)
        nmbr.max.x = mglDegreeToWorldX(f: user.geoms.mbr.max.dx)
        nmbr.min.x = mglDegreeToWorldX(f: user.geoms.mbr.min.dx)
        
        var zoom : UInt32 = 0, col : UInt32 = 0, row : UInt32 = 0
        mvt.layers[lastIndex].extent = UInt32(mbr_extent(mbr: &nmbr, tileZoom: &zoom, tileColumn: &col, tileRow: &row))
        tileInfo.zoom = Int(zoom)
        tileInfo.column = Int(col)
        tileInfo.row = Int(row)
        tileInfo.numTiles   = UInt32(tileInfo.zoom * tileInfo.zoom)
        tileInfo.mbr.min.dx = tilex2long(x: tileInfo.column, z: tileInfo.zoom)
        tileInfo.mbr.min.dy = tiley2lat(y: tileInfo.row - 1, z: tileInfo.zoom)
        tileInfo.mbr.max.dx = tilex2long(x: tileInfo.column + 1, z: tileInfo.zoom)
        tileInfo.mbr.max.dy = tiley2lat(y: tileInfo.row, z: tileInfo.zoom)
        tileInfo.diff.dx = tileInfo.mbr.max.dx - tileInfo.mbr.min.dx
        tileInfo.diff.dy = tileInfo.mbr.max.dy - tileInfo.mbr.min.dy
        mvt.layers[lastIndex].tz = zoom
        mvt.layers[lastIndex].tx = col
        mvt.layers[lastIndex].ty = row
        
        var tile = tile_mvt()
        tile.tileInfo = tileInfo
        tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &user.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               map_control: inout map_control_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        mvt.layers[lastIndex].add_key_values(key: "view_mode", value: map_control.view_mode, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "aerial_mode", value: map_control.aerial_mode, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "building_mode", value: map_control.building_mode, feature: &_feat)
        
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &map_control.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               debug: inout debug_st,
                               site: site_type,
                               layer_name: String, version: Int) -> Void {
        
        mvt.layers.append(VectorTile_Tile.Layer())
        let lastIndex = mvt.layers.count - 1
        mvt.layers[lastIndex] = VectorTile_Tile.Layer.with {
            $0.name = layer_name
            $0.extent = 4096
            $0.version = UInt32(version)
        }
        mvt.layers[lastIndex].keys.removeAll()
        mvt.layers[lastIndex].values.removeAll()
        mvt.layers[lastIndex].features.removeAll()
        var _feat = VectorTile_Tile.Feature()
        
        mvt.layers[lastIndex].add_key_values(key: "simul_gps", value: debug.simul_gps, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "draw_gps_point", value: debug.draw_gps_point, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "send_tracker_data", value: debug.send_tracker_data, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "draw_sdi_line", value: debug.draw_sdi_line, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "draw_candidate_link", value: debug.draw_candidate_link, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "simulation_mode", value: debug.simulation_mode, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "debug_mode", value: debug.debug_mode, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "lab_command", value: debug.lab_command, feature: &_feat)
        mvt.layers[lastIndex].add_key_values(key: "simul_idx", value: debug.simul_idx, feature: &_feat)
        
        VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &debug.geoms, outFeature: &_feat)
        mvt.layers[lastIndex].features.append(_feat)
    }
    
    //MARK: - Decode
    @discardableResult
    internal func decode(mvt: VectorTile_Tile, coordinate: mvt_coordinate = .mvt_lonlat_t) -> Bool {
        self.info.clear()
        self.tileInfo.clear()
        
        var config_new       = config_info_st()
        let layerContainer = mvt.layers
        let layerCount: Int = layerContainer.count
        
        config_new.clear()
        for layerIndex in 0..<layerCount {
            var layer = mvt.layers[layerIndex]
            self.tileInfo.zoom = Int(layer.tz)
            self.tileInfo.column = Int(layer.tx)
            self.tileInfo.row = Int(layer.ty)
            self.tileInfo.numTiles   = UInt32(tileInfo.zoom * tileInfo.zoom)
            self.tileInfo.mbr.min.dx = tilex2long(x: tileInfo.column, z: tileInfo.zoom)
            self.tileInfo.mbr.min.dy = tiley2lat(y: tileInfo.row - 1, z: tileInfo.zoom)
            self.tileInfo.mbr.max.dx = tilex2long(x: tileInfo.column + 1, z: tileInfo.zoom)
            self.tileInfo.mbr.max.dy = tiley2lat(y: tileInfo.row, z: tileInfo.zoom)
            self.tileInfo.diff.dx = tileInfo.mbr.max.dx - tileInfo.mbr.min.dx
            self.tileInfo.diff.dy = tileInfo.mbr.max.dy - tileInfo.mbr.min.dy
            
            layer.tz = UInt32(tileInfo.zoom)
            layer.tx = UInt32(tileInfo.column)
            layer.ty = UInt32(tileInfo.row)
            
            tileInfo.is_layer = true
            if (layer.name.contains("map_settings") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, map_settings: &config_new.map_settings, coordinate: coordinate)
            }
            if (layer.name.contains("traffic") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, traffic: &config_new.traffic, coordinate: coordinate)
            }
            if (layer.name.contains("route_search") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, route_search: &config_new.route_search, coordinate: coordinate)
            }
            if (layer.name.contains("vehicle") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, vehicle: &config_new.vehicle, coordinate: coordinate)
            }
            if (layer.name.contains("guidance_setting") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, guidance_setting: &config_new.guidance_setting, coordinate: coordinate)
            }
            if (layer.name.contains("etc") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, etc: &config_new.etc, coordinate: coordinate)
            }
            if (layer.name.contains("truck") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, truck: &config_new.truck, coordinate: coordinate)
            }
            if (layer.name.contains("user") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, user: &config_new.user, coordinate: coordinate)
            }
            if (layer.name.contains("map_control") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, map_control: &config_new.map_control, coordinate: coordinate)
            }
            if (layer.name.contains("debug") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, debug: &config_new.debug, coordinate: coordinate)
            }
        }
        self.info = config_new
        return true
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               map_settings: inout map_settings_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &map_settings.geoms)

            mvt_layer.get_value(tagMap: tagMap, tagKey: "map_color", value: &map_settings.map_color)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "cavata", value: &map_settings.cavata)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "auto_map_level", value: &map_settings.auto_map_level)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "favorite_map_display", value: &map_settings.favorite_map_display)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "fuel_prices_map_display", value: &map_settings.fuel_prices_map_display)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               traffic: inout traffic_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &traffic.geoms)

            mvt_layer.get_value(tagMap: tagMap, tagKey: "per_traffic_info", value: &traffic.per_traffic_info)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "traffic_line", value: &traffic.traffic_line)
            traffic.real_time_traffic_type = config_real_time_traffic_type(rawValue: Int32(tagMap["real_time_traffic_type"] ?? "0")!)   ?? .none_t
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               route_search: inout route_search_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &route_search.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "minimum_time", value: &route_search.minimum_time)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "minimum_time_free", value: &route_search.minimum_time_free)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "shortest_distance", value: &route_search.shortest_distance)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "shortest_distance_free", value: &route_search.shortest_distance_free)
            route_search.use_route_option_type = use_route_option_type(rawValue: Int32(tagMap["use_route_option_type"] ?? "0")!) ?? .shortest_no_toll
            route_search.add_route_option_type = use_route_option_type(rawValue: Int32(tagMap["add_route_option_type"] ?? "0")!) ?? .shortest_no_toll
            mvt_layer.get_value(tagMap: tagMap, tagKey: "uphill_avoid", value: &route_search.uphill_avoid)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "dest_direction", value: &route_search.dest_direction)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "via_direction", value: &route_search.via_direction)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "school_zone_avoid", value: &route_search.school_zone_avoid)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ferry_avoid", value: &route_search.ferry_avoid)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "traffic_info_current", value: &route_search.traffic_info_current)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "traffic_info_historical", value: &route_search.traffic_info_historical)
            route_search.traffic_info_type = config_traffic_info_type(rawValue: Int32(tagMap["traffic_info_type"] ?? "0")!)   ?? .none_t
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               vehicle: inout vehicle_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &vehicle.geoms)
            
            vehicle.vehicle_info_type = config_vehicle_info_type(rawValue: Int32(tagMap["vehicle_info_type"] ?? "0")!)   ?? .none_t
            vehicle.fuel_type = config_fuel_type(rawValue: Int32(tagMap["fuel_type"] ?? "0")!)   ?? .none_t
            vehicle.gas_type = config_gas_type(rawValue: Int32(tagMap["gas_type"] ?? "0")!)   ?? .none_t
            vehicle.diesel_type = config_diesel_type(rawValue: Int32(tagMap["diesel_type"] ?? "0")!)   ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "left_driver_seat", value: &vehicle.left_driver_seat)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               guidance_setting: inout guidance_setting_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &guidance_setting.geoms)
            
            // camera
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_red_light_camera_check", value: &guidance_setting.camera.red_light_camera_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_lane_change_camera_check", value: &guidance_setting.camera.lane_change_camera_check)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_camera_over_speed_check", value: &guidance_setting.camera.over_speed_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_over_signal_check", value: &guidance_setting.camera.over_signal_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_bus_only_lane_check", value: &guidance_setting.camera.bus_only_lane_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_cut_in_check", value: &guidance_setting.camera.cut_in_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_tail_gating_check", value: &guidance_setting.camera.tail_gating_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_school_zone_check", value: &guidance_setting.camera.school_zone_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_senior_zones_check", value: &guidance_setting.camera.senior_zones_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_class_5_emission_check", value: &guidance_setting.camera.class_5_emission_checkl)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_poor_load_check", value: &guidance_setting.camera.poor_load_check)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "camera_over_load_check", value: &guidance_setting.camera.over_load_check)
            // ando
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_speed_bump", value: &guidance_setting.ando.speed_bump)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_accidents", value: &guidance_setting.ando.accidents)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_falling_rocks", value: &guidance_setting.ando.falling_rocks)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_fog_caution", value: &guidance_setting.ando.fog_caution)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_fall_caution", value: &guidance_setting.ando.fall_caution)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_railroad_crossing", value: &guidance_setting.ando.railroad_crossing)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_sharp_curve", value: &guidance_setting.ando.sharp_curve)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_strong_wind", value: &guidance_setting.ando.strong_wind)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_wildlife_sanctuary", value: &guidance_setting.ando.wildlife_sanctuary)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_freezing_section", value: &guidance_setting.ando.freezing_section)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_sharp_curve", value: &guidance_setting.ando.th_sharp_curve)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_winding", value: &guidance_setting.ando.th_winding)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_zig_zag", value: &guidance_setting.ando.th_zig_zag)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_narrow", value: &guidance_setting.ando.th_narrow)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_narrow_bridge", value: &guidance_setting.ando.th_narrow_bridge)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_railroad_crossing", value: &guidance_setting.ando.th_railroad_crossing)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_weight_limit", value: &guidance_setting.ando.th_weight_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_height_limit", value: &guidance_setting.ando.th_height_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_uphill", value: &guidance_setting.ando.th_uphill)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_downhill", value: &guidance_setting.ando.th_downhill)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_slippery", value: &guidance_setting.ando.th_slippery)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_loose_surface", value: &guidance_setting.ando.th_loose_surface)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_falling_rock", value: &guidance_setting.ando.th_falling_rock)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_road_kill", value: &guidance_setting.ando.th_road_kill)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_no_overtaking", value: &guidance_setting.ando.th_no_overtaking)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_end_restriction", value: &guidance_setting.ando.th_end_restriction)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_speed_hump", value: &guidance_setting.ando.th_speed_hump)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_accidental_area", value: &guidance_setting.ando.th_accidental_area)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ando_th_school_zone", value: &guidance_setting.ando.th_school_zone)
            
            // etc
            mvt_layer.get_value(tagMap: tagMap, tagKey: "guide_etc_collect_traffic_info", value: &guidance_setting.guide_etc.collect_traffic_info)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               etc: inout etc_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &etc.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "warn_data_usage", value: &etc.warn_data_usage)
            etc.language_type = config_language_type(rawValue: Int32(tagMap["language_type"] ?? "0")!)   ?? .none_t
            etc.country_type = config_country_type(rawValue: Int32(tagMap["country_type"] ?? "0")!)   ?? .none_t
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               truck: inout truck_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &truck.geoms)
            
            truck.truck_detail_type = config_truck_detail_type(rawValue: Int32(tagMap["truck_detail_type"] ?? "0")!)   ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_height_no_limit", value: &truck.truck_height_no_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_height", value: &truck.truck_height)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_width_no_limit", value: &truck.truck_width_no_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_width", value: &truck.truck_width)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_weight_no_limit", value: &truck.truck_weight_no_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_weight", value: &truck.truck_weight)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "load_weight_no_limit", value: &truck.load_weight_no_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "load_weight", value: &truck.load_weight)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_length_no_limit", value: &truck.truck_length_no_limit)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "truck_length", value: &truck.truck_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "u_turn_lane", value: &truck.u_turn_lane)
        }
    }
    
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               user: inout user_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &user.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "email", value: &user.email)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "name", value: &user.name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "is_logged_in", value: &user.is_logged_in)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remain_time_toggle", value: &user.remain_time_toggle)
            user.ui_mode = ui_mode_type(rawValue: Int32(tagMap["ui_mode"] ?? "0")!)   ?? .none_t
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               map_control: inout map_control_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &map_control.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "view_mode", value: &map_control.view_mode)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "aerial_mode", value: &map_control.aerial_mode)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "building_mode", value: &map_control.building_mode)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               debug: inout debug_st,
                               coordinate: mvt_coordinate) -> Void {

        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &debug.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "simul_gps", value: &debug.simul_gps)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "draw_gps_point", value: &debug.draw_gps_point)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "send_tracker_data", value: &debug.send_tracker_data)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "draw_sdi_line", value: &debug.draw_sdi_line)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "draw_candidate_link", value: &debug.draw_candidate_link)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "simulation_mode", value: &debug.simulation_mode)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "debug_mode", value: &debug.debug_mode)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "lab_command", value: &debug.lab_command)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "simul_idx", value: &debug.simul_idx)
        }
    }
}


extension config_info_st: Hashable {
    
}

extension map_settings_st: Hashable {
    static func == (lhs: map_settings_st, rhs: map_settings_st) -> Bool {
        return lhs.map_color == rhs.map_color &&
        lhs.cavata == rhs.cavata &&
        lhs.auto_map_level == rhs.auto_map_level &&
        lhs.favorite_map_display == rhs.favorite_map_display &&
        lhs.fuel_prices_map_display == rhs.fuel_prices_map_display
    }
}

extension traffic_st: Hashable {
    static func == (lhs: traffic_st, rhs: traffic_st) -> Bool {
        return lhs.per_traffic_info == rhs.per_traffic_info &&
        lhs.traffic_line == rhs.traffic_line &&
        lhs.real_time_traffic_type == rhs.real_time_traffic_type
    }
}

extension route_search_st: Hashable {
    static func == (lhs: route_search_st, rhs: route_search_st) -> Bool {
        return lhs.minimum_time == rhs.minimum_time &&
        lhs.minimum_time_free == rhs.minimum_time_free &&
        lhs.shortest_distance == rhs.shortest_distance &&
        lhs.shortest_distance_free == rhs.shortest_distance_free &&
        lhs.use_route_option_type == rhs.use_route_option_type &&
        lhs.uphill_avoid == rhs.uphill_avoid &&
        lhs.dest_direction == rhs.dest_direction &&
        lhs.via_direction == rhs.via_direction &&
        lhs.school_zone_avoid == rhs.school_zone_avoid &&
        lhs.ferry_avoid == rhs.ferry_avoid &&
        lhs.traffic_info_current == rhs.traffic_info_current &&
        lhs.traffic_info_historical == rhs.traffic_info_historical &&
        lhs.traffic_info_type == rhs.traffic_info_type
    }
}

extension vehicle_st: Hashable {
    static func == (lhs: vehicle_st, rhs: vehicle_st) -> Bool {
        return lhs.vehicle_info_type == rhs.vehicle_info_type &&
        lhs.fuel_type == rhs.fuel_type &&
        lhs.gas_type == rhs.gas_type &&
        lhs.diesel_type == rhs.diesel_type &&
        lhs.left_driver_seat == rhs.left_driver_seat
    }
}


extension guidance_setting_st: Hashable {
    static func == (lhs: guidance_setting_st, rhs: guidance_setting_st) -> Bool {
        return lhs.camera == rhs.camera &&
        lhs.ando == rhs.ando &&
        lhs.guide_etc == rhs.guide_etc
    }
}

extension camera_st: Hashable {
    static func == (lhs: camera_st, rhs: camera_st) -> Bool {
        return lhs.red_light_camera_check == rhs.red_light_camera_check &&
        lhs.lane_change_camera_check == rhs.lane_change_camera_check &&
        lhs.over_speed_check == rhs.over_speed_check &&
        lhs.over_signal_check == rhs.over_signal_check &&
        lhs.bus_only_lane_check == rhs.bus_only_lane_check &&
        lhs.cut_in_check == rhs.cut_in_check &&
        lhs.tail_gating_check == rhs.tail_gating_check &&
        lhs.school_zone_check == rhs.school_zone_check &&
        lhs.senior_zones_check == rhs.senior_zones_check &&
        lhs.class_5_emission_checkl == rhs.class_5_emission_checkl &&
        lhs.poor_load_check == rhs.poor_load_check &&
        lhs.over_load_check == rhs.over_load_check
    }
}


extension ando_st: Hashable {
    static func == (lhs: ando_st, rhs: ando_st) -> Bool {
        return lhs.speed_bump == rhs.speed_bump &&
        lhs.accidents == rhs.accidents &&
        lhs.falling_rocks == rhs.falling_rocks &&
        lhs.fog_caution == rhs.fog_caution &&
        lhs.fall_caution == rhs.fall_caution &&
        lhs.railroad_crossing == rhs.railroad_crossing &&
        lhs.sharp_curve == rhs.sharp_curve &&
        lhs.strong_wind == rhs.strong_wind &&
        lhs.wildlife_sanctuary == rhs.wildlife_sanctuary &&
        lhs.freezing_section == rhs.freezing_section &&
        
        lhs.th_sharp_curve == rhs.th_sharp_curve &&
        lhs.th_winding == rhs.th_winding &&
        lhs.th_zig_zag == rhs.th_zig_zag &&
        lhs.th_narrow == rhs.th_narrow &&
        lhs.th_narrow_bridge == rhs.th_narrow_bridge &&
        lhs.th_railroad_crossing == rhs.th_railroad_crossing &&
        lhs.th_weight_limit == rhs.th_weight_limit &&
        lhs.th_height_limit == rhs.th_height_limit &&
        lhs.th_uphill == rhs.th_uphill &&
        lhs.th_downhill == rhs.th_downhill &&
        lhs.th_slippery == rhs.th_slippery &&
        lhs.th_loose_surface == rhs.th_loose_surface &&
        lhs.th_falling_rock == rhs.th_falling_rock &&
        lhs.th_road_kill == rhs.th_road_kill &&
        lhs.th_no_overtaking == rhs.th_no_overtaking &&
        lhs.th_end_restriction == rhs.th_end_restriction &&
        lhs.th_speed_hump == rhs.th_speed_hump &&
        lhs.th_accidental_area == rhs.th_accidental_area &&
        lhs.th_school_zone == rhs.th_school_zone
    }
}

extension guide_etc_st: Hashable {
    static func == (lhs: guide_etc_st, rhs: guide_etc_st) -> Bool {
        return lhs.collect_traffic_info == rhs.collect_traffic_info
    }
}


extension etc_st: Hashable {
    static func == (lhs: etc_st, rhs: etc_st) -> Bool {
        return lhs.language_type == rhs.language_type &&
        lhs.country_type == rhs.country_type &&
        lhs.warn_data_usage == rhs.warn_data_usage
    }
}

extension truck_st: Hashable {
    static func == (lhs: truck_st, rhs: truck_st) -> Bool {
        return lhs.truck_detail_type == rhs.truck_detail_type &&
        lhs.truck_height_no_limit == rhs.truck_height_no_limit &&
        lhs.truck_height == rhs.truck_height &&
        lhs.truck_width_no_limit == rhs.truck_width_no_limit &&
        lhs.truck_width == rhs.truck_width &&
        lhs.truck_weight_no_limit == rhs.truck_weight_no_limit &&
        lhs.truck_weight == rhs.truck_weight &&
        lhs.load_weight_no_limit == rhs.load_weight_no_limit &&
        lhs.load_weight == rhs.load_weight &&
        lhs.truck_length_no_limit == rhs.truck_length_no_limit &&
        lhs.truck_length == rhs.truck_length &&
        lhs.u_turn_lane == rhs.u_turn_lane
    }
}

extension user_st: Hashable {
    static func == (lhs: user_st, rhs: user_st) -> Bool {
        return lhs.email == rhs.email &&
        lhs.name == rhs.name &&
        lhs.is_logged_in == rhs.is_logged_in &&
        lhs.remain_time_toggle == rhs.remain_time_toggle
    }
}

extension map_control_st: Hashable {
    static func == (lhs: map_control_st, rhs: map_control_st) -> Bool {
        return lhs.view_mode == rhs.view_mode &&
        lhs.aerial_mode == rhs.aerial_mode &&
        lhs.building_mode == rhs.building_mode
    }
}

extension debug_st: Hashable {
    static func == (lhs: debug_st, rhs: debug_st) -> Bool {
        return lhs.simul_gps == rhs.simul_gps &&
        lhs.draw_gps_point == rhs.draw_gps_point &&
        lhs.send_tracker_data == rhs.send_tracker_data &&
        lhs.draw_sdi_line == rhs.draw_sdi_line &&
        lhs.draw_candidate_link == rhs.draw_candidate_link &&
        lhs.simulation_mode == rhs.simulation_mode &&
        lhs.debug_mode == rhs.debug_mode &&
        lhs.lab_command == rhs.lab_command &&
        lhs.simul_idx == rhs.simul_idx
    }
}

extension mvt_geoms: Hashable {
    public static func == (lhs: mvt_geoms, rhs: mvt_geoms) -> Bool {
        return lhs.geom_type == rhs.geom_type &&
        lhs.length == rhs.length &&
        lhs.coordinate == rhs.coordinate &&
        lhs.mbr == rhs.mbr &&
        lhs.points == rhs.points &&
        lhs.lines == rhs.lines
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(geom_type)
        hasher.combine(length)
        hasher.combine(coordinate)
        hasher.combine(mbr)
        hasher.combine(points)
        hasher.combine(lines)
    }
}

extension MBR32D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(min)
        hasher.combine(max)
    }
    
    public static func == (lhs: MBR32D, rhs: MBR32D) -> Bool {
        return lhs.min == rhs.min &&
        lhs.max == rhs.max
    }
}

extension VERTEX32D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(dx)
        hasher.combine(dy)
    }
    
    public static func == (lhs: VERTEX32D, rhs: VERTEX32D) -> Bool {
        return lhs.dx == rhs.dx &&
        lhs.dy == rhs.dy
    }
}
