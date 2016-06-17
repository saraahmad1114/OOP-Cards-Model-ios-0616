//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (nonatomic, strong, readonly) NSString* suit;
@property (nonatomic, strong, readonly) NSString* rank;
@property (nonatomic, strong, readonly) NSString* cardLabel;
@property (nonatomic, readonly) NSUInteger cardValue;

-(instancetype)init;
-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank;
+(NSArray*)validSuits;
+(NSArray*)validRanks;


@end
