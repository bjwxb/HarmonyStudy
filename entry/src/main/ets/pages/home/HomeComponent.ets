/**
 * Created on 2023/8/24
 * Auth: wuxiaobo
 */
import router from '@ohos.router';
import { AppPage } from '../../common/constants/AppPage';
import { FULL_WIDTH } from '../../common/constants/CommonConstant';
import toast from '../../common/utils/Toast';
import { GridItemId, HomeGridItemBean, HomeGridList } from './bean/HomeGridItemBean';
import CustomMelonDialog from './dialog/CustomMelonDialog';

@Preview
@Component
export struct HomeComponent{

  // 创建一个controller
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomMelonDialog(), // 弹框的构造器
    cancel: () => {
      toast.show("cancel")         // 点击蒙层的回调
    },
    autoCancel: true,               // 允许点击蒙层关闭弹窗
    customStyle: true               // 使用自定义样式
  });

  build(){
    Column() {
      this.GridContent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.main_bg_color'))
  }

  @Builder GridContent(){
    Grid(){
      ForEach(HomeGridList, (item:HomeGridItemBean, index) => {
        GridItem(){
          this.buildGridItem(item)
        }
        .backgroundColor(Color.White)
        .onClick(()=>{
          this.onItemClick(item)
        })
      })
    }
    .width(FULL_WIDTH)
    .rowsGap(1)
    .columnsGap(1)
    .columnsTemplate('1fr 1fr 1fr')
  }

  @Builder buildGridItem(item:HomeGridItemBean){
    Column(){
      Image(item.icon).size({width: 30, height: 30})
      Text(item.text)
        .fontSize($r('app.float.fp_16'))
        .margin({top: $r('app.float.vp_8')})
    }
    .padding({top: $r('app.float.vp_20'), bottom: $r('app.float.vp_20')})
  }

  private onItemClick(item:HomeGridItemBean){
    switch (item.id){
      case GridItemId.TEXT:
        router.pushUrl({url: AppPage.pageTextDemo})
        break
      case GridItemId.BUTTON:
        router.pushUrl({url: AppPage.pageButtonDemo})
        break
      case GridItemId.IMAGE:
        router.pushUrl({url: AppPage.pageImageDemo})
        break
      case GridItemId.TEXT_INPUT:
        router.pushUrl({url: AppPage.pageTextInputDemo})
        break
      case GridItemId.PROGRESS:
        router.pushUrl({url: AppPage.pageProgressDemo})
        break
      case GridItemId.PICKER:
        router.pushUrl({url: AppPage.pagePickerDemo})
        break
      case GridItemId.QRCODE:
        router.pushUrl({url: AppPage.pageQrCodeDemo})
        break
      case GridItemId.TOGGLE:
        router.pushUrl({url: AppPage.pageToggleDemo})
        break
      case GridItemId.SLIDE:
        router.pushUrl({url: AppPage.pageSlideDemo})
        break
      case GridItemId.RATING:
        router.pushUrl({url: AppPage.pageRatingDemo})
        break
      default:
        toast.show(`${item.text}`)
    }
  }

  @Builder test(){
    Button("test dialog")
      .fontColor(Color.Red)
      .fontSize(18)
      .backgroundColor(Color.Blue)
      .width(FULL_WIDTH)
      .height(50)
      .margin({top: 50})
      .onClick(()=>{
        this.controller.open()
      })
  }

  aboutToDisappear(){
    delete this.controller
    this.controller = undefined
  }
}