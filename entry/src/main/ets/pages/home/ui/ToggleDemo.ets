import { ToolType } from '@ohos.multimodalInput.touchEvent'
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct ToggleDemo {
  @State message: string = 'Hello toggle World'
  @State isOn:boolean = true

  build() {
      Column() {
        TitleBar({title: "Toggle Demo"})

        Row(){
          Text('Switch默认样式: ')
          Toggle({type: ToggleType.Switch, isOn: false})
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})

        Row(){
          Text('改变背景颜色: ')
          Toggle({type: ToggleType.Switch, isOn: this.isOn})
            .width(60)
            .height(30)
            .selectedColor(Color.Red)
            .switchPointColor(Color.White)
            .onChange((isOn)=>{
              toast.show(`isOn = ${isOn}`)
            })
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})

        Row(){
          Text('CheckBox默认样式: ')
          Toggle({type: ToggleType.Checkbox, isOn: this.isOn})
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})

        Row(){
          Text('默认样式: ')
          Toggle({type: ToggleType.Checkbox, isOn: this.isOn})
            .selectedColor(Color.Red)
            .switchPointColor(Color.White)
            .onChange((isOn)=>{
              toast.show(`checkBox isOn = ${isOn}`)
            })
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})

        Row(){
          Text('Button默认样式: ')
          Toggle({type: ToggleType.Button, isOn: this.isOn}){
            Text('Button默认样式')
          }
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})

        Row(){
          Text('默认样式: ')
          Toggle({type: ToggleType.Button, isOn: this.isOn}){
            Text('Button样式').fontColor(Color.White)
          }
          .selectedColor(Color.Red)
          .switchPointColor(Color.White)
          .onChange((isOn)=>{
            toast.show(`checkBox isOn = ${isOn}`)
          })
        }
        .width(FULL_WIDTH)
        .padding({left: 20, right: 20})
      }
      .width('100%')
      .height('100%')
  }
}