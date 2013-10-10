//
//  MemoryGameViewController.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "MemoryGameViewController.h"

@interface MemoryGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation MemoryGameViewController

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.flipCount++;
}


@end
