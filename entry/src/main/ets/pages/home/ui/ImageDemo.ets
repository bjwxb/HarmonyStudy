/**
 * Created on 2023/8/26
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'

@Entry
@Component
struct ImageDemo{
  build(){
    Column(){
      Text('image demo')
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}