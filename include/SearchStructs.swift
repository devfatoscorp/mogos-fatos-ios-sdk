//
//  SearchStructs.swift
//  fatoshi-swift
//
//  Created by Heecheon Park on 2021/11/25.
//

import Foundation
import SwiftProtobuf

public enum eSearch_Special: Int {
    case PARKING        = 2
    case FUEL           = 3
    case HOTEL          = 4
    case RESTAURANT     = 5
}

public class search_result: NSObject {
    var special_search_result_list : [special_content_unit_st] = []
    var  tileInfo = mvt_tile_box(is_layer: false,
                                 numTiles: 0,
                                 mbr: MBR32D(min: VERTEX32D(dx: 0, dy: 0), max: VERTEX32D(dx: 0, dy: 0)),
                                 diff: VERTEX32D(dx: 0, dy: 0),
                                 zoom: 0,
                                 column: 0,
                                 row: 0)
    
    private let delimiter = "|"
    
    internal func encode(param_list: inout [special_content_unit_st]) -> Data? {
        var mvt = VectorTile_Tile()
        let layerCount : Int = param_list.count
        
        for layerIndex in 0..<layerCount {
            var param_one = param_list[layerIndex]
            mvt.layers.append(VectorTile_Tile.Layer())
            mvt.layers[layerIndex] = VectorTile_Tile.Layer.with {
                $0.name = "\(layerIndex),special_search"
                $0.extent = 4096
                $0.version = 2
            }
            mvt.layers[layerIndex].keys.removeAll()
            mvt.layers[layerIndex].values.removeAll()
            mvt.layers[layerIndex].features.removeAll()
            var _feat = VectorTile_Tile.Feature()
            
            mvt.layers[layerIndex].add_key_values(key: "rates", value: param_one.rates, feature: &_feat)
            mvt.layers[layerIndex].add_key_values(key: "phone", value: param_one.phone, feature: &_feat)
        }
        do {
            return try mvt.serializedData()
        } catch {
            return nil
        }
    }
    
    @discardableResult
    internal func decode(mvt: VectorTile_Tile, coordinate: mvt_coordinate = .mvt_lonlat_t) -> Bool {
        self.special_search_result_list.removeAll()
        self.tileInfo.clear()
        
 
        let layerContainer              = mvt.layers
        let layerCount          : Int = layerContainer.count

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
            
            
            

            decode_layer(mvt_layer: layer, tile_info: &tileInfo, coordinate: coordinate)

            
        }
        
        
        return true
    }
    
    internal func decode_layer(mvt_layer: VectorTile_Tile.Layer,
                               tile_info: inout mvt_tile_box,
                               coordinate: mvt_coordinate) -> Void {
        
        for f in 0..<mvt_layer.features.count {
            self.special_search_result_list.append(special_content_unit_st())
            var search_result_one = self.special_search_result_list[special_search_result_list.count - 1]
            
            let feat = mvt_layer.features[f]
            let tagMap : [String:String] = mvt_layer.get_key_values(tags: feat.tags)
            feat.get_geometry(tile_info: tile_info, coord: coordinate, extent: Int(mvt_layer.extent), geoms_out: &search_result_one.geoms)
            
            var id              : String = ""
            var phone           : String = ""
            var fuel_origin     : String = ""
            var fuel_info_map   : Dictionary<String,String> = [:]
            var rates           : String = ""
            var contact         : String = ""
            var overview        : String = ""
            var name            : String = ""
            var altname         : String = ""
            var address         : String = ""
            var type_origin     : String = ""
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "id", value: &id)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "phone", value: &phone)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "fuel", value: &fuel_origin)
            
            let fuelInfoList = fuel_origin.components(separatedBy: delimiter)
            fuelInfoList.forEach { info in
                let info_detail = info.components(separatedBy: ":")
                
                if (info_detail.count > 1) {
                    fuel_info_map.updateValue(info_detail[1], forKey: info_detail[0])
                }
            }
            
            /**
             *      fuel -> Gasohol91:28.78|Gasohol95:29.05|GasoholE20:27.54|Diesel:28.99|DieselPremium:35.44
             *      -> 브랜드 : 가격 | 브랜드 : 가격 | ...
             *
             * **/
            if (!fuel_origin.isEmpty && fuel_info_map.keys.count == 0) { continue }
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "rates", value: &rates)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "contact", value: &contact)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "overview", value: &overview)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "name", value: &name)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "altname", value: &altname)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "address", value: &address)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "type", value: &type_origin)
            
            var type  : String = ""
            let types : [String] = type_origin.components(separatedBy: delimiter)
            
            if (types.count > 1) {
                if (!types[1].contains("null")) {
                    type = types[1]
                }
            }
            
            var fee             : String = ""
            var openday         : String = ""
            var openNow         : String = ""
            var specialCloseDay : String = ""
            var distance_origin : String = ""
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "fee", value: &fee)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "openday", value: &openday)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "openNow", value: &openNow)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "specialCloseDay", value: &specialCloseDay)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "distance", value: &distance_origin)
            
            if (distance_origin.isEmpty) {
                distance_origin = "0"
            }
            
            let distance :Float = (distance_origin as NSString).floatValue
            
            var status_message  : String = ""
            var status_open     : String = ""
            var check_in_out    : String = ""
            var check_in        : String = ""
            var check_out       : String = ""
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "status_message", value: &status_message)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "status_open", value: &status_open)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "check_in_out", value: &check_in_out)
            
            if (!check_in_out.isEmpty) {
                let str_res : [String] = check_in_out.components(separatedBy: delimiter)
                if (str_res.count > 0) { check_in   = str_res[0] }
                if (str_res.count > 1) { check_out  = str_res[1] }
            }
            
            var category        : String = ""
            var url             : String = ""
            var photo           : String = ""
            var images          : [String] = []
            
            mvt_layer.get_value(tagMap: tagMap, tagKey: "category", value: &category)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "url", value: &url)
            mvt_layer.get_value(tagMap: tagMap, tagKey: "photo", value: &photo)

            if (!photo.isEmpty) {
                images = photo.components(separatedBy: delimiter)
                if (!images.isEmpty) {
                    var arr_new : [String] = []
                    images.forEach { item in
                        if (item.contains("http://")) {
                            let replaced = item.replacingOccurrences(of: "http://", with: "https://")
                            arr_new.append(replaced)
                        } else {
                            arr_new.append(item)
                        }
                    }
                    
                    if (images[0].contains("img.wongnai.com")) {
                        arr_new.remove(at: 2)
                        arr_new.remove(at: 0)
                    }
                    
                    search_result_one.images = arr_new
                }
            }
            
            var brand           : String = ""
            var brand_split     : [String] = []
            mvt_layer.get_value(tagMap: tagMap, tagKey: "brand", value: &brand)
            
            if (!brand.isEmpty) {
                brand_split = brand.components(separatedBy: delimiter)
                if (!brand_split.isEmpty) {
//                    brand = brand_split[0] //0 : 태국어, 1 : 영어
                    // brand가 있으면 fuel 타입이므로, 이미지 아이콘은 여기서 얻어온다
                    
                    if (brand_split.count > 1) {
                        var images : [String] = []
                        images.append(brand_split[2])
                        search_result_one.images = images
                    }
                }
            }
            
            let lon_x : Double = search_result_one.geoms.points.first?.dx ?? 0
            let lat_y : Double = search_result_one.geoms.points.first?.dy ?? 0
            
            search_result_one.type                   = type
            search_result_one.fuel_info_map          = fuel_info_map
            search_result_one.check_in               = check_in
            search_result_one.check_out              = check_out
            search_result_one.m_strUrl               = url
            search_result_one.overview               = overview
            search_result_one.rates                  = rates
            search_result_one.phone                  = phone
            search_result_one.brand                  = brand
            search_result_one.categories             = category
            search_result_one.status_message         = status_message
            search_result_one.status_open            = status_open
            search_result_one.m_strPoiName           = name
            search_result_one.m_strPoiAddr           = address
            search_result_one.m_dLon                 = lon_x
            search_result_one.m_dLat                 = lat_y
            search_result_one.openday                = openday
            search_result_one.openNow                = openNow
            search_result_one.special_close_day      = specialCloseDay
            search_result_one.fee                    = fee
            search_result_one.m_fDist                = distance
            
            self.special_search_result_list[special_search_result_list.count - 1] = search_result_one
        }
    }
    
}


