//
//  PlayingCardCollectionViewCell.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/18/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell
  @property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@end
