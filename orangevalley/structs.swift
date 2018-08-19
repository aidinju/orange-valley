//
//  structs.swift
//  orangevalley
//
//  Created by aidin on 2/5/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import Foundation

struct video : Decodable {
    var id : String
    var video_url : String
    var name : String
    var description : String
    var duration : String
    var created_by : String
    var image : String
    var thumbnail : String
    var cropped : String
    var file_name_original : String
    var popularity : String
    var category_id : String
    var category : String
    var keywords : String
    
}
