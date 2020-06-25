//
//  Constant.swift
//  WestDemo
//
//  Created by seven on 2020/6/16.
//  Copyright © 2020 west. All rights reserved.
//

import Foundation


///是否是模拟器
public let isSimulator = (TARGET_IPHONE_SIMULATOR == 1 && TARGET_OS_IPHONE == 1) ? true : false;
