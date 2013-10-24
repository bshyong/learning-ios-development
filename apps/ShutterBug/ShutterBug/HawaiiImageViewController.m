//
//  HawaiiImageViewController.m
//  ShutterBug
//
//  Created by Benjamin Shyong on 10/23/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "HawaiiImageViewController.h"

@interface HawaiiImageViewController ()

@end

@implementation HawaiiImageViewController

  - (void)viewDidLoad
  {
      [super viewDidLoad];
      self.imageURL = [[NSURL alloc] initWithString:@"http://images.apple.com/v/iphone/gallery/a/images/photo_3.jpg"];
  }

@end
