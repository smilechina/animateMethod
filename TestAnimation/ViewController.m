//
//  ViewController.m
//  TestAnimation
//
//  Created by apple  on 13-8-6.
//  Copyright (c) 2013年 apple . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView.hidden = YES;
    
//    [self.scrollView setContentSize:CGSizeMake(500, 800)];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 300, 300)];
    imageView.image = [UIImage imageNamed:@"3.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
//    [imageView release];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [CoreAnimationEffect animationRotateAndScaleDownUp: imageView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [super dealloc];
}
@end
