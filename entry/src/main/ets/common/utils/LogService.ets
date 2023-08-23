import hilog from '@ohos.hilog'

/**
 * hilog封装
 */
class LogService{

  d(message:string, tag:string = "melon") {
    hilog.debug(0x01, tag, message)
  }


  e(message:string, tag:string = "melon") {
    hilog.error(0x02, tag, message)
  }

}

let logService = new LogService();

export default logService
