/**
 * Created on 2023/8/24
 * Auth: wuxiaobo
 */
import { TitleBar } from '../../common/widgets/TitleBar'

@Preview
@Component
export struct MallComponent{
  private items: number[] = [];
  
  aboutToAppear(){
    for(let i = 0; i < 22; i++){
      this.items.push(i)
    }
  }
  
  build(){
    Column() {
      TitleBar({title: "商城"})
      this.buildActionWidget()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Blue)
  }


  
  @Builder buildActionWidget(){
    Grid(){
      ForEach(this.items, (item, index) => {
        GridItem(){
          Text(`item ${index}`)
        }
        .backgroundColor(Color.Blue)
      })
    }
    .padding({top: 10})
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr 1fr')
    // .rowsTemplate("1fr 1fr 1fr 1fr 1fr")
    .width('100%')
    .height("50%")
    .backgroundColor(Color.Pink)
  }
}