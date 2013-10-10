//
//  MemoryGameViewController.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "MemoryGameViewController.h"

@interface MemoryGameViewController ()

@end

@implementation MemoryGameViewController

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}


@end
