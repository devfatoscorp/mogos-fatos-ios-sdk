//
//  RGStructs.swift
//  fatoshi-swift
//
//  Created by Heecheon Park on 2021/06/10.
//

import Foundation
import SwiftProtobuf

public enum TURN_TYPE : Int32, CaseIterable {
    case eTurn_none                   = 0
    case eTurn_straight               = 1   // 직진
    case eTurn_turn_left              = 2   // 좌회전
    case eTurn_turn_right             = 3   // 우회전
    case eTurn_turn_slight_left       = 4   // 완만한 좌회전 (11시 방향)
    case eTurn_turn_slight_right      = 5   // 완만한 우회전 (1시 방향)
    case eTurn_turn_sharp_left        = 6   // 급한 좌회전 (7시 방향)
    case eTurn_turn_sharp_right       = 7   // 급한 우회전 (5시 방향)
    case eTurn_ramp_left              = 8   // 왼쪽 도로 진출
    case eTurn_ramp_right             = 9   // 오른쪽 도로 진출
    case eTurn_fork_left              = 10  // 왼쪽 도로
    case eTurn_fork_right             = 11  // 오른쪽 도로
    case eTurn_keep_left              = 12  // 왼쪽도로 유지
    case eTurn_keep_right             = 13  // 오른쪽 도로 유지
    case eTurn_uturn_left             = 14  // 유턴 (왼쪽 방향)
    case eTurn_uturn_right            = 15  // 유턴 (오른쪽 방향)
    case eTurn_pturn_left             = 16  // P턴 (왼쪽 방향)
    case eTurn_pturn_right            = 17  // P턴 (오른쪽 방향)
    case eTurn_roundabout_left        = 18  // 로터리에서 왼쪽 진출
    case eTurn_roundabout_right       = 19  // 로터리에서 오른쪽 진출
    case eTurn_merge                  = 20  // 합류도로
    case eTurn_1st_highway_in         = 21  // 고속도로 진입
    case eTurn_1st_highway_exit       = 22  // 고속도로 진출
    case eTurn_1st_highway_in_left    = 23  // 왼쪽 고속도로 진입
    case eTurn_1st_highway_exit_left  = 24  // 왼쪽 고속도로 진출
    case eTurn_1st_highway_in_right   = 25  // 오른쪽 고속도로 진입
    case eTurn_1st_highway_exit_right = 26  // 오른쪽 고속도로 진출
    case eTurn_2nd_highway_in         = 27  // 도시 고속화도로 진입
    case eTurn_2nd_highway_exit       = 28  // 도시 고속화도로 진출
    case eTurn_2nd_highway_in_left    = 29  // 왼쪽 도시 고속화도로 진입
    case eTurn_2nd_highway_exit_left  = 30  // 왼쪽 도시 고속화도로 진출
    case eTurn_2nd_highway_in_right   = 31  // 오른쪽 도시 고속화도로 진입
    case eTurn_2nd_highway_exit_right = 32  // 오른쪽 도시 고속화도로 진출
    case eTurn_tunnel                 = 33  // 터널
    case eTurn_overpass               = 34  // 고가도로 진입
    case eTurn_overpass1              = 35  // 고가도로 진입
    case eTurn_overpass_left          = 36  // 왼쪽 고가도로 진입
    case eTurn_overpass_right         = 37  // 오른쪽 고가도로 진입
    case eTurn_underpass              = 38  // 지하차도 진입
    case eTurn_underpass_left         = 39  // 왼쪽 지하차도 진입
    case eTurn_underpass_right        = 40  // 오른쪽 지하차도 진입
    case eTurn_left_underpass         = 41  // 지하차도 옆 왼쪽 도로
    case eTurn_right_underpass        = 42  // 지하차도 옆 오른쪽 도로
    case eTurn_tollgate               = 43  // 요금소
    case eTurn_ferry_train            = 44  // 페리 트레인
    case eTurn_ferry                  = 45  // 페리
    case eTurn_left_overpass          = 46  // 고가도로 옆 왼쪽 도로
    case eTurn_right_overpass         = 47  // 고가도로 옆 오른쪽 도로
    case eTurn_service_area           = 48  // 휴게소
    case eTurn_origin                 = 49  // 출발지
    case eTurn_destination            = 50  // 목적지
    case eTurn_via1                   = 51  // 경유지1
    case eTurn_via2                   = 52  // 경유지2
    case eTurn_via3                   = 53  // 경유지3
    case eTurn_rest_area              = 54  // 졸음쉼터(휴게소)
    case eTurn_left_sa                = 55  // 휴게소 옆 고속도로 본선
    case eTurn_ic                     = 56  // IC
    case eTurn_left_ic                = 57  // IC 옆 고속도로 본선
    case eTurn_jc                     = 58  // JC
    case eTurn_via                    = 59  // 경유지
    case eTurn_via4                   = 60  // 경유지4
    case eTurn_left_sa_ic             = 61  // 휴게소/IC 옆 고속도로 본선
    case eTurn_left_sa_jc             = 62  // 휴게소/JC 옆 고속도로 본선
    case eTurn_left_jc                = 63  // JC 옆 고속도로 본선
    case eTurn_left_rest_area         = 64  // 졸음쉼터 옆도로
    case eTurn_rotary_0               = 70  // 회전교차로에서 직진
    case eTurn_rotary_1               = 71  // 회전교차로 첫번쨰 출구
    case eTurn_rotary_2               = 72  // 회전교차로 두번쨰 출구
    case eTurn_rotary_3               = 73  // 회전교차로 세번쨰 출구
    case eTurn_rotary_4               = 74  // 회전교차로 네번쨰 출구
    case eTurn_rotary_5               = 75  // 회전교차로 다섯번쨰 출구
    case eTurn_rotary_6               = 76  // 회전교차로 여섯번쨰 출구
    case eTurn_rotary_7               = 77  // 회전교차로 일곱번쨰 출구
    case eTurn_rotary_uturn           = 78  // 회전교차로 uturn
    case eTurn_rotary_0_clockwise     = 79  // 회전교차로(시계방향)에서 직진
    case eTurn_rotary_1_clockwise     = 80  // 회전교차로(시계방향) 첫번쨰 출구
    case eTurn_rotary_2_clockwise     = 81  // 회전교차로(시계방향) 두번쨰 출구
    case eTurn_rotary_3_clockwise     = 82  // 회전교차로(시계방향) 세번쨰 출구
    case eTurn_rotary_4_clockwise     = 83  // 회전교차로(시계방향) 네번쨰 출구
    case eTurn_rotary_5_clockwise     = 84  // 회전교차로(시계방향) 다섯번쨰 출구
    case eTurn_rotary_6_clockwise     = 85  // 회전교차로(시계방향) 여섯번쨰 출구
    case eTurn_rotary_7_clockwise     = 86  // 회전교차로(시계방향) 일곱번쨰 출구
    case eTurn_rotary_uturn_clockwise = 87  // 회전교차로(시계방향) uturn
    case eTurn_viaGoal1               = 101 // 제1목적지 ~
    case eTurn_viaGoal2               = 102 // 제1목적지 ~
    case eTurn_viaGoal3               = 103 // 제1목적지 ~
    case eTurn_viaGoal4               = 104 // 제1목적지 ~
    case eTurn_viaGoal5               = 105 // 제1목적지 ~
    case eTurn_viaGoal6               = 106 // 제1목적지 ~
    case eTurn_viaGoal7               = 107 // 제1목적지 ~
    case eTurn_viaGoal8               = 108 // 제1목적지 ~
    case eTurn_viaGoal9               = 109 // 제1목적지 ~
    
    case eTurn_viaGoal10 = 110 // 제1목적지 ~
    case eTurn_viaGoal11 = 111 // 제1목적지 ~
    case eTurn_viaGoal12 = 112 // 제1목적지 ~
    case eTurn_viaGoal13 = 113 // 제1목적지 ~
    case eTurn_viaGoal14 = 114 // 제1목적지 ~
    case eTurn_viaGoal15 = 115 // 제1목적지 ~
    case eTurn_viaGoal16 = 116 // 제1목적지 ~
    case eTurn_viaGoal17 = 117 // 제1목적지 ~
    case eTurn_viaGoal18 = 118 // 제1목적지 ~
    case eTurn_viaGoal19 = 119 // 제1목적지 ~
    
    case eTurn_viaGoal20 = 120 // 제1목적지 ~
    case eTurn_viaGoal21 = 121 // 제1목적지 ~
    case eTurn_viaGoal22 = 122 // 제1목적지 ~
    case eTurn_viaGoal23 = 123 // 제1목적지 ~
    case eTurn_viaGoal24 = 124 // 제1목적지 ~
    case eTurn_viaGoal25 = 125 // 제1목적지 ~
    case eTurn_viaGoal26 = 126 // 제1목적지 ~
    case eTurn_viaGoal27 = 127 // 제1목적지 ~
    case eTurn_viaGoal28 = 128 // 제1목적지 ~
    case eTurn_viaGoal29 = 129 // 제1목적지 ~
    
    case eTurn_viaGoal30 = 130 // 제1목적지 ~
    case eTurn_viaGoal31 = 131 // 제1목적지 ~
    case eTurn_viaGoal32 = 132 // 제1목적지 ~
    case eTurn_viaGoal33 = 133 // 제1목적지 ~
    case eTurn_viaGoal34 = 134 // 제1목적지 ~
    case eTurn_viaGoal35 = 135 // 제1목적지 ~
    case eTurn_viaGoal36 = 136 // 제1목적지 ~
    case eTurn_viaGoal37 = 137 // 제1목적지 ~
    case eTurn_viaGoal38 = 138 // 제1목적지 ~
    case eTurn_viaGoal39 = 139 // 제1목적지 ~
    
    case eTurn_viaGoal40 = 140 // 제1목적지 ~
    case eTurn_viaGoal41 = 141 // 제1목적지 ~
    case eTurn_viaGoal42 = 142 // 제1목적지 ~
    case eTurn_viaGoal43 = 143 // 제1목적지 ~
    case eTurn_viaGoal44 = 144 // 제1목적지 ~
    case eTurn_viaGoal45 = 145 // 제1목적지 ~
    case eTurn_viaGoal46 = 146 // 제1목적지 ~
    case eTurn_viaGoal47 = 147 // 제1목적지 ~
    case eTurn_viaGoal48 = 148 // 제1목적지 ~
    case eTurn_viaGoal49 = 149 // 제1목적지 ~
    
    case eTurn_viaGoal50 = 150 // 제1목적지 ~
    case eTurn_viaGoal51 = 151 // 제1목적지 ~
    case eTurn_viaGoal52 = 152 // 제1목적지 ~
    case eTurn_viaGoal53 = 153 // 제1목적지 ~
    case eTurn_viaGoal54 = 154 // 제1목적지 ~
    case eTurn_viaGoal55 = 155 // 제1목적지 ~
    case eTurn_viaGoal56 = 156 // 제1목적지 ~
    case eTurn_viaGoal57 = 157 // 제1목적지 ~
    case eTurn_viaGoal58 = 158 // 제1목적지 ~
    case eTurn_viaGoal59 = 159 // 제1목적지 ~
    
    case eTurn_viaGoal60 = 160 // 제1목적지 ~
    case eTurn_viaGoal61 = 161 // 제1목적지 ~
    case eTurn_viaGoal62 = 162 // 제1목적지 ~
    case eTurn_viaGoal63 = 163 // 제1목적지 ~
    case eTurn_viaGoal64 = 164 // 제1목적지 ~
    case eTurn_viaGoal65 = 165 // 제1목적지 ~
    case eTurn_viaGoal66 = 166 // 제1목적지 ~
    case eTurn_viaGoal67 = 167 // 제1목적지 ~
    case eTurn_viaGoal68 = 168 // 제1목적지 ~
    case eTurn_viaGoal69 = 169 // 제1목적지 ~
    
    case eTurn_viaGoal70 = 170 // 제1목적지 ~
    case eTurn_viaGoal71 = 171 // 제1목적지 ~
    case eTurn_viaGoal72 = 172 // 제1목적지 ~
    case eTurn_viaGoal73 = 173 // 제1목적지 ~
    case eTurn_viaGoal74 = 174 // 제1목적지 ~
    case eTurn_viaGoal75 = 175 // 제1목적지 ~
    case eTurn_viaGoal76 = 176 // 제1목적지 ~
    case eTurn_viaGoal77 = 177 // 제1목적지 ~
    case eTurn_viaGoal78 = 178 // 제1목적지 ~
    case eTurn_viaGoal79 = 179 // 제1목적지 ~
    
    case eTurn_viaGoal80 = 180 // 제1목적지 ~
    case eTurn_viaGoal81 = 181 // 제1목적지 ~
    case eTurn_viaGoal82 = 182 // 제1목적지 ~
    case eTurn_viaGoal83 = 183 // 제1목적지 ~
    case eTurn_viaGoal84 = 184 // 제1목적지 ~
    case eTurn_viaGoal85 = 185 // 제1목적지 ~
    case eTurn_viaGoal86 = 186 // 제1목적지 ~
    case eTurn_viaGoal87 = 187 // 제1목적지 ~
    case eTurn_viaGoal88 = 188 // 제1목적지 ~
    case eTurn_viaGoal89 = 189 // 제1목적지 ~
    
    case eTurn_viaGoal90 = 190 // 제1목적지 ~
    case eTurn_viaGoal91 = 191 // 제1목적지 ~
    case eTurn_viaGoal92 = 192 // 제1목적지 ~
    case eTurn_viaGoal93 = 193 // 제1목적지 ~
    case eTurn_viaGoal94 = 194 // 제1목적지 ~
    case eTurn_viaGoal95 = 195 // 제1목적지 ~
    case eTurn_viaGoal96 = 196 // 제1목적지 ~
    case eTurn_viaGoal97 = 197 // 제1목적지 ~
    case eTurn_viaGoal98 = 198 // 제1목적지 ~
    case eTurn_viaGoal99 = 199 // 제1목적지 ~
    
    case eTurn_viaGoal100 = 200 // 200번까지 사용 금지 (경유 목적지 번호 활용)
    
    case eTurn_straight_no_cost = 254 // mesh 경계점, 교차로 out 에서의 회전
    case eTurn_uturn_end        = 255 // 도로종료점유턴
}

//MARK: RP Structs
//MARK: - one_st (mgl::route::one_st)
public struct route_one_st {
    //MARK: - UI에서도 사용함
    public var version               : Int32                 = 0
    public var summary               : summary_st            = summary_st()
    public var service_link_list     : [service_link_st]     = []
    public var express_link_list     : [express_link_st]     = []
    public var service_area_list     : [service_area_st]     = []
    public var tollgate_list         : [tollgate_st]         = []
    public var direction_sign_list   : [direction_sign_st]   = []
    public var cross_image_list      : [cross_image_st]      = []
    
    //MARK: - 엔진에서만 사용
    //    public var real_link        : [real_link]
    //    public var atbt             : [atbt_st]
    
    mutating public func clear() -> Void {
        self.version = 0
        self.summary.clear()
        self.service_link_list.removeAll()
        //        self.real_link.removeAll()
        self.express_link_list.removeAll()
        //        self.atbt.removeAll()
        self.service_area_list.removeAll()
        self.tollgate_list.removeAll()
        self.direction_sign_list.removeAll()
        self.cross_image_list.removeAll()
    }
}

//MARK: - summary_st
public struct summary_st {
    var copyrights      : String = ""
    var source          : String = ""
    var session_id      : String = ""       // RP서버 세션아이디 디버그 용도
    var route_type      : route_request_type = .none_t
    var error_code      : Int32  = 0
    var distance        : Int32  = 0
    var duration        : Int32  = 0
    var toll_rate       : Int32  = 0
    var oil_cost        : Int32  = 0
    var rp_opt          : Int32  = 0
    var rp_optex        : Int32  = 0
    var fee_opt         : Int32  = 0
    var is_traffic      : Bool   = false
    var start_name      : String = ""
    var end_name        : String = ""
    var via_count       : Int32  = 0
    var mbr             : MBR32D    = MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0))
    var summary         : String = ""
    var summary_ex      : String = ""
    var geoms           : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.copyrights.removeAll()
        self.source.removeAll()
        self.route_type = .none_t
        self.error_code = 0
        self.distance = 0
        self.duration = 0
        self.toll_rate = 0
        self.oil_cost = 0
        self.rp_opt = 0
        self.rp_optex = 0
        self.fee_opt = 0
        self.is_traffic = false
        self.start_name.removeAll()
        self.end_name.removeAll()
        self.via_count = 0
        self.mbr.reset()
        self.summary.removeAll()
        self.summary_ex.removeAll()
        self.geoms = mvt_geoms()
    }
}

//MARK: - service_link_st
public struct service_link_st {
    public var svc_idx          : Int32     = 0
    public var turn_code        : TURN_TYPE = TURN_TYPE.eTurn_none      // TBT 인덱스 (턴코드)
    public var start_link       : Int32     = 0
    public var end_link         : Int32     = 0
    public var remainder_dist   : Int32     = 0
    public var remainder_time   : Int32     = 0
    public var length           : Int32     = 0
    public var duration         : Int32     = 0
    public var str_length       : String    = ""
    public var string_info      : String    = ""                        // 교차로명|도로명|방면정보1|방면정보2|방면정보3|다음도로명|하이패스|턴명칭
    public var rotary_dir_idx   : Int32     = 0                         // 로터리 진입/진출 각도 시계방향 인덱스 (0:0도, 1=45도, 2:90도, 3:135도, 4:180도, 5:225도, 6:270도, 7:315도)
    public var geoms            : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.svc_idx        = 0
        self.turn_code      = TURN_TYPE.eTurn_none
        self.start_link     = 0
        self.end_link       = 0
        self.remainder_dist = 0
        self.remainder_time = 0
        self.length         = 0
        self.duration       = 0
        self.str_length     = ""
        self.string_info    = ""
        self.geoms          = mvt_geoms()
    }
    
    mutating public func transform(
        svc_idx          : Int32,
        turn_code        : TURN_TYPE,
        start_link       : Int32,
        end_link         : Int32,
        remainder_dist   : Int32,
        remainder_time   : Int32,
        length           : Int32,
        duration         : Int32,
        string_info      : String,
        geoms            : mvt_geoms
    ) -> Void {
        self.svc_idx          = svc_idx
        self.turn_code        = turn_code
        self.start_link       = start_link
        self.end_link         = end_link
        self.remainder_dist   = remainder_dist
        self.remainder_time   = remainder_time
        self.length           = length
        self.duration         = duration
        self.string_info      = string_info
        self.geoms            = geoms
    }
    
}
//MARK: - express_link_st
public struct express_link_st {
    public var type             : express_link_type = express_link_type.none_t
    public var link_idx         : Int32     = 0
    public var remainder_dist   : Int32     = 0
    public var remainder_time   : Int32     = 0
    public var string_info      : String    = ""
    public var geoms            : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.type            = express_link_type.none_t
        self.link_idx        = 0
        self.string_info     = ""
        self.geoms           = mvt_geoms()
    }
    
    mutating public func transform(
        link_idx         : Int32,
        string_info      : String,
        geoms            : mvt_geoms
    ) -> Void {
        self.link_idx     = link_idx
        self.string_info  = string_info
        self.geoms        = geoms
    }
}

//MARK: - service_link_st
public struct service_area_st {
    public var link_idx         : Int32     = 0
    public var service          : String    = ""            // [휴게소] 화물차 휴게소, [휴게소] 수면실, [휴게소] 샤워실, [휴게소] 세탁실, [휴게소,주유소] 세차장, [휴게소,주유소] 정비소, [휴게소] 약국, [휴게소] 음식점, [주유소] 편의점, [주유소] 화장실, [주유소] 최저가 주유소
    public var oil_brand        : Int32     = 0
    public var gas_brand        : Int32     = 0
    public var name             : String    = ""
    public var geoms            : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.link_idx    = 0
        self.service     = ""
        self.oil_brand   = 0
        self.gas_brand   = 0
        self.name        = ""
        self.geoms       = mvt_geoms()
    }
    
    mutating public func transform(
        link_idx         : Int32,
        service          : String,
        oil_brand        : Int32,
        gas_brand        : Int32,
        name             : String,
        geoms            : mvt_geoms
    ) -> Void {
        self.link_idx         = link_idx
        self.service          = service
        self.oil_brand        = oil_brand
        self.gas_brand        = gas_brand
        self.name             = name
        self.geoms            = geoms
    }
}

//MARK: - tollgate_st
public struct tollgate_st {
    public var link_idx         : Int32         = 0
    public var type             : tollgate_type = .none_t
    public var id               : Int32         = 0
    public var rate             : Int32         = 0
    public var name             : String        = ""
    public var hipass           : hipass_st     = hipass_st()
    public var geoms            : mvt_geoms     = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.link_idx = 0
        self.type = .none_t
        self.id = 0
        self.rate = 0
        self.name = ""
        self.hipass.clear()
        self.geoms = mvt_geoms()
    }
}

//MARK: - direction_sign_st
public struct direction_sign_st {
    public var link_idx         : Int32     = 0
    public var datas            : String    = ""
    
    mutating public func clear() -> Void {
        self.link_idx = 0
        self.datas = ""
    }
}

//MARK: - cross_image_st
public struct cross_image_st {
    public var link_idx         : Int32     = 0
    public var image_code       : String    = ""
    public var remainder_dist   : Int32     = 0
    public var geoms            : mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.link_idx = 0
        self.image_code = ""
        self.remainder_dist = 0
        self.geoms = mvt_geoms()
    }
}

public struct real_link {}
public struct atbt_st {}


public struct hipass_st {
    public var image_id         : Int32     = 0
    public var id               : Int32     = 0
    public var total_lane       : Int32     = 0
    public var lane_cnt         : Int32     = 0
    public var lane             : String    = ""
    
    mutating public func clear() -> Void {
        self.image_id = 0
        self.id = 0
        self.total_lane = 0
        self.lane_cnt = 0
        self.lane = ""
    }
}

//MARK: - RG Structs
//MARK: - one_st (mgl::rg::one_st)
public struct rg_one_st {
    public var version      : Int32             = 0
    public var ui           : ui_st             = ui_st()
    public var view_visible : view_visible_st   = view_visible_st()
    public var tollgate     : tollgate_st       = tollgate_st()
    public var sdi_list     : [sdi_st]          = []
    public var voice_list   : [voice_st]        = []
    public var via_list     : [via_st]          = []
    
    // Interface
    public var comm         : comm_st           = comm_st()
    public var is_last_route: is_last_route_st  = is_last_route_st()
    
    mutating public func clear() -> Void {
        ui.clear()
        view_visible.clear()
        tollgate.clear()
        sdi_list.removeAll()
        voice_list.removeAll()
        via_list.removeAll()
        
        comm.clear()
        is_last_route.clear()
    }
}

public struct ui_st {
    
    public var has_route            :Bool   = false             // 경로탐색 여부
    public var has_around_via       :Bool   = false             // 현재 주행 중인 경유지 주변일 경우
    public var route_idx            :Int32  = 0
    public var real_link_idx        :Int32  = 0
    public var service_link_idx     :Int32  = 0
    public var atbt_idx             :Int32  = 0
    public var rg_mm_status         :Int32  = 0                 // 맵매칭 상태
    public var local_mm_status      :Int32  = 0                 // 맵매칭 상태
    public var goal_status          :Int32  = 0                 // 목적지 도착 상태
    public var service_link_remainder_dist :Int32 = 0           // 서비스 링크까지 남은 거리 (턴까지 남은 거리)
    public var service_link_remainder_time :Int32 = 0           // 서비스 링크까지 남은 시간 (턴까지 남은 거리)
    public var total_remainder_dist :Int32  = 0                 // 목적지까지 남은 거리
    public var total_remainder_time :Int32  = 0                 // 목적지까지 남은 시간
    public var arrival_rate         :Float  = 0                 // 목적지까지 도착한 비율 (ui 미니카바타에 사용) (1000분율)
    public var str_length           :String = ""                // TBT1 남은 거리 (스트링)
    public var string_info          :String = ""                // 교차로명|도로명|방면정보1|방면정보2|방면정보3|다음도로명|하이패스|턴명칭
    public var bottom_info          :String = ""                // 하단바 정보
    public var mm_info              :mm_st  = mm_st()
    public var geoms                :mvt_geoms = mvt_geoms()
    // 위치
    mutating public func clear() -> Void {
        self.has_route                      = false
        self.has_around_via                 = false
        self.route_idx                      = 0
        self.real_link_idx                  = 0
        self.service_link_idx               = 0
        self.atbt_idx                       = 0
        self.rg_mm_status                   = 0
        self.local_mm_status                = 0
        self.service_link_remainder_dist    = 0
        self.service_link_remainder_time    = 0
        self.total_remainder_dist           = 0
        self.total_remainder_time           = 0
        self.arrival_rate                   = 0
        self.string_info                    = ""
        self.bottom_info                    = ""
        self.mm_info                        = mm_st()
        self.geoms                          = mvt_geoms()
    }
}

public struct mm_st {
    public var night                        :Bool   = false      // 야간모드
    public var fixed                        :Bool   = false      // GPS 상태
    public var link_id                      :Int32  = 0          // link id
    public var speed                        :Int32  = 0          // GPS 속도
    public var angle                        :Int32  = 0          // 맵매칭 각도
    public var road_cate                    :Int32  = 0          // 도로 종별
    public var link_cate                    :Int32  = 0          // 링크 종별
    public var link_facil                   :Int32  = 0          // 시설물 종별
    public var max_speed                    :Int32  = 0          // max_speed
    public var lane_guide                   :String = ""         // 차선 정보
    public var lane_guide_length            :String = ""         // 차선정보 유효 거리
    public var complexcode                  :String = ""
    public var complex_length               :Int32  = 0
    public var direction_sign_guide         :String = ""
    public var direction_sign_length        :String = ""
    public var direction_sign_max_length    :Int32 = 0
    public var autoScaleLevel               :Float = 0.0        // 오토 스케일 레벨
    public var autoScaleTilt                :Float = 0.0        // 오토 스케일 틸트
    
    mutating public func clear() -> Void {
        self.night      = false
        self.fixed      = false
        self.link_id    = 0
        self.speed      = 0
        self.angle      = 0
        self.road_cate  = 0
        self.link_cate  = 0
        self.link_facil = 0
        self.max_speed  = 0
        self.lane_guide  = ""
        self.lane_guide_length = ""
        self.complexcode = ""
        self.complex_length = 0
        self.direction_sign_guide = ""
        self.direction_sign_length = ""
        self.direction_sign_max_length = 0
        self.autoScaleLevel = 0.0
        self.autoScaleTilt = 0.0
    }
}

public struct via_st {
    
    public var remainder_dist       :Int32  = 0
    public var remainder_time       :Int32  = 0
    public var geoms                :mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.remainder_dist       = 0
        self.remainder_time       = 0
        self.geoms                = mvt_geoms()
    }
}

public struct voice_st {
    
    public var id                   :Int32  = 0
    public var text                 :String = ""
    public var play_complete        :Bool   = false
    public var geoms                :mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.id     = 0
        self.text   = ""
        self.play_complete = false
        self.geoms = mvt_geoms()
    }
}

public struct sdi_st {
    public var disp_type            :sdi_display_type      = .none_t     // SDI display Type
    public var type                 :sdi_type              = .none_t     // SDI Type
    public var visibility           :sdi_visibility_type   = .none_t     // SDI 거리 표출 여부
    public var angle                :Int32                 = 0           // 카메라 데이터 설치점 각도
    public var max_speed            :Int32                 = 0           // 최대 제한 속도
    public var dist                 :Int32                 = 0           // 카메라 까지 거리
    public var section_dist         :Int32                 = 0           // 구간 단속 총거리 (구간 단속 일때는 의미 있음)
    public var weight               :Int32                 = 0           // 화물차 관련 중량 정보
    public var height               :Int32                 = 0           // 화물차 관련 높이 정보
    public var ks_link_id           :UInt32                = 0           //
    public var geoms                :mvt_geoms = mvt_geoms()             // 위치
    
    mutating public func clear() -> Void {
        self.disp_type             = .none_t
        self.type                  = .none_t
        self.visibility            = .none_t
        self.angle                 = 0
        self.max_speed             = 0
        self.dist                  = 0
        self.section_dist          = 0
        self.weight                = 0
        self.height                = 0
        self.ks_link_id            = 0
        self.geoms                = mvt_geoms()
    }
}

public struct view_visible_st {
    public var first_tbt_visible        :Bool = false
    public var second_tbt_visible       :Bool = false
    public var sdi_visible              :Bool = false
    public var lane_visible             :Bool = false
    public var express_link_visible     :Bool = false
    public var hipass_visible           :Bool = false
    public var geoms                    :mvt_geoms = mvt_geoms()
    
    mutating public func clear() -> Void {
        self.first_tbt_visible    = false
        self.second_tbt_visible   = false
        self.sdi_visible          = false
        self.lane_visible         = false
        self.express_link_visible = false
        self.hipass_visible       = false
        self.geoms                = mvt_geoms()
    }
}

public struct is_last_route_st {
    public var exists           :Bool = false
    public var goal_name        :String = ""
    
    mutating public func clear() -> Void {
        self.exists     = false
        self.goal_name  = ""
    }
}

public struct comm_st {
    public var command          :rg_command_type = .none_t
    
    mutating public func clear() -> Void {
        self.command = .none_t
    }
}

//MARK: - RP Structs
public struct car_option_st {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //    차종 (교통수단)
    //    101 : 2축, 승용차, 16이하 승합        [KOR:1종            /    CDG:1]
    //    102 : 2축, 32아하 승합                [KOR:2종            /    CDG:x]
    //    103 : 2축, 33이상 승합                [KOR:3종            /    CDG:x]
    //    104 : 3축, 10~20t 화물차            [KOR:4종            /    CDG:17]
    //    105 : 4축이상, 20t이상 화물차        [KOR:5종            /    CDG:18]
    //    106 : 2축, 1000cc 이하 승용차        [KOR:6종            /    CDG:x]
    //    111 : 위험물(고압가스,위험물)            [KOR:위험물        /    CDG:16]
    //    112 : 화물차                        [KOR:화물차        /    CDG:7]
    //    113 : 건설기계                        [KOR:건설기계        /    CDG:x]
    //    114 : 건설기계                        [KOR:특수자동차        /    CDG:x]
    //    115 : 트레일러                        [KOR:x            /    CDG:8]
    //    116 : 농장차량                        [KOR:농장차량        /    CDG:14]
    //    121 : 버스                        [KOR:버스            /    CDG:2]
    //    122 : 택시                        [KOR:택시            /    CDG:3]
    //    123 : 빈택시                        [KOR:x            /    CDG:15]
    //    124 : 태국 CART                    [KOR:x            /    CDG:13]
    //    125 : HOV차량                        [KOR:x            /    CDG:9] (출퇴근 시간대 둘이상 탑승 차량, 국내는 다인승)
    //    126 : 응급차량                        [KOR:x            /    CDG:10]
    //    127 : 오토바이                        [KOR:오토바이        /    CDG:4]
    //    128 : 3바퀴 오토바이                [KOR:x            /    CDG:12]
    //    141 : 자전거                        [KOR:자전거        /    CDG:6]
    //    142 : 3발자전거                    [KOR:x            /    CDG:11]
    //    143 : 보행자                        [KOR:보행자        /    CDG:5]
    //    144 : 팻 트레거 전용                [KOR:팻            /    CDG:x]
    //    145 : 휠체어                        [KOR:휠체어        /    CDG:x]
    //    146 : 시각장애인                    [KOR:시각장애인        /    CDG:x]
    public var car_type         : Int32     = 0
    public var car_fuel         : Int32     = 0
    public var hipass           : Bool      = false
    public var car_weight       : UInt32    = 0
    public var car_height       : UInt32    = 0
    public var car_length       : UInt32    = 0
    public var uturnlane        : UInt32    = 0
    public var car_feetype      : UInt32    = 0
    
    mutating public func clear() -> Void {
        self.car_type     = 0
        self.car_fuel     = 0
        self.hipass       = false
        self.car_weight   = 0
        self.car_height   = 0
        self.car_length   = 0
        self.uturnlane    = 0
        self.car_feetype  = 0
    }
}

public struct route_option_st {
    public var search_option    : Int32     = 0
    public var angle            : Int32     = 0
    public var speed            : Int32     = 0
    public var fee_option       : Int32     = 0
    public var simple_mode      : Bool      = false
    public var special_option   : UInt32    = 0
    public var road_cate        : Int32     = 0
    public var traffic          : Bool      = false
    public var unixtime         : UInt32    = 0
    public var gmt_offset       : Int32     = 0
    public var pattern          : Bool      = false
    public var nonstop          : Int32     = 0
    
    mutating public func clear() -> Void {
        self.search_option  = 0
        self.angle          = 0
        self.speed          = 0
        self.fee_option     = 0
        self.simple_mode    = false
        self.special_option = 0
        self.road_cate      = 0
        self.traffic        = false
        self.unixtime       = 0
        self.gmt_offset     = 0
        self.pattern        = false
        self.nonstop        = 0
    }
}




//MARK: - Param Namespace
//MARK: - one_st (mgl::route::param::one_st)
public struct param_one_st {
    
    public var version      : Int32             = 0
    public var rp_info      : rp_info_st        = rp_info_st()
    
    mutating public func clear() -> Void {
        self.version = 0
        self.rp_info.clear()
    }
}

public struct rp_info_st {
    public var source       : Int32             = 0                     // 경로 Source (svcserver)
    public var lang         : Int32             = 0                     // 국가코드
    public var option       : Int32             = 0                     // 최적/고속/일반/최단
    public var option_ex    : Int32             = 0                     // 경로탐색 추가 옵션(자동차) : 무료도로우선(0x1)/자동차전용도로회피(0x2)/오르막회피(0x4)/어린이보호구역회피(0x8)/페리항로회피(0x10)/골목길회피(0x20)
    public var layers       : String            = ""                    // 요청 레이어 리스트 (summary, service_link, real_link, express_link, atbt, service_area, tollgate, cross_image 을 | 구분자로 추가)
    public var useremail    : String            = ""                    // 유저 이메일
    
    public var type         : Int32             = 0                     // 초탐/이탈/정주기/사용자
    public var site         : UInt32            = 0
    public var appversion   : UInt32            = 0
    public var mapversion   : UInt32            = 0
    public var platformtype : Int32             = 0
    public var servicetype  : Int32             = 0
    public var authcode     : String            = ""                    // sdk_key
    public var user_authcode : String           = ""
    public var sitesubcode  : UInt32            = 0
    
    // 사용자 정보
    public var usercode     : UInt32            = 0                     // 사용자코드
    public var devicename   : String            = ""                    // 단말기 이름
    public var osversion    : String            = ""                    // 단말기 OS version
    public var svcprovider  : UInt32            = 0                     // 통신사
    
    // 출발지 정보
    public var start_name   : String            = ""
    public var start_floor  : Int32             = 0
    public var start_dir    : Int32             = 0                     // 출발지 방향성체크  (1:방향성체크, 2:서버판단, 3:방향성체크 안함)
    
    // 목적지 정보
    public var end_name     : String            = ""                    // 목적지 명칭
    public var end_rpflag   : String            = ""                    // 목적지 RP flag(top2용)
    public var end_floor    : Int32             = 0                     // 목적지 층정보
    public var end_dir      : Int32             = 0                     // 목적지 방향성체크  (1:방향성체크, 2:서버판단, 3:방향성체크 안함)
    public var multi_entcount : UInt32          = 0                     // 다중 진입점 개수
    public var multi        : String            = ""                    // 다중 진입점 좌표 리스트 (x,y|x,y|x,y.........)
    
    
    public var via_name     : String            = ""                    // via_name1|via_name2|via_name3|via_name4
    public var via_dir      : String            = ""                    // 경유지 방향성체크 (0|0|0|1...)
    public var via_pass     : String            = ""                    // pass 경유지(유도 안내용) (0|0|1|1...)
    public var via_multi_entcount : String = ""
    public var via_multi : String = ""
    
    public var points       : String            = ""                    // UI에서 mvt_point 임시 대체. x,y|x,y (출발지,도착지) (UI에서 encoding용)
    public var geoms        : mvt_geoms         = mvt_geoms()           // points 출발지 - 경유지 - 목적지 :: lines GPS 좌표 (mvt_point_t lat, lon으로 등록)
    public var max_lat      : Double            = 0.0
    public var max_lng      : Double            = 0.0
    public var min_lat      : Double            = 0.0
    public var min_lng      : Double            = 0.0
    public var car_option   : car_option_st     = car_option_st()       // 차량 옵션
    public var route_option : route_option_st   = route_option_st()     // 경탐 옵션
    
    //    public var start_link   : mm_link_info_bit
    //    public var end_link     : location_Info_bit
    
    mutating public func clear() -> Void {
        self.source        = 0
        self.lang          = 0
        self.option        = 0
        self.useremail     = ""
        self.type          = 0
        self.start_name.removeAll()
        self.start_floor   = 0
        self.start_dir     = 0
        self.end_name.removeAll()
        self.end_rpflag.removeAll()
        self.end_floor     = 0
        self.end_dir       = 0
        self.multi_entcount = 0
        self.multi.removeAll()
        self.via_name.removeAll()
        self.via_dir.removeAll()
        self.via_pass.removeAll()
        self.geoms         = mvt_geoms()
        self.max_lat       = 0.0
        self.max_lng       = 0.0
        self.min_lat       = 0.0
        self.min_lng       = 0.0
        self.car_option.clear()
        self.route_option.clear()
    }
}

public class route_result: NSObject {
    
    typealias route_list = [route_one_st]
    var routeList = route_list()
    var tileInfo = mvt_tile_box(is_layer: false,
                                numTiles: 0,
                                mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                diff: VERTEX32D(dx: 0, dy: 0),
                                zoom: 0,
                                column: 0,
                                row: 0)
    
    internal func encode(mvt: VectorTile_Tile) -> String {
        do {
            let bmvt = try mvt.serializedData()
            print(type(of: bmvt))
            return String(decoding: bmvt, as: UTF8.self)
        } catch {
            print("Unable to convert mvt to binary")
        }
        return ""
    }
    
    
    
    internal func decode(mvt: VectorTile_Tile, coordinate: mvt_coordinate = .mvt_lonlat_t) -> Void {
        self.routeList.removeAll()
        self.tileInfo.clear()
        
        var routeNew       = route_one_st()
        let layerContainer = mvt.layers
        let layerCount: Int = layerContainer.count
        
        var routeIndex = 0
        var prevRouteIndex = -1
        for layerIndex in 0..<layerCount {
            
            var layer = mvt.layers[layerIndex]
            routeIndex = Int(layer.name.components(separatedBy: ",").first ?? "0")!
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
            
            
            if (routeIndex != prevRouteIndex) {
                self.routeList.append(routeNew)
                prevRouteIndex = routeIndex
                routeNew.clear()
            }
            
            var routeOne = self.routeList[routeIndex]
            
            if (layer.name.contains("summary") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, summary: &routeOne.summary, coordinate: coordinate)
            }
            if (layer.name.contains("service_link") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, service_link_list: &routeOne.service_link_list, coordinate: coordinate)
            }
            if (layer.name.contains("express_link") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, express_link_list: &routeOne.express_link_list, coordinate: coordinate)
            }
            if (layer.name.contains("service_area") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, service_area_list: &routeOne.service_area_list, coordinate: coordinate)
            }
            if (layer.name.contains("tollgate") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, tollgate_list: &routeOne.tollgate_list, coordinate: coordinate)
            }
            if (layer.name.contains("direction_sign") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, direction_sign_list: &routeOne.direction_sign_list, coordinate: coordinate)
            }
            if (layer.name.contains("cross_image") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, cross_image_list: &routeOne.cross_image_list, coordinate: coordinate)
            }
            
            self.routeList[routeIndex] = routeOne
        }
        print("Decode done")
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               summary: inout summary_st,
                               coordinate: mvt_coordinate) -> Void {
        
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &summary.geoms)
            
            //            tile_info.mbr = MBR(min: VERTEXD(dx: Double(tagMap["min_lng"] ?? "0")!,
            //                                             dy: Double(tagMap["min_lat"] ?? "0")!),
            //                                max: VERTEXD(dx: Double(tagMap["max_lng"] ?? "0")!,
            //                                             dy: Double(tagMap["max_lat"] ?? "0")!))
            //            tile_info.diff.dx = tile_info.mbr.max.dx - tile_info.mbr.min.dx
            //            tile_info.diff.dy = tile_info.mbr.max.dy - tile_info.mbr.min.dy
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "copyrights", value: &summary.copyrights)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "source", value: &summary.source)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "session_id", value: &summary.session_id)
            summary.route_type = route_request_type(rawValue: Int32(tagMap["route_type"] ?? "0")!)   ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "error_code", value: &summary.error_code)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "distance", value: &summary.distance)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "duration", value: &summary.duration)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "toll_rate", value: &summary.toll_rate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "oil_cost", value: &summary.oil_cost)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rp_opt", value: &summary.rp_opt)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rp_optex", value: &summary.rp_optex)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "fee_opt", value: &summary.fee_opt)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "is_traffic", value: &summary.is_traffic)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "start_name", value: &summary.start_name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "end_name", value: &summary.end_name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "via_count", value: &summary.via_count)
            summary.mbr = tile_info.mbr
            mvt_layer.get_value(tagMap: tagMap, tagKey: "summary", value: &summary.summary)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "summary_ex", value: &summary.summary_ex)
            
            //            tagMap.forEach { print("\($0)                   : \($1)") }
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               service_link_list: inout [service_link_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : service_link_st = service_link_st()
        service_link_list.reserveCapacity(mvt_layer.features.count)
        
        
        for f in 0..<mvt_layer.features.count {
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            
            _new.clear()
            service_link_list.append(_new)
            var service_link : service_link_st = service_link_list[service_link_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &service_link.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "svc_idx", value: &service_link.svc_idx)
            service_link.turn_code = TURN_TYPE(rawValue: Int32(tagMap["turn_code"] ?? "0")!)   ?? .eTurn_none
            mvt_layer.get_value(tagMap: tagMap, tagKey: "start_link", value: &service_link.start_link)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "end_link", value: &service_link.end_link)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_dist", value: &service_link.remainder_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_time", value: &service_link.remainder_time)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "length", value: &service_link.length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "duration", value: &service_link.duration)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "str_length", value: &service_link.str_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "string_info", value: &service_link.string_info)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rotary_dir_idx", value: &service_link.rotary_dir_idx)
            
            service_link_list[service_link_list.count - 1] = service_link
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               express_link_list: inout [express_link_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : express_link_st = express_link_st()
        express_link_list.reserveCapacity(mvt_layer.features.count)
        
        for f in 0..<mvt_layer.features.count {
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            express_link_list.append(_new)
            var express_link : express_link_st = express_link_list[express_link_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &express_link.geoms)
            
            express_link.type = express_link_type(rawValue: Int32(tagMap["type"] ?? "0")!) ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &express_link.link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_dist", value: &express_link.remainder_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_time", value: &express_link.remainder_time)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "string_info", value: &express_link.string_info)
            
            express_link_list[express_link_list.count - 1] = express_link
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               service_area_list: inout [service_area_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : service_area_st = service_area_st()
        service_area_list.reserveCapacity(mvt_layer.features.count)
        
        for f in 0..<mvt_layer.features.count {
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            service_area_list.append(_new)
            var service_area : service_area_st = service_area_list[service_area_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &service_area.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &service_area.link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "service", value: &service_area.service)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "oil_brand", value: &service_area.oil_brand)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "gas_brand", value: &service_area.gas_brand)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "name", value: &service_area.name)
            
            service_area_list[service_area_list.count - 1] = service_area
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               tollgate_list: inout [tollgate_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : tollgate_st = tollgate_st()
        tollgate_list.reserveCapacity(mvt_layer.features.count)
        
        for f in 0..<mvt_layer.features.count {
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            tollgate_list.append(_new)
            var tollgate : tollgate_st = tollgate_list[tollgate_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &tollgate.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &tollgate.link_idx)
            tollgate.type = tollgate_type(rawValue: Int32(tagMap["type"] ?? "0")!)                ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "id", value: &tollgate.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rate", value: &tollgate.rate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "name", value: &tollgate.name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_id", value: &tollgate.hipass.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_image_id", value: &tollgate.hipass.image_id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_lane", value: &tollgate.hipass.lane)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_lane_cnt", value: &tollgate.hipass.lane_cnt)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_total_lane", value: &tollgate.hipass.total_lane)
            
            tollgate_list[tollgate_list.count - 1] = tollgate
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               direction_sign_list: inout [direction_sign_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : direction_sign_st = direction_sign_st()
        direction_sign_list.reserveCapacity(mvt_layer.features.count)
        
        for f in 0..<mvt_layer.features.count {
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: mvt_layer.features[f].tags)
            _new.clear()
            direction_sign_list.append(_new)
            var direction_sign : direction_sign_st = direction_sign_list[direction_sign_list.count - 1]
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &direction_sign.link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "datas", value: &direction_sign.datas)
            
            direction_sign_list[direction_sign_list.count - 1] = direction_sign
        }
    }
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               cross_image_list: inout [cross_image_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new : cross_image_st = cross_image_st()
        cross_image_list.reserveCapacity(mvt_layer.features.count)
        
        for f in 0..<mvt_layer.features.count {
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            cross_image_list.append(_new)
            var cross_image : cross_image_st = cross_image_list[cross_image_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &cross_image.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &cross_image.link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "image_code", value: &cross_image.image_code)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_dist", value: &cross_image.remainder_dist)
            
            cross_image_list[cross_image_list.count - 1] = cross_image
        }
    }
    
    internal func get_list() -> [route_one_st] {
        return routeList
    }
}


public class param_result: NSObject {
    typealias param_list = [param_one_st]
    private var mlist : param_list = []
    override init(){}
    
    var tileInfo = mvt_tile_box(is_layer: false,
                                numTiles: 0,
                                mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                diff: VERTEX32D(dx: 0, dy: 0),
                                zoom: 0,
                                column: 0,
                                row: 0)
    
    let testMinX = Double(mglDegreeToWorldX(f: 126.89613))
    let testMinY = Double(mglDegreeToWorldY(f: 35.17989))
    let testMaxX = Double(mglDegreeToWorldX(f: 129.07587))
    let textMaxY = Double(mglDegreeToWorldY(f: 37.48302))
    
    public var testRP = param_one_st(version: 2, rp_info: rp_info_st(source: 2,
                                                                     lang: 0,
                                                                     option: 0,
                                                                     type: 0,
                                                                     start_name: "테스트 출발지 (파토스)",
                                                                     end_name: "테스트 도착지 (부산시청)",
                                                                     via_name: "",
                                                                     points: "126.89613,37.48302|129.07587,35.17989",
                                                                     geoms: mvt_geoms(geom_type: mvt_geom_type.point,
                                                                                      length: 0,
                                                                                      coordinate: mvt_coordinate.mvt_lonlat_t,
                                                                                      mbr: MBR32D(min: VERTEX32D(dx: 126.89613,
                                                                                                                 dy: 35.17989),
                                                                                                  max: VERTEX32D(dx: 129.07587,
                                                                                                                 dy: 37.48302)),
                                                                                      points: [VERTEX32D(dx: 126.89613, dy: 37.48302),
                                                                                               VERTEX32D(dx: 129.07587, dy: 35.17989)],
                                                                                      lines: mvt_lines32d(),
                                                                                      polygons: [mvt_poloygons32d]()),
                                                                     max_lat: 37.48302,
                                                                     max_lng: 129.07587,
                                                                     min_lat: 35.17989,
                                                                     min_lng: 126.89613,
                                                                     car_option: car_option_st(car_type: 0,
                                                                                               car_fuel: 0,
                                                                                               hipass: false,
                                                                                               car_weight: 290,
                                                                                               car_height: 105,
                                                                                               car_length: 0,
                                                                                               uturnlane: 0,
                                                                                               car_feetype: 0),
                                                                     route_option: route_option_st(search_option: 1,
                                                                                                   angle: Int32.max,
                                                                                                   speed: Int32.max,
                                                                                                   fee_option: 0,
                                                                                                   simple_mode: false,
                                                                                                   special_option: 0,
                                                                                                   road_cate: 0,
                                                                                                   traffic: false,
                                                                                                   unixtime: 621537389,
                                                                                                   gmt_offset: 32400,
                                                                                                   pattern: false,
                                                                                                   nonstop: 32400)))
    
    internal func decode(mvt: VectorTile_Tile, coordinate: mvt_coordinate = .mvt_lonlat_t) -> Bool {
        mlist.removeAll()
        
        let layerContainer  = mvt.layers
        let layerCount: Int = layerContainer.count
        var param_new       = param_one_st()
        var fields  : [String] = []
        var nParam  : Int32 = -1
        
        for layerIndex in 0..<layerCount {
            var layer = mvt.layers[layerIndex]
            //            tileInfo.zoom = zigZagDecode(Int(layer.tz))
            //            tileInfo.column = zigZagDecode(Int(layer.tx))
            //            tileInfo.row = zigZagDecode(Int(layer.ty))
            self.tileInfo.zoom = Int(layer.tz)
            self.tileInfo.column = Int(layer.tx)
            self.tileInfo.row = Int(layer.ty)
            tileInfo.numTiles   = UInt32(tileInfo.zoom * tileInfo.zoom)
            tileInfo.mbr.min.dx = tilex2long(x: tileInfo.column, z: tileInfo.zoom)
            tileInfo.mbr.min.dy = tiley2lat(y: tileInfo.row - 1, z: tileInfo.zoom)
            tileInfo.mbr.max.dx = tilex2long(x: tileInfo.column + 1, z: tileInfo.zoom)
            tileInfo.mbr.max.dy = tiley2lat(y: tileInfo.row, z: tileInfo.zoom)
            tileInfo.diff.dx = tileInfo.mbr.max.dx - tileInfo.mbr.min.dx
            tileInfo.diff.dy = tileInfo.mbr.max.dy - tileInfo.mbr.min.dy
            layer.tz = UInt32(tileInfo.zoom)
            layer.tx = UInt32(tileInfo.column)
            layer.ty = UInt32(tileInfo.row)
            tileInfo.is_layer = true
            
            //            if (fields.count != 2) { continue }
            //            if (nParam != Int32(fields[0])) {
            //                param_new.clear()
            //                self.mlist.append(param_new)
            //                nParam += 2
            //            }
            
            param_new.clear()
            self.mlist.append(param_new)
            
            var param_one = self.mlist[mlist.count - 1]
            
            for f in 0..<layer.features.count {
                
                let feat = layer.features[f]
                let tagMap : [String:String] = layer.get_key_values(tags: feat.tags)
                
                param_one.rp_info.source        = Int32(tagMap["source"] ?? "0") ?? 0
                param_one.rp_info.lang          = Int32(tagMap["lang"] ?? "0") ?? 0
                param_one.rp_info.option        = Int32(tagMap["option"] ?? "0") ?? 0
                param_one.rp_info.start_name    = tagMap["start_name"] ?? ""
                param_one.rp_info.end_name      = tagMap["end_name"] ?? ""
                param_one.rp_info.max_lat       = Double(tagMap["max_lat"] ?? "0") ?? 0
                param_one.rp_info.max_lng       = Double(tagMap["max_lng"] ?? "0") ?? 0
                param_one.rp_info.min_lat       = Double(tagMap["min_lat"] ?? "0") ?? 0
                param_one.rp_info.min_lng       = Double(tagMap["min_lng"] ?? "0") ?? 0
                
                // car_option
                param_one.rp_info.car_option.car_type       = Int32(tagMap["car_type"] ?? "0") ?? 0
                param_one.rp_info.car_option.car_fuel       = Int32(tagMap["car_fuel"] ?? "0") ?? 0
                param_one.rp_info.car_option.hipass         = Bool(tagMap["hipass"] ?? "false") ?? false
                param_one.rp_info.car_option.car_weight     = UInt32(tagMap["car_weight"] ?? "0") ?? 0
                param_one.rp_info.car_option.car_height     = UInt32(tagMap["car_height"] ?? "0") ?? 0
                param_one.rp_info.car_option.car_length     = UInt32(tagMap["car_length"] ?? "0") ?? 0
                param_one.rp_info.car_option.uturnlane      = UInt32(tagMap["uturnlane"] ?? "0") ?? 0
                param_one.rp_info.car_option.car_feetype    = UInt32(tagMap["car_feetype"] ?? "0") ?? 0
                
                // route_option
                param_one.rp_info.route_option.search_option    = Int32(tagMap["search_option"] ?? "0") ?? 0
                param_one.rp_info.route_option.angle            = Int32(tagMap["angle"] ?? "0") ?? 0
                param_one.rp_info.route_option.speed            = Int32(tagMap["speed"] ?? "0") ?? 0
                param_one.rp_info.route_option.fee_option       = Int32(tagMap["fee_option"] ?? "0") ?? 0
                param_one.rp_info.route_option.simple_mode      = Bool(tagMap["simple_mode"] ?? "false") ?? false
                param_one.rp_info.route_option.special_option   = UInt32(tagMap["special_option"] ?? "0") ?? 0
                param_one.rp_info.route_option.road_cate        = Int32(tagMap["road_cate"] ?? "0") ?? 0
                param_one.rp_info.route_option.traffic          = Bool(tagMap["traffic"] ?? "false") ?? false
                param_one.rp_info.route_option.unixtime         = UInt32(tagMap["unixtime"] ?? "0") ?? 0
                param_one.rp_info.route_option.gmt_offset       = Int32(tagMap["gmt_offset"] ?? "0") ?? 0
                param_one.rp_info.route_option.pattern          = Bool(tagMap["pattern"] ?? "false") ?? false
                param_one.rp_info.route_option.nonstop          = Int32(tagMap["nonstop"] ?? "0") ?? 0
                
                feat.get_geometry(tile_info: tileInfo, coord: coordinate, extent: Int(layer.extent), geoms_out: &param_one.rp_info.geoms)
            }
            self.mlist[mlist.count - 1] = param_one
        }
        
        print("route struct decode done.")
        return true
    }
    
    internal func encode(param_list: inout [param_one_st]) -> Data? {
        var mvt = VectorTile_Tile()
        let layerCount : Int = param_list.count
        
        for layerIndex in 0..<layerCount {
            var param_one = param_list[layerIndex]
            mvt.layers.append(VectorTile_Tile.Layer())
            mvt.layers[layerIndex] = VectorTile_Tile.Layer.with {
                $0.name = "\(layerIndex),rp_info"
                $0.extent = 4096
                $0.version = 2
            }
            mvt.layers[layerIndex].keys.removeAll()
            mvt.layers[layerIndex].values.removeAll()
            mvt.layers[layerIndex].features.removeAll()
            var _feat = VectorTile_Tile.Feature()
            
            mvt.layers[layerIndex].add_key_values(key: "source", value: param_one.rp_info.source, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "lang", value: param_one.rp_info.lang, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "option", value: param_one.rp_info.option, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "option_ex", value: param_one.rp_info.option_ex, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "layers", value: param_one.rp_info.layers, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "useremail", value: param_one.rp_info.useremail, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "type", value: param_one.rp_info.type, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "site", value: param_one.rp_info.site, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "appversion", value: param_one.rp_info.appversion, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "mapversion", value: param_one.rp_info.mapversion, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "platformtype", value: param_one.rp_info.platformtype, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "servicetype", value: param_one.rp_info.servicetype, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "authcode", value: param_one.rp_info.authcode, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "user_authcode", value: param_one.rp_info.user_authcode, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "sitesubcode", value: param_one.rp_info.sitesubcode, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "usercode", value: param_one.rp_info.usercode, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "devicename", value: param_one.rp_info.devicename, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "osversion", value: param_one.rp_info.osversion, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "svcprovider", value: param_one.rp_info.svcprovider, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "start_name", value: param_one.rp_info.start_name, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "start_floor", value: param_one.rp_info.start_floor, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "start_dir", value: param_one.rp_info.start_dir, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "end_name", value: param_one.rp_info.end_name, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "end_rpflag", value: param_one.rp_info.end_rpflag, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "end_floor", value: param_one.rp_info.end_floor, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "end_dir", value: param_one.rp_info.end_dir, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "multi_entcount", value: param_one.rp_info.multi_entcount, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "multi", value: param_one.rp_info.multi, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "via_name", value: param_one.rp_info.via_name, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "via_dir", value: param_one.rp_info.via_dir, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "via_pass", value: param_one.rp_info.via_pass, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "via_multi_entcount", value: param_one.rp_info.via_multi_entcount, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "max_lat", value: Double(param_one.rp_info.max_lat), feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "max_lng", value: Double(param_one.rp_info.max_lng), feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "min_lat", value: Double(param_one.rp_info.min_lat), feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "min_lng", value: Double(param_one.rp_info.min_lng), feature: &_feat)
            
            
            // car option
            mvt.layers[layerIndex].add_key_values(key: "car_type", value: param_one.rp_info.car_option.car_type, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "car_fuel", value: param_one.rp_info.car_option.car_fuel, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "hipass", value: param_one.rp_info.car_option.hipass, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "car_weight", value: param_one.rp_info.car_option.car_weight, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "car_height", value: param_one.rp_info.car_option.car_height, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "car_length", value: param_one.rp_info.car_option.car_length, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "uturnlane", value: param_one.rp_info.car_option.uturnlane, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "car_feetype", value: param_one.rp_info.car_option.car_feetype, feature: &_feat)
            
            // route_option
            mvt.layers[layerIndex].add_key_values(key: "search_option", value: param_one.rp_info.route_option.search_option, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "angle", value: param_one.rp_info.route_option.angle, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "speed", value: param_one.rp_info.route_option.speed, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "fee_option", value: param_one.rp_info.route_option.fee_option, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "simple_mode", value: param_one.rp_info.route_option.simple_mode, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "special_option", value: param_one.rp_info.route_option.special_option, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "road_cate", value: param_one.rp_info.route_option.road_cate, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "traffic", value: param_one.rp_info.route_option.traffic, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "unixtime", value: param_one.rp_info.route_option.unixtime, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "gmt_offset", value: param_one.rp_info.route_option.gmt_offset, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "pattern", value: param_one.rp_info.route_option.pattern, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "nonstop", value: param_one.rp_info.route_option.nonstop, feature: &_feat)
            
            mvt.layers[layerIndex].add_key_values(key: "points", value: param_one.rp_info.points, feature: &_feat)
            
            var nmbr : MBR32 = MBR32(min: VERTEX32(x: 0, y: 0), max: VERTEX32(x: 0, y: 0))
            nmbr.reset()
            nmbr.max.y = mglDegreeToWorldY(f: param_one.rp_info.max_lat)
            nmbr.min.y = mglDegreeToWorldY(f: param_one.rp_info.min_lat)
            nmbr.max.x = mglDegreeToWorldX(f: param_one.rp_info.max_lng)
            nmbr.min.x = mglDegreeToWorldX(f: param_one.rp_info.min_lng)
            
            
            var zoom : UInt32 = 0, col : UInt32 = 0, row : UInt32 = 0
            mvt.layers[layerIndex].extent = UInt32(mbr_extent(mbr: &nmbr, tileZoom: &zoom, tileColumn: &col, tileRow: &row))
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
            //            mvt.layers[layerIndex].tz = UInt32(zigZagEncode(Int(zoom)))
            //            mvt.layers[layerIndex].tx = UInt32(zigZagEncode(Int(col)))
            //            mvt.layers[layerIndex].ty = UInt32(zigZagEncode(Int(row)))
            mvt.layers[layerIndex].tz = zoom
            mvt.layers[layerIndex].tx = col
            mvt.layers[layerIndex].ty = row
            
            encode_geometry(extent: Int(mvt.layers[layerIndex].extent), geoms: &param_one.rp_info.geoms, outFeature: &_feat)
            
            mvt.layers[layerIndex].features.append(_feat)
        }
        
        
        
        do {
            return try mvt.serializedData()
        } catch {
            return nil
        }
    }
    
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
    
    internal func encode_tile_points(points: inout mvt_vertex32,
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
    
    internal func remove_deduplicate_points(points: mvt_vertex32, out: inout mvt_vertex32) {
        
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
    
    internal func get_list() -> param_list {
        return mlist
    }
}

public class rg_result : NSObject {
    typealias rg_list = [rg_one_st]
    var mlist = rg_list()
    var mCommandList = rg_list()
    var tileInfo = mvt_tile_box(is_layer: false,
                                numTiles: 0,
                                mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                diff: VERTEX32D(dx: 0, dy: 0),
                                zoom: 0,
                                column: 0,
                                row: 0)
    
    public var rg : rg_one_st? {
        return mlist.first
    }
    
    internal func encode(param_one: inout rg_one_st) -> Data? {
        
        var mvt = VectorTile_Tile()
        encode_layer(mvt: &mvt, comm: &param_one.comm, site: .fatos_t, layer_name: "comm", version: 2)
        
        do {
            return try mvt.serializedData()
        } catch {
            return nil
        }
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               comm: inout comm_st,
                               site: site_type,
                               layer_name: String, version: Int) {
        
        let layerCount : Int = 1
        for layerIndex in 0..<layerCount {
            mvt.layers.append(VectorTile_Tile.Layer())
            mvt.layers[layerIndex] = VectorTile_Tile.Layer.with {
                $0.name = "\(layerIndex),\(layer_name)"
                $0.extent = 4096
                $0.version = UInt32(version)
            }
            mvt.layers[layerIndex].keys.removeAll()
            mvt.layers[layerIndex].values.removeAll()
            mvt.layers[layerIndex].features.removeAll()
            var _feat = VectorTile_Tile.Feature()
            
            mvt.layers[layerIndex].add_key_values(key: "command", value: comm.command.rawValue, feature: &_feat)
            
            var zoom : UInt32 = 0, col : UInt32 = 0, row : UInt32 = 0
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
            mvt.layers[layerIndex].tz = zoom
            mvt.layers[layerIndex].tx = col
            mvt.layers[layerIndex].ty = row
            
            //            var tile = tile_mvt()
            //            tile.tileInfo = tileInfo
            //            tile.encode_geometry(extent: Int(mvt.layers[layerIndex].extent), geoms: &param_one.ui.geoms, outFeature: &_feat)
            mvt.layers[layerIndex].features.append(_feat)
        }
    }
    
    open func decode(rg_data: Data) -> Bool {
        do {
            let rg_mvt = try VectorTile_Tile(serializedData: rg_data)
            return self.decode(mvt: rg_mvt)
        } catch {
            return false
        }
    }
    
    @discardableResult
    internal func decode(mvt: VectorTile_Tile, coordinate: mvt_coordinate = .mvt_lonlat_t, is_command: Bool = false) -> Bool {
        self.mlist.removeAll()
        self.tileInfo.clear()
        
        var rg_new       = rg_one_st()
        let layerContainer = mvt.layers
        let layerCount: Int = layerContainer.count
        
        rg_new.clear()
        
        if (is_command) {
            self.mCommandList.append(rg_new)
        } else {
            self.mlist.append(rg_new)
        }
        
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
            
            var rg_one: rg_one_st
            
            if (is_command) {
                rg_one = self.mCommandList[mCommandList.count - 1]
            } else {
                rg_one = self.mlist[mlist.count - 1]
            }
            
            
            
            if (layer.name.contains("ui") && !layer.features.isEmpty) {
                rg_one.version = Int32(layer.version)
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, ui: &rg_one.ui, coordinate: coordinate)
            }
            if (layer.name.contains("view_visible") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, view_visible: &rg_one.view_visible, coordinate: coordinate)
            }
            if (layer.name.contains("tollgate") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, tollgate: &rg_one.tollgate, coordinate: coordinate)
            }
            if (layer.name.contains("sdi_list") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, sdi_list: &rg_one.sdi_list, coordinate: coordinate)
            }
            if (layer.name.contains("voice_list") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, voice_list: &rg_one.voice_list, coordinate: coordinate)
            }
            if (layer.name.contains("via_list") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, via_list: &rg_one.via_list, coordinate: coordinate)
            }
            if (layer.name.contains("comm") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, comm: &rg_one.comm, coordinate: coordinate)
            }
            if (layer.name.contains("is_last_route") && !layer.features.isEmpty) {
                decode_layer(mvt_layer: layer, tile_info: &tileInfo, is_last_route: &rg_one.is_last_route, coordinate: coordinate)
            }
            
            if (is_command) {
                self.mCommandList[mCommandList.count - 1] = rg_one
            } else {
                self.mlist[mlist.count - 1] = rg_one
            }
        }
        return true
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               ui: inout ui_st,
                               coordinate: mvt_coordinate) -> Void {
        
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &ui.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "has_route", value: &ui.has_route)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "has_around_via", value: &ui.has_around_via)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "route_idx", value: &ui.route_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "real_link_idx", value: &ui.real_link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "service_link_idx", value: &ui.service_link_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "atbt_idx", value: &ui.atbt_idx)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rg_mm_status", value: &ui.rg_mm_status)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "local_mm_status", value: &ui.local_mm_status)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "goal_status", value: &ui.goal_status)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "service_link_remainder_dist", value: &ui.service_link_remainder_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "service_link_remainder_time", value: &ui.service_link_remainder_time)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "total_remainder_dist", value: &ui.total_remainder_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "total_remainder_time", value: &ui.total_remainder_time)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "arrival_rate", value: &ui.arrival_rate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "str_length", value: &ui.str_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "string_info", value: &ui.string_info)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "bottom_info", value: &ui.bottom_info)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_night", value: &ui.mm_info.night)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_fixed", value: &ui.mm_info.fixed)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_link_id", value: &ui.mm_info.link_id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_speed", value: &ui.mm_info.speed)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_angle", value: &ui.mm_info.angle)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_road_cate", value: &ui.mm_info.road_cate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_link_cate", value: &ui.mm_info.link_cate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_link_facil", value: &ui.mm_info.link_facil)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_max_speed", value: &ui.mm_info.max_speed)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_lane_guide", value: &ui.mm_info.lane_guide)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_lane_guide_length", value: &ui.mm_info.lane_guide_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_complexcode", value: &ui.mm_info.complexcode)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_complex_length", value: &ui.mm_info.complex_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_direction_sign_guide", value: &ui.mm_info.direction_sign_guide)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_direction_sign_length", value: &ui.mm_info.direction_sign_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_direction_sign_max_length", value: &ui.mm_info.direction_sign_max_length)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_autoScaleLevel", value: &ui.mm_info.autoScaleLevel)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "mm_info_autoScaleTilt", value: &ui.mm_info.autoScaleTilt)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               view_visible: inout view_visible_st,
                               coordinate: mvt_coordinate) -> Void {
        
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &view_visible.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "first_tbt_visible", value: &view_visible.first_tbt_visible)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "second_tbt_visible", value: &view_visible.second_tbt_visible)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "sdi_visible", value: &view_visible.sdi_visible)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "lane_visible", value: &view_visible.lane_visible)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "express_link_visible", value: &view_visible.express_link_visible)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_visible", value: &view_visible.hipass_visible)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               tollgate: inout tollgate_st,
                               coordinate: mvt_coordinate) -> Void {
        
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &tollgate.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "link_idx", value: &tollgate.link_idx)
            tollgate.type = tollgate_type(rawValue: Int32(tagMap["type"] ?? "0")!)                ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "id", value: &tollgate.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rate", value: &tollgate.rate)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "name", value: &tollgate.name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_id", value: &tollgate.hipass.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_image_id", value: &tollgate.hipass.image_id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_lane", value: &tollgate.hipass.lane)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_lane_cnt", value: &tollgate.hipass.lane_cnt)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "hipass_total_lane", value: &tollgate.hipass.total_lane)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               sdi_list: inout [sdi_st],
                               coordinate: mvt_coordinate) -> Void {
        
        
        var _new    : sdi_st = sdi_st()
        sdi_list.reserveCapacity(mvt_layer.features.count)
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            sdi_list.append(_new)
            var sdi : sdi_st = sdi_list[sdi_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &sdi.geoms)
            
            sdi.disp_type       = sdi_display_type(rawValue: Int32(tagMap["disp_type"] ?? "0")!)   ?? .none_t
            sdi.type            = sdi_type(rawValue: Int32(tagMap["type"] ?? "0")!)                ?? .none_t
            sdi.visibility      = sdi_visibility_type(rawValue: Int32(tagMap["visibility"] ?? "0")!) ?? .none_t
            mvt_layer.get_value(tagMap: tagMap, tagKey: "angle", value: &sdi.angle)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "max_speed", value: &sdi.max_speed)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "dist", value: &sdi.dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "section_dist", value: &sdi.section_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "weight", value: &sdi.weight)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "height", value: &sdi.height)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "ks_link_id", value: &sdi.ks_link_id)
            
            sdi_list[sdi_list.count - 1] = sdi
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               voice_list: inout [voice_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new    : voice_st = voice_st()
        voice_list.reserveCapacity(mvt_layer.features.count)
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            voice_list.append(_new)
            var voice : voice_st = voice_list[voice_list.count - 1]
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "id", value: &voice.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "text", value: &voice.text)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "play_complete", value: &voice.play_complete)
            
            voice_list[voice_list.count - 1] = voice
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               via_list: inout [via_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new    : via_st = via_st()
        via_list.reserveCapacity(mvt_layer.features.count)
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            via_list.append(_new)
            var via : via_st = via_list[via_list.count - 1]
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &via.geoms)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_dist", value: &via.remainder_dist)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "remainder_time", value: &via.remainder_time)
            
            via_list[via_list.count - 1] = via
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               comm: inout comm_st,
                               coordinate: mvt_coordinate) -> Void {
        
        comm.clear()
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            
            comm.command = rg_command_type(rawValue: Int32(tagMap["command"] ?? "0")!) ?? .none_t
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               is_last_route: inout is_last_route_st,
                               coordinate: mvt_coordinate) -> Void {
        
        is_last_route.clear()
        
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "exists", value: &is_last_route.exists)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "goal_name", value: &is_last_route.goal_name)
            
        }
    }
}

public class voice_result: NSObject {
    
    override init() { super.init() }
    deinit {}
    var tileInfo = mvt_tile_box(is_layer: false,
                                numTiles: 0,
                                mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                diff: VERTEX32D(dx: 0, dy: 0),
                                zoom: 0,
                                column: 0,
                                row: 0)
    
    public var list : [voice_one_st] = []
    
    internal func encode(voice_one: voice_one_st) -> Data? {
        self.list.removeAll()
        var mvt = VectorTile_Tile()
        let layer_name = "voice_list"
        list.append(voice_one)
        for i in 0..<list.count {
            encode_layer(mvt: &mvt, voice_list: &list[i].voice_list, site: site_type.fatos_t, layer_name: layer_name, version: MVT_VOICE_VERSION)
        }
        
        do {
            return try mvt.serializedData()
        } catch {
            return nil
        }
    }
    
    internal func encode_layer(mvt: inout VectorTile_Tile,
                               voice_list: inout [voice_st],
                               site: site_type,
                               layer_name: String, version: Int) {
        
        
        let layerCount : Int = voice_list.count
        
        for layerIndex in 0..<layerCount {
            let voice_one = voice_list[layerIndex]
            mvt.layers.append(VectorTile_Tile.Layer())
            let lastIndex = mvt.layers.count - 1
            mvt.layers[layerIndex] = VectorTile_Tile.Layer.with {
                $0.name = "\(layerIndex),\(layer_name)"
                $0.extent = 4096
                $0.version = UInt32(version)
            }
            mvt.layers[layerIndex].keys.removeAll()
            mvt.layers[layerIndex].values.removeAll()
            mvt.layers[layerIndex].features.removeAll()
            var _feat = VectorTile_Tile.Feature()
            
            mvt.layers[layerIndex].add_key_values(key: "id", value: voice_one.id, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "text", value: voice_one.text, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "play_complete", value: voice_one.play_complete, feature: &_feat)
            VectorTile_Tile.encode_geometry(extent: Int(mvt.layers[lastIndex].extent), geoms: &voice_list[layerIndex].geoms, outFeature: &_feat)
            mvt.layers[lastIndex].features.append(_feat)
        }
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               voice_list: inout [voice_st],
                               coordinate: mvt_coordinate) -> Void {
        
        var _new    : voice_st = voice_st()
        voice_list.reserveCapacity(mvt_layer.features.count)
        for f in 0..<mvt_layer.features.count {
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            _new.clear()
            voice_list.append(_new)
            var voice : voice_st = voice_list[voice_list.count - 1]
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "id", value: &voice.id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "text", value: &voice.text)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "play_complete", value: &voice.text)
            
            voice_list[voice_list.count - 1] = voice
        }
    }
    
}


public struct voice_one_st {
    public var version : Int32 = 0
    public var voice_list : [voice_st] = []
    
    
    mutating public func clear() -> Void {
        self.version = 0
        self.voice_list.removeAll()
    }
}

extension Int {
    var boolValue: Bool { return self != 0 }
}
