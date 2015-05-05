//
//  RootViewController.m
//  tesssss
//
//  Created by 沈红榜 on 15/5/4.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end


@implementation RootViewController {
    UIToolbar *_toolbar;
    UITextView *_textView;
    
    UIView *_toolView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerForKeyboard];
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
     _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 40, 70)];
    _textView.center = CGPointMake(maxWidth / 2., 150);
    _textView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_textView];
    
    
    _toolView = [[UIView alloc] initWithFrame:CGRectMake(0, maxHeight - 50, maxWidth, 50)];
    _toolView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_toolView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"点击收回键盘" forState:UIControlStateNormal];
    [btn addTarget: self action:@selector(temp) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 0, 100, 50);
    btn.center = CGPointMake(maxWidth / 2., 25);
    [_toolView addSubview:btn];

    
}

- (void)registerForKeyboard {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHiddin:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)notif {
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height;
    NSDictionary *info = [notif userInfo];
    
    NSNumber *duration = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize size = [value CGRectValue].size;
    
    [UIView beginAnimations:@"te" context:nil];
    [UIView setAnimationDuration:[duration doubleValue]];
    _toolView.frame = CGRectMake(0, maxHeight - size.height - 50, maxWidth, 50);

    [UIView commitAnimations];
    

}

- (void)keyboardWasHiddin:(NSNotification *)notif {
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height;
    NSDictionary *info = [notif userInfo];
    
    NSNumber *duration = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];

    
    [UIView beginAnimations:@"re" context:nil];
    [UIView setAnimationDuration:[duration doubleValue]];
    _toolView.frame = CGRectMake(0, maxHeight - 50, maxWidth, 50);
    [UIView commitAnimations];
}

- (void)temp {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
