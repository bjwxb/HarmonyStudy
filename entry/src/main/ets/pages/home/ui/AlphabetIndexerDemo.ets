import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct AlphabetIndexerDemo {
  private arrayA: string[] = ['安']
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z']

  build() {
    Column() {
      TitleBar({ title: "字母索引表" })

      Stack({ alignContent: Alignment.End }) {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arrayA, (item) => {
            ListItem() {
              Text(item)
                .height(50)
                .fontSize(20)
                .padding({ left: 25 })
                .textAlign(TextAlign.Center)
            }
          }, item => item)

          ForEach(this.arrayB, (item) => {
            ListItem() {
              Text(item)
                .height(50)
                .fontSize(20)
                .padding({ left: 25 })
                .textAlign(TextAlign.Center)
            }
          }, item => item)

          ForEach(this.arrayC, (item) => {
            ListItem() {
              Text(item)
                .height(50)
                .fontSize(20)
                .padding({ left: 25 })
                .textAlign(TextAlign.Center)
            }
          }, item => item)

          ForEach(this.arrayL, (item) => {
            ListItem() {
              Text(item)
                .height(50)
                .fontSize(20)
                .padding({ left: 25 })
                .textAlign(TextAlign.Center)
            }
          }, item => item)
        }
        .width(FULL_WIDTH)
        .height('100%')
        .divider({ strokeWidth: 1, color: $r('app.color.divider_color') })

        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .font({
            size: 14,
            style: FontStyle.Normal,
            weight: FontWeight.Medium
          })
          .selectedColor(Color.Red) // 选中项文本颜色
          .popupColor(Color.Black) // 弹出框文本颜色
          .selectedBackgroundColor(0xCCCCCC) // 选中项背景颜色
          .popupBackground(0xD2B48C) // 弹出框背景颜色
          .usingPopup(true) // 是否显示弹出框
          .selectedFont({ size: 16, weight: FontWeight.Bolder }) // 选中项字体样式
          .popupFont({ size: 30, weight: FontWeight.Bolder }) // 弹出框内容的字体样式
          .itemSize(28) // 每一项的尺寸大小
          .alignStyle(IndexerAlign.Right) // 弹出框在索引条右侧弹出
            // .position({x: "50%", y: "50%"})
          .onSelect((index: number) => {
            logService.d(this.value[index] + ' Selected!')
          })
          .onRequestPopupData((index: number) => {
            if (this.value[index] == 'A') {
              return this.arrayA // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrayA，选中B、C、L时也同样
            } else if (this.value[index] == 'B') {
              return this.arrayB
            } else if (this.value[index] == 'C') {
              return this.arrayC
            } else if (this.value[index] == 'L') {
              return this.arrayL
            } else {
              return [] // 选中其余子母项时，提示文本列表为空
            }
          })
          .onPopupSelect((index: number) => {
            logService.d('onPopupSelected:' + index)
          })
          .backgroundColor("#cccdcc")
          .width(40)
          .height("85%")
      }
      .width(FULL_WIDTH)
      .layoutWeight(1)
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
    .backgroundColor($r('app.color.main_bg_color'))
  }
}