# CustomKeyboradToolView
获取弹出键盘高度, 定义浮在键盘上的工具条

```object
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHiddin:) name:UIKeyboardWillHideNotification object:nil];
```
```object
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
```
