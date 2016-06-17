//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@interface FISCardDeck ()
//When declaring private methods just always remember that in the interface you are declaring your private methods
-(void)generateFiftyTwoCardsPrivately;

@end

@implementation FISCardDeck
//initializer methods

//Questions to ask:
//do you need to have a designated initializer with a default initializer
//Can't believe this was so obvious!
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _remainingCards= [[NSMutableArray alloc]init];
        _dealtCards = [[NSMutableArray alloc]init]; 
        [self generateFiftyTwoCardsPrivately];
    }
    return self;
}

//It is only in implementation where you will elaborate on your methods
-(void)generateFiftyTwoCardsPrivately
{
    NSArray *newRanks = [FISCard validRanks];
    NSArray *newSuits = [FISCard validSuits];
    
    for (NSUInteger i = 0; i < [newRanks count]; i++)
    {
        for(NSUInteger p = 0; p < [newSuits count]; p++)
        {
            FISCard *newCard = [[FISCard alloc]initWithSuit:newSuits[p] rank:newRanks[i]];
            //since we are creating a new card, we have to create an instance of that class that ACTUALLY defines for us what a card is, with its properties
            //here as soon as we make a new card we are calling on those properties and saying that whatever our arrays contains respectively for ranks and suits please have the properties set to those array elements
            
            [self.remainingCards addObject:newCard];
        }
    }
}

-(FISCard*)drawNextCard
{
    if([self.remainingCards count]==0 )
    {
        return nil;
    }
    FISCard *card = [self.remainingCards lastObject];
    [self.dealtCards addObject:card];
    [self.remainingCards removeObject:card]; 
    return card;
}
-(void)resetDeck
{
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}
-(void)gatherDealtCards
{
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}
-(void)shuffleRemainingCards
{
    NSMutableArray *newArray = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    while([newArray count]!=0)
    {
        NSUInteger random = arc4random_uniform([newArray count]);
        FISCard *newCard =newArray[random];
        [self.remainingCards addObject:newCard];
        [newArray removeObject:newCard];
    }
    
}

-(NSString*) description
{
    NSString *newString = @"";
    
    newString = [NSString stringWithFormat:@"count: %lu \ncards: %@", self.remainingCards.count, self.remainingCards.description];
    
    return newString;
}


@end
