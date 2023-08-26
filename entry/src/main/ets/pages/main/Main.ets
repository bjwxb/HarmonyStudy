import { NevList, TabId } from './bean/NevItemBean';
import { HomeComponent } from '../home/HomeComponent';
import { MallComponent } from '../mall/MallComponent';
import { MineComponent } from './widgets/MineComponent';


/**
 * Created on 2023/8/22
 * Auth: wuxiaobo
 */
@Entry
@Component
struct Main{

  private controller: TabsController = new TabsController();
  @State currentIndex:number = 0

  build(){
    Tabs({
      barPosition: BarPosition.End, // 设置Tab在下方
      controller: this.controller
    }) {
      TabContent() {
        HomeComponent()
      }
      .tabBar(this.TabItem(TabId.HOME))

      TabContent() {
        MallComponent()
      }
      .tabBar(this.TabItem(TabId.MALL))


      TabContent() {
        MineComponent()
      }
      .tabBar(this.TabItem(TabId.MINE))

    }
    .vertical(false)//true-竖向切换，false横向切换
    .barMode(BarMode.Fixed) //BarMode.Scrollable - 滑动，BarMode.Fixed 固定均分
    // .barHeight($r('app.float.bar_height'))
    // .barWidth("100%")
    .onChange((index)=>{
      this.currentIndex = index
    })
    .backgroundColor(Color.White) //bar bg color
    .backgroundImage($r('app.media.app_icon'))
    .backgroundImageSize({width: 30, height: 30})
    .backgroundImagePosition(Alignment.Top)
  }

  @Builder TabItem(index: number){
    Column(){
      Image(this.currentIndex == index? NevList[index].iconSelected: NevList[index].icon)
        .size({width: $r('app.float.tab_icon_size'), height: $r('app.float.tab_icon_size')})
        .objectFit(ImageFit.Contain)
      Text(NevList[index].text)
        .margin({top: $r('app.float.vp_4')})
        .fontSize($r('app.float.fp_12'))
        .fontColor(this.currentIndex == index? $r('app.color.tab_selected_color'): $r('app.color.tab_normal_color'))
    }
    .justifyContent(FlexAlign.Center) // 垂直居中
    .alignItems(HorizontalAlign.Center) // 水平居中
  }
}
