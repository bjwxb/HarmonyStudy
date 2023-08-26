/**
 * Created on 2023/8/26
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
@Entry
@Component
struct ButtonDemo{
  build(){
    Column(){
      Text('button demo')
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}