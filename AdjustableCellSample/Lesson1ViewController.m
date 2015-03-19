//
//  MasterViewController.m
//  AdjustableCellSample
//
//  Created by hiraya.shingo on 2015/03/05.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import "Lesson1ViewController.h"
#import "Lesson1Cell.h"

@interface Lesson1ViewController ()

@property NSMutableArray *objects;

@property (nonatomic) NSArray *dataList;

@end

@implementation Lesson1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)insertNewObject:(id)sender
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    int dataIndex = arc4random() % self.dataList.count;
    NSDictionary *data = self.dataList[dataIndex];
    
    [_objects insertObject:data atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Lesson1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *data = self.objects[indexPath.row];
    cell.data = data;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        NSDictionary *data = self.objects[indexPath.row];
        return [Lesson1Cell heightForRowWithTableView:tableView data:data cellIdentifier:@"Cell"];
    } else {
        return UITableViewAutomaticDimension;
    }
}

#pragma mark -  methods

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[
                      @{
                          @"name":@"iPhone OS",
                          @"date":@"2007年6月29日",
                          @"content":@"この当時、日本ではガラケー全盛の時代でした。また初代iPhoneは、日本で発売されるわけではないのでよっぽどのガジェット好きじゃないと手に入れられない商品でした。",
                          },
                      @{
                          @"name":@"iPhone OS 2",
                          @"date":@"2008年7月11日",
                          @"content":@"AppStoreが提供されはじめました。",
                          },
                      @{
                          @"name":@"iPhone OS 3.0",
                          @"date":@"2009年6月17日",
                          @"content":@"iPhone3Gの後継である、iPhone3GSに搭載されたOSになります。日本で爆発的にiPhoneが流行したのもこの時期からになります。",
                          },
                      @{
                          @"name":@"iOS 4",
                          @"date":@"2010年6月21日",
                          @"content":@"iOS 4の一番大きな点としてはマルチタスクになったということです。",
                          },
                      @{
                          @"name":@"iOS 5",
                          @"date":@"2011年10月12日",
                          @"content":@"iOS 5からついにiTunesを利用せずに本体のみでアップデートできることが可能になりました。また音声認識アシスタントのSirが搭載され、Siriにくだらない質問をするユーザーがいた事も記憶にあたらしいです。\n\n主な特徴\n- Siri\n- 通知センター\n- iCloudと連携\n- iTunesを経由せず直接アップデート可能\n- Twitter連携\n- 緊急地震速報への対応",
                          },
                      @{
                          @"name":@"iOS 6",
                          @"date":@"2012年9月19日",
                          @"content":@"iOS 6といえば、これまで地図情報にGoogle Mapsを使っていたのを自社開発に変更したことが大きいと思います。それにより「パチンコガンダム駅」のような事態になってしまい、5からのアップデートに躊躇するユーザーも沢山いました。",
                          },
                      @{
                          @"name":@"iOS 7",
                          @"date":@"2013年9月18日",
                          @"content":@"iOS 7の特徴といえば、なんといっても今までのスキュモーフィズムからフラットデザインへの変更でしょう。また、今まで設定画面からしかできなかったWi-Fiの切り替えがコントロールセンターから行えるようになり、より便利になりました。",
                          },
                      @{
                          @"name":@"iOS 8",
                          @"date":@"2014年9月17日",
                          @"content":@"連携機能や共有機能をより強化し、全世界AppleユーザーにしようとしているAppleの意気込みが伺えます。\n\n主な特徴\n- ファミリー共有機能\n- iCloud Driveとの連携\n- Macとの連携\n- HealthKit、HomeKit",
                          },
                      ];
    }
    return _dataList;
}

@end
