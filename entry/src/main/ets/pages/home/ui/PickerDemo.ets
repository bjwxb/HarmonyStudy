import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct PickerDemo {
  @State message: string = 'Hello picker World'

  build() {
    Column() {
      TitleBar({title: "Picker Demo"})

      Scroll(){
        Column(){
          TimePicker()
            .width("60%")
            .margin({bottom: 30})

          Circle().width(20).height(20).fill(Color.Brown)

          TimePicker()
            .width("60%")
            .useMilitaryTime(true) //true -置12小时制，也就是不显示上下午文本
            .backgroundColor(Color.Pink)
            .onChange((date)=>{
              logService.e(`>>> hour = ${date.hour}, min = ${date.minute}`)
            })

          DatePicker()
            .width('80%')
            .onChange((d)=>{
              logService.e(`date >>> year = ${d.year}, month = ${d.month}, day = ${d.day}`)
            })

          DatePicker()
            .width('80%')
            .lunar(true)
            .backgroundColor(Color.Brown)
            .margin({top: 30, bottom: 30})
            .onChange((d)=>{
              logService.e(`date >>> year = ${d.year}, month = ${d.month}, day = ${d.day}`)
            })

          DatePicker({
            start: new Date('2021-1-1'),
            end: new Date('2023-12-31')
          })
            .width('80%')
            .backgroundColor(Color.Brown)
            .onChange((d)=>{
              logService.e(`date >>> year = ${d.year}, month = ${d.month}, day = ${d.day}`)
            })
        }

      }
      .width(FULL_WIDTH)
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
  }
}