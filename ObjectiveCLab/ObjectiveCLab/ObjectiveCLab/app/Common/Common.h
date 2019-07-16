//
//  Common.h
//  ObjectiveCLab/Common
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

@end

@interface NSDictionary(Common)
/**
 * PropertyList取得値　[rootの返り値がNSDictionaryの場合]
 */
+ (id)getPropertyListWithKey:(NSString *)key
                withFileName:(NSString *)fileName;
@end

@interface NSArray(Common)

/**
 * PropertyList取得値　[rootの返り値がNSArrayの場合]
 */
+ (id)getPropertyListWithIndex:(NSInteger)index
                  withFileName:(NSString *)fileName;

@end

@interface NSFileManager(Common)
//FileType

///plist
extern NSString *const FileTypePropertyList;
extern NSString *const PListTitle;
extern NSString *const PListHeader;
extern NSString *const PListFotter;
extern NSString *const PListItems;
extern NSString *const PListURL;

@end

