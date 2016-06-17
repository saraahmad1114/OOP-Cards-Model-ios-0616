//  FISAppDelegate.m

#import "FISAppDelegate.h"


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FISCard *newCard = [[FISCard alloc]init];
    NSLog(@"%@", newCard.description); 
    
    // Override point for customization after application launch.
    return YES;
}

@end
