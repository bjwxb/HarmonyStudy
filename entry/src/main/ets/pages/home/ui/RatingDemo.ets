import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct RatingDemo {
  @State message: string = 'Hello World'

  build() {
    Column() {
      TitleBar({title: " Rating Demo"})

      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
  }
}