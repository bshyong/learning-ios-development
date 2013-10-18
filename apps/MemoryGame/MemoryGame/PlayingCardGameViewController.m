//
//  PlayingCardGameViewController.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/18/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "PlayingCardCollectionViewCell.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

  - (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
  }
  - (NSUInteger) startingCardCount{
    return 20;
  }
  -(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
      PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *) cell).playingCardView;
      if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        playingCardView.rank = playingCard.rank;
        playingCardView.suit = playingCard.suit;
        playingCardView.faceUp = playingCard.isFaceUp;
        playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
      }
    }
  }
@end