struct special_content_unit_st {
    public var m_strRpFlag              : String = ""
    public var m_strPoiID               : String = ""
    public var m_strPoiName             : String = ""
    public var m_strPoiAddr             : String = ""
    public var m_fDist                  : Float  = 0.0
    public var m_dLat                   : Double = 0.0
    public var m_dLon                   : Double = 0.0
    public var phone                    : String = ""
    public var str_addr                 : String = ""
    
    public var fee                      : String = ""

    //wongnai, agoda [hotel]
    public var status_message           : String = ""       // 상태메시지 : จะเปิดในเวลา 12:00 (~~시에 열립니다)
    public var status_open              : String = ""       // openNow 와 동일, 오픈상태
    public var categories               : String = ""       // 종류 : Buffet/International
    public var m_strUrl                 : String = ""       // 홈페이지 url
    public var images                   : [String] = []     // {thumbnail} | {thumbnail small} | {thumbnail large}
    
    // agoda [hotel]
    public var zipcode                  : String = ""
    public var star_rating              : String = ""       // 0~5
    public var check_in                 : String = ""       // 02:00 PM
    public var check_out                : String = ""       // 11:00 AM
    
    public var rates                    : String = ""
    
    // parking
    public var openday                  : String = ""
    public var openNow                  : String = ""
    public var special_close_day        : String = ""
    public var type                     : String = ""
    
    // fuel
    public var brand                    : String = ""
    public var overview                 : String = ""
    public var fuel_info_map            : Dictionary<String, String> = [:]
    public var showing_brand            : String = ""
    public var showing_price            : String = ""
    
    public var geoms                    : mvt_geoms = mvt_geoms()
    
    mutating func clear() -> Void {
        self.m_strRpFlag        = ""
        self.m_strPoiID         = ""
        self.m_strPoiName       = ""
        self.m_strPoiAddr       = ""
        self.m_fDist            = 0.0
        self.m_dLat             = 0.0
        self.m_dLon             = 0.0
        self.phone              = ""
        self.str_addr           = ""
        self.fee                = ""
        
        self.status_message     = ""
        self.status_open        = ""
        self.categories         = ""
        self.m_strUrl           = ""
        self.images             = []
        
        self.zipcode            = ""
        self.star_rating        = ""
        self.check_in           = ""
        self.check_out          = ""
        self.rates              = ""
        self.openday            = ""
        self.openNow            = ""
        self.special_close_day  = ""
        self.type               = ""
        self.brand              = ""
        self.overview           = ""
        self.fuel_info_map      = [:]
        self.showing_brand      = ""
        self.showing_price      = ""
        self.geoms              = mvt_geoms()
    }
}
