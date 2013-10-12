//
//  CardMatchingGame.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/11/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
  // designated initializer
  -(id)initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *)deck;
  -(void)flipCardAtIndex:(NSUInteger)index;
  -(Card *)cardAtIndex:(NSUInteger)index;
  @property (nonatomic, readonly) int score;
  @property (nonatomic, readonly) NSString *lastAction;
@end
