//
//  ViewController.m
//  collTest
//
//  Created by xhr on 16/5/20.
//  Copyright (c) 2016年 徐浩然. All rights reserved.
//

#import "ViewController.h"
#import "NB_KS_LookTimu.h"
#import "MyTableViewController.h"
#import "MyViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *showView;

@end

@implementation ViewController
- (IBAction)testAction:(id)sender {
    MyTableViewController *v1= [[MyTableViewController alloc] init];
//    //    NB_KS_LookTimu *v1= [[NB_KS_LookTimu alloc] init];
    [self presentViewController:v1 animated:YES completion:nil];


}

- (void)viewDidLoad {
    [super viewDidLoad];

    NB_KS_LookTimu *v1= [[NB_KS_LookTimu alloc] init];
    v1.view.frame = self.showView.bounds;
    [self.showView addSubview:v1.view];
    [self addChildViewController:v1];
//    [self.showView.layer setMasksToBounds:YES];
//    [self.showView.layer setCornerRadius:50];//设置矩形四个圆角半径
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
