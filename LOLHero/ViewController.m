//
//  ViewController.m
//  LOLHero
//
//  Created by LongCh on 2017/10/10.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "ViewController.h"
#import "CLHero.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray *heros;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    long row = indexPath.row;
//    if(row % 2 == 0){
//        return 60;
//    }else{
//        return 100;
//    }
//}

//设置点击那一项弹出一个对话框
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CLHero *hero = self.heros[indexPath.row];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"修改英雄名" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alertView textFieldAtIndex:0].text = hero.name;
//    //NSLog(@"%@",hero.name);
//    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//    [alertView show];
    UIAlertController *alertContr = [UIAlertController alertControllerWithTitle:@"修改英雄名" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *oKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%ld",indexPath.row);
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertContr addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = hero.name;
    }];
    [alertContr addAction:oKAction];
    [alertContr addAction:cancleAction];
    [self presentViewController:alertContr animated:YES completion:nil];
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

//懒加载
- (NSArray *)heros{
    if(_heros == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"herolist.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayHeros = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            CLHero *hero = [CLHero HeroWithDict:dict];
            [arrayHeros addObject:hero];
        }
        _heros = arrayHeros;
    }
    return _heros;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.heros.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLHero *hero = self.heros[indexPath.row];
    
    //这样每次创建一个cell，效率低
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //优化
    NSString *ID = @"hero_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
         //NSLog(@"%ld=========%p",indexPath.row,cell);
    }
   
    
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.image];
    cell.detailTextLabel.text = hero.desc;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //为UITableView设置数据源对象
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //设置tableView的行高
    //self.tableView.rowHeight = 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
