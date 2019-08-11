//
//  Common.m
//  ObjectiveCLab/Common
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "Common.h"

@implementation Common

@end

@implementation NSFileManager (Common)
//FileType

///plist
NSString *const FileTypePropertyList = @"plist";
NSString *const PListTitle = @"title";
NSString *const PListHeader = @"header";
NSString *const PListFotter = @"fotter";
NSString *const PListItems = @"items";
NSString *const PListURL = @"URL";

@end

@implementation NSDictionary (Common)

/**
 * PropertyList取得値　[rootの返り値がNSDictionaryの場合]
 *
 * @param key 値取得用のKey
 * @param fileName 値取得用のファイル名
 *
 * @return PropertyList値[任意]
 */
+ (id)getPropertyListWithKey:(NSString *)key
                withFileName:(NSString *)fileName
{
    NSDictionary *propertyList = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:fileName ofType:FileTypePropertyList];
    // ファイルの存在チェック
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        propertyList = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    
    if (key) {
        return propertyList[key];
    }
    return propertyList;
}

@end

@implementation NSArray (Common)

/**
 * PropertyList取得値[rootの返り値がNSArrayの場合]
 *
 * @param index 値取得用のIndex
 * @param fileName 値取得用のファイル名
 *
 * @return PropertyList値[任意]
 */
+ (id)getPropertyListWithIndex:(NSInteger)index
                  withFileName:(NSString *)fileName
{
    NSArray *propertyList = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:fileName ofType:FileTypePropertyList];
    
    // ファイルの存在チェック
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        propertyList = [NSArray arrayWithContentsOfFile:filePath];
    }
    
    if (index < 0) {
        return propertyList;
    }
    
    return propertyList[index];
}

@end
