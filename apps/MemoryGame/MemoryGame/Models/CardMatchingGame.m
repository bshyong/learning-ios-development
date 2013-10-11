//
//  CardMatchingGame.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/11/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
  @property (readwrite, nonatomic) int score;
  //array of Cards
  @property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardMatchingGame
  -(NSMutableArray *)cards{
    if(!_cards)  _cards = [[NSMutableArray alloc] init];
    return _cards;
  }

  #define MATCH_BONUS 4
  #define MISMATCH_PENALTY 2
  #define FLIP_COST 1

  -(void)flipCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if (card && !card.isUnplayable){
      if(!card.faceUp){
        for (Card *otherCard in self.cards) {
          if (otherCard.isFaceUp && !otherCard.isUnplayable) {
            int matchScore = [card match:@[otherCard]];
            if (matchScore) {
              card.unplayable = YES;
              otherCard.unplayable = YES;
              self.score += matchScore * MATCH_BONUS;
            }else{
              otherCard.faceUp = NO;
              self.score -= MISMATCH_PENALTY;
            }
            break;
          }
        }
        self.score -= FLIP_COST;
      }
      card.faceUp = !card.faceUp;
    }
  }

  -(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
  }

  -(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
      for (int i=0; i<count; i++) {
        Card *card = [deck drawRandomCard];
        if (card){
          self.cards[i] = card;
        }else{
          self = nil;
          break;
        }
        
      }
    }
    return self;
  }
@end
