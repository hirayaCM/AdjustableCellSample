//
//  MasterViewController.m
//  AdjustableCellSample
//
//  Created by hiraya.shingo on 2015/03/05.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@property (nonatomic) NSArray *dataList;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

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
    
    // 追加
    // データ作成
    int dataIndex = arc4random() % self.dataList.count;
    NSDictionary *data = self.dataList[dataIndex];
    
    // データ挿入
    [_objects insertObject:data atIndex:0];   // 修正
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
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *data = self.objects[indexPath.row];
    cell.nameLabel.text = data[@"name"];
    cell.dateLabel.text = data[@"date"];
    cell.contentLabel.text = data[@"content"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark -  methods

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[
                      @{
                          @"name":@"iPhone OS 1.0",
                          @"date":@"2007年6月29日",
                          @"content":@"最初のリリースバージョン。",
                          },
                      @{
                          @"name":@"iPhone OS 2.0",
                          @"date":@"2008年7月11日",
                          @"content":@"アップデートはiPhoneとiPod touch（バージョン2）が無料、iPod touch（バージョン1）からは1200円の有償。",
                          },
                      @{
                          @"name":@"iPhone OS 3.0",
                          @"date":@"2009年6月17日",
                          @"content":@"アップデートはiPhoneからは無料、iPod touchからは1200円かかる。",
                          },
                      @{
                          @"name":@"iOS 4",
                          @"date":@"2010年6月21日",
                          @"content":@"iPhone 4に標準搭載され、アップデートはiPhone 3Gと3GS、ならびに第2世代以降のiPod touch用向けにリリースされた。ただしiPhone 3Gと第2世代iPod touchでは一部の機能に制限がある。アップグレードはiPhone・iPod touchともにバージョンを問わず無料",
                          },
                      @{
                          @"name":@"iOS 5",
                          @"date":@"2011年10月12日",
                          @"content":@"200以上の新機能が追加された。",
                          },
                      @{
                          @"name":@"iOS 6",
                          @"date":@"2012年9月19日",
                          @"content":@"約200以上の新機能が搭載され、今回のアップデートではアプリの追加よりも既存のアプリの改良や新機能が中心となり、GUIにも変更が見られる。",
                          },
                      @{
                          @"name":@"iOS 7",
                          @"date":@"2013年9月18日",
                          @"content":@"これまでのバージョンから大幅にデザインが変更された。",
                          },
                      @{
                          @"name":@"iOS 8",
                          @"date":@"2014年9月17日",
                          @"content":@"対応端末は iPhone 4s以降、iPad 2以降、iPad mini第1世代以降、iPod touch 第5世代。このバージョンで、iPhone 4がサポートから外れる。デザイン面では変更は無いものの、アプリや各種機能の強化、サードパーティの開発者向けに多くのAPIの開放を実施したことが大きな特徴となっている。リリース当初はバグが多く、動作も特に旧機種を中心に重くなるという事態が続発した。アップルはそれらを改善するために8.0.1、8.0.2、と立て続けにリリースし、その後、バージョン8.1がリリースされた。",
                          },
                      ];
    }
    return _dataList;
}
@end
