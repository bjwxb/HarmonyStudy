import hilog from '@ohos.hilog'

/**
 * hilog封装
 */
class LogService{

  private domain: number;
  private tag: string;

  private format: string = '%{public}s, %{public}s';

  constructor(tag: string = 'melonApp', domain: number = 0x01) {
    this.tag = tag;
    this.domain = domain;
  }

  d(...args: any[]):void {
    hilog.debug(this.domain, this.tag, this.format, args)
  }

  e(...args: any[]):void {
    hilog.debug(this.domain, this.tag, this.format, args)
  }
}

let logService = new LogService();

export default logService
