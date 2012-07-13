//
//  AppDelegate.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "AppDelegate.h"

#import "NavigationManager.h"
#import "RestKit/RestKit.h"

#import "LMMappingProvider.h"

@interface AppDelegate ()

@property (nonatomic, strong, readwrite) RKObjectManager *objectManager;
@property (nonatomic, strong, readwrite) RKManagedObjectStore *objectStore;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize objectManager;
@synthesize objectStore;

- (void)initializeRestKit
{
    self.objectManager = [RKObjectManager managerWithBaseURLString:@"http://landmark.10.128.42.86.xip.io/"];
    
//    self.objectManager = [RKObjectManager managerWithBaseURLString:@"https://api.github.com/"];
    
//    self.objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"Landmark.sqlite"];
//    self.objectManager.objectStore = self.objectStore;
    self.objectManager.mappingProvider = [LMMappingProvider mappingProviderWithOutObject];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    // Init the window as global.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _navigationManager = [[NavigationManager alloc] initWithWindow:_window];
    [_navigationManager displayRootView];

    [self.window makeKeyAndVisible];
    
    [self initializeRestKit];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    NSError *error = nil;
//    if (! [self.objectStore save:&error]) {
//        RKLogError(@"Failed to save RestKit managed object store: %@", error);
//    }
}

@end
