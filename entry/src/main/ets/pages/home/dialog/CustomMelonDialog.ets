/**
 * Created on 2023/8/25
 * Auth: wuxiaobo
 */
@CustomDialog struct CustomMelonDialog{

  private controller: CustomDialogController

  build() {
    Column() {
      Text('melon app')
        .fontSize(20)
        .margin({top: 15})
      Text('Hello Melon App!')
        .fontSize(16)
        .margin({top: 3})
      Text()
        .size({width: "100%", height: 1})
        .backgroundColor($r('app.color.divider_color'))
        .margin({top: 15})
      Row() {
        Text("close")
          .height("100%")
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .fontColor(Color.Blue)
          .onClick(() => {
            this.controller.close(); // 关闭弹窗
          })
        Text()
          .size({width: 1, height: "100%"})
          .backgroundColor($r('app.color.divider_color'))
        Text("ok")
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .fontColor("#317ef5")
          .height("100%")
          .layoutWeight(1)
          .onClick(() => {
            this.controller.close(); // 关闭弹窗
          })
      }
      .height(45)
      .width('100%')
    }
    .backgroundColor("#e6ffffff")
    .width("80%")
    .borderRadius(20)
  }
}

export default CustomMelonDialog