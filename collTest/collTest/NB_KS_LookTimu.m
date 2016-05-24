//
//  DoctorschedulingFlowViewController.m
//  doctor
//
//  Created by xhr on 15/7/20.
//  Copyright (c) 2015年 Haoranxu. All rights reserved.
//

#import "NB_KS_LookTimu.h"
#import "ScheuiCell.h"
#import "CollectionHeaderView.h"

#define App_Frame_Width  [[UIScreen mainScreen] bounds].size.width
static NSString *kheaderIdentifier = @"headerIdentifier";
static NSString *const MJCollectionViewCellIdentifier = @"color";

@interface NB_KS_LookTimu ()
//@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) NSMutableArray *morningDatas;


@end

@implementation NB_KS_LookTimu



// - (NSMutableArray *)datas
//{
//    if(_datas==nil){
//        self.datas = [NSMutableArray array];
//    }
//    return _datas;
//}

- (NSMutableArray *)morningDatas
{
    if(_morningDatas==nil){
        self.morningDatas = [NSMutableArray array];
    }
    return _morningDatas;
}

- (id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(App_Frame_Width/7, App_Frame_Width/7);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setUpRefrash];
    //    [self loadNewDeals];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ScheuiCell" bundle:nil] forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
    [self setUpRefrash];
    
    //注册headerView Nib的view需要继承UICollectionReusableView
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
}


- (void)setUpRefrash
{
    for (int i = 0; i<1000; i++) {
          [self.morningDatas addObject:@""];
    }
    
//    [MBProgressHUD showMessage:@"正在查询挂号号源..."];
//    __unsafe_unretained typeof(self) vc = self;
//    // 添加下拉刷新头部控件
//    [self.collectionView addHeaderWithCallback:^{
//        // 进入刷新状态就会回调这个Block
//        NumberSourceRequest *numRequest = [[NumberSourceRequest alloc] init];
//        numRequest.doctor_code = vc.doctorModel.doctor_code;
//        numRequest.hos_code = vc.docHospitalModel.hos_code;
//        numRequest.c_page = 1;
//        numRequest.treat_date = vc.dayString;
//        numRequest.dept_code = vc.dept_code;
//        [[HttpManager sharedManager] requestNumberSource:numRequest withCompletion:^(id result) {
//            [MBProgressHUD hideHUD];
//            NumberSourcesResult *resultList = result;
//            if ([resultList.result isEqualToString:@"1"]){
//                // 清空之前的所有数据
//                [vc.morningDatas removeAllObjects];
//                [vc.afternoonDatas removeAllObjects];
//                
//                for (int i = 0; i< resultList.data_list.count ; i++) {
//                    NumberSourcesModel *model = resultList.data_list[i];
//                    if ([model.treat_bc_name isEqualToString:@"上午班"]) {
//                        [vc.morningDatas addObject:model];
//                    }else{
//                        [vc.afternoonDatas addObject:model];
//                    }
//                }
//                
//                
//                //                [vc.datas addObjectsFromArray:resultList.data_list];
//                [vc.collectionView reloadData];
//                // 结束刷新
//                [vc.collectionView headerEndRefreshing];
//            }else{
//                [MBProgressHUD hideHUD];
//                [MBProgressHUD showError:resultList.message];
//            }
//        } AndError:^(NSString *errorMsg) {
//            [MBProgressHUD hideHUD];
//            [vc.morningDatas removeAllObjects];
//            [vc.afternoonDatas removeAllObjects];
//            [MBProgressHUD showError:errorMsg];
//            [vc.collectionView headerEndRefreshing];
//        }];
//    }];
//    [self.collectionView headerBeginRefreshing];
}



//- (void)loadNewDeals
//{
//    NumberSourceRequest *numRequest = [[NumberSourceRequest alloc] init];
//    numRequest.doctor_code = self.doctorModel.doctor_code;
//    numRequest.hos_code = self.docHospitalModel.hos_code;
//    numRequest.c_page = 1;
//    numRequest.treat_date = self.dayString;
//    [[HttpManager sharedManager] requestNumberSource:numRequest withCompletion:^(id result) {
//        NumberSourcesResult *resultList = result;
//        if ([resultList.result isEqualToString:@"1"]){
////            NumberSourcesList *numberList = resultList.data;
//            // 清空之前的所有数据
//            [self.datas removeAllObjects];
//            [self.datas addObjectsFromArray:resultList.data_list];
//            [self.collectionView reloadData];
//        }else{
//            [MBProgressHUD showError:resultList.message];
//        }
//    } AndError:^(NSString *errorMsg) {
//        [MBProgressHUD showError:errorMsg];
//    }];
//}


#pragma mark - collection数据源代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return (section == 0)?self.morningDatas.count:0;
    //    if (section == 0) {
    //        return self.morningDatas.count;
    //    }else{
    //        return self.afternoonDatas.count;
    //    }
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScheuiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCollectionViewCellIdentifier forIndexPath:indexPath];
//    NumberSourcesModel *numberSourcesModel;
//    if (indexPath.section == 0) {
//        cell.backgroundColor = [UIColor whiteColor];
//        numberSourcesModel = [self.morningDatas objectAtIndex:indexPath.row];
//    }else{
//        cell.backgroundColor = DocColor(248, 248, 248);
//        numberSourcesModel = [self.afternoonDatas objectAtIndex:indexPath.row];
//    }
//    
//    cell.model = numberSourcesModel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NumberSourcesModel *numberSourcesModel;
//    if (indexPath.section == 0) {
//        numberSourcesModel = [self.morningDatas objectAtIndex:indexPath.row];
//    }else{
//        numberSourcesModel = [self.afternoonDatas objectAtIndex:indexPath.row];
//    }
//    
//    //    if ([isTest isEqualToString:@"yes"]) {
//    ConfirmRegisterViewController *vc= [[ConfirmRegisterViewController alloc] initWithNibName:@"ConfirmRegisterViewController" bundle:nil];
//    vc.numberSourcesModel = numberSourcesModel;
//    vc.docHospitalModel = self.docHospitalModel;
//    vc.doctorModel = self.doctorModel;
//    vc.docDeparmentModel = self.docDeparmentModel;
//    vc.treat_date = self.dayString;
//    vc.treat_bc = numberSourcesModel.treat_bc;
//    vc.treat_time = numberSourcesModel.treat_time;
//    vc.treat_num = [NSString stringWithFormat:@"%zd",numberSourcesModel.num];
//    
//    vc.dayString = self.dayString;
//    //    vc.dayWeek = (self.dayWeek)?self.dayWeek:[self.dayString stringDayToWeek];
//    [self.navigationController pushViewController:vc animated:YES];
//    //    }else{
//    //            DocRegisterViewController *vc= [[DocRegisterViewController alloc] initWithNibName:@"DocRegisterViewController" bundle:nil];
//    //            vc.numberSourcesModel = numberSourcesModel;
//    //            vc.docHospitalModel = self.docHospitalModel;
//    //            vc.doctorModel = self.doctorModel;
//    //            vc.docDeparmentModel = self.docDeparmentModel;
//    //            vc.treat_date = self.dayString;
//    //            vc.treat_bc = numberSourcesModel.treat_bc;
//    //            vc.treat_time = numberSourcesModel.treat_time;
//    //            vc.treat_num = [NSString stringWithFormat:@"%zd",numberSourcesModel.num];
//    //
//    //            vc.dayString = self.dayString;
//    //            //    vc.dayWeek = (self.dayWeek)?self.dayWeek:[self.dayString stringDayToWeek];
//    //            [self.navigationController pushViewController:vc animated:YES];
//    //    }
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(320, 140);
//    if (section == 0) {
//        return (self.morningDatas.count>0)?CGSizeMake(App_Frame_Height, 35):CGSizeMake(0, 0);
//    }
//    
//    if (section == 1) {
//        return (self.afternoonDatas.count>0)?CGSizeMake(App_Frame_Height, 35):CGSizeMake(0, 0);
//    }
//    return CGSizeMake(0, 0);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier = kheaderIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
        UILabel *label = (UILabel *)[view viewWithTag:1];
        if (indexPath.section == 0) {
//            label.text = [NSString stringWithFormat:@"上午班总号源:%zd",self.morningDatas.count];
        }else{
//            label.text = [NSString stringWithFormat:@"下午班号源:%zd",self.afternoonDatas.count];
        }
//        view.backgroundColor = DocColor(242, 242, 242);
        return view;
    }return nil;
    
}

@end
