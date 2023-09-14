import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct SwiperDemo {
  @State message: string = 'Hello World'

  private list:Array<number> = [10, 91, 55, 33]

  build() {
    Column() {
      TitleBar({title: 'Swiper Demo'})

      Scroll(){
        Column(){
          Swiper(){
            ForEach(this.list, (item, index)=>{
              Text("item = " + item)
                .fontColor(Color.White)
                .width("100%")
                .height("100%")
                .textAlign(TextAlign.Center)
                .backgroundColor(`#ff56${item}`)
            }, item=>item)
          }
          .width(FULL_WIDTH)
          .height(220)
          .autoPlay(true)
          .loop(true) // 当item个数只有2个且开启循环时，向左滑动有问题，会先白一下
          .indicator(true)
          .indicatorStyle({
            size: 20,
            selectedColor: Color.Red,
            mask: true,
            color: Color.Orange
          })
          .duration(400)
          .margin({bottom: 40})
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}