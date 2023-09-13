import { FULL_WIDTH } from '../../../common/constants/CommonConstant';
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct ListDemo {
  private items: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  build() {
    Column() {
      TitleBar({title: "List Demo"})
      List(){
        ListItemGroup(){
          ListItem(){
            Text("Header")
              .width(FULL_WIDTH)
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .sticky(Sticky.Normal)
          .backgroundColor(Color.Pink)

          ForEach(this.items, (item)=>{
            ListItem(){
              Text(`index ${item}`)
            }
            .width(FULL_WIDTH)
            .height(80)
            .backgroundColor($r('app.color.main_bg_color'))
          })
        }

        ListItem() {
          Text("Footer")
        }
        .width(FULL_WIDTH)
        .height(80)
        .backgroundColor(Color.Pink)
      }
      .sticky(StickyStyle.Header)
      .layoutWeight(1)
      .divider({strokeWidth: 0.5, color: Color.Red, startMargin: 10, endMargin: 10})
    }
    .width('100%')
    .height('100%')
  }
}