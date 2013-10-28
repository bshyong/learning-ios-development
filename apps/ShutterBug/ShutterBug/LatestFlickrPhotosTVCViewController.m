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

//- (IBAction)refreshPhotos:(id)sender {
//  [self.refreshControl beginRefreshing];
//  dispatch_queue_t loaderQ = dispatch_queue_create("flickr latest loader", NULL);
//  dispatch_async(loaderQ, ^{
//    NSArray *latestPhotos = [FlickrFetcher latestGeoreferencedPhotos];
//    dispatch_async(dispatch_get_main_queue(), ^{
//      self.photos = latestPhotos;
//      [self.refreshControl endRefreshing];
//    });
//  });
//}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.photos = [FlickrFetcher latestGeoreferencedPhotos];
  [self.refreshControl addTarget:self action:@selector(loadLatestPhotosFromFlickr) forControlEvents:UIControlEventValueChanged];
}

-(void)loadLatestPhotosFromFlickr
{
  [self.refreshControl beginRefreshing];
  dispatch_queue_t loaderQ = dispatch_queue_create("flickr latest loader", NULL);
  dispatch_async(loaderQ, ^{
    NSArray *latestPhotos = [FlickrFetcher latestGeoreferencedPhotos];
    dispatch_async(dispatch_get_main_queue(), ^{
      self.photos = latestPhotos;
      [self.refreshControl endRefreshing];
    });
  });
}

@end
