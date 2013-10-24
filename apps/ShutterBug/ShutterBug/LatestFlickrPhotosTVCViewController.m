//
//  LatestFlickrPhotosTVCViewController.m
//  ShutterBug
//
//  Created by Benjamin Shyong on 10/23/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "LatestFlickrPhotosTVCViewController.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotosTVCViewController ()

@end

@implementation LatestFlickrPhotosTVCViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.photos = [FlickrFetcher latestGeoreferencedPhotos];
}

@end
