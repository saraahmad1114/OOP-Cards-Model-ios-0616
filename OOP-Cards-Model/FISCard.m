//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard()

@property (nonatomic, strong, readwrite) NSString* suit;
@property (nonatomic, strong, readwrite) NSString* rank;
@property (nonatomic, strong, readwrite) NSString* cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard
//Done
//default initializer, always will be init!
-(instancetype)init
{
    self = [self initWithSuit:@"!" rank:@"N"];
    
    return self;
}
//Done
//Designated initializer
-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@",_suit, _rank];
        
        //_cardValue
        //put all of this into a separate method to optimize
        //looks really bad
        if([rank isEqualToString: @"A"])
        {
            _cardValue = 1;
        }
        else if([rank isEqualToString: @"Q"] ||
           [rank isEqualToString: @"J"] ||
           [rank isEqualToString: @"K"])
        {
            _cardValue = 10;
        }
        else {
            _cardValue = [rank integerValue];
        }
    }
        return self;
}
//Can't believe it was so easy!
- (NSString *)description
{
    return self.cardLabel;
}

//Done
+(NSArray*)validSuits
{
    NSArray *newCardSymbols = @[@"♠", @"♥", @"♣", @"♦"];
    return newCardSymbols;
}
//Done
+(NSArray*)validRanks
{
    NSArray *allCards = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return allCards;
}

@end
