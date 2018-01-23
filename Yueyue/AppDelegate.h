//
//  AppDelegate.h
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/23.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

