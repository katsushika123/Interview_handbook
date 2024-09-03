// 对整个项目的日志输出封装
import { hilog } from '@kit.PerformanceAnalysisKit'

const DOMAIN: number = 0x0000 //当前日志所在的域，十六进制数字
const TAG: string = 'myLog' //标签，可自定义
const FORMAT: string = '%{public}s,%{public}s' //输出信息，s表示打印出来的格式是字符串,第一个%{public}用于接收打印信息来源，第二个%{public}用于接收信息

//定义一个logger类，定义四个静态方法（debug，info，warn，error）
export class Logger {
  static debug(...args: string[]) {
    hilog.debug(DOMAIN, TAG, FORMAT, ...args)
  }

  static info(...args: string[]) {
    hilog.info(DOMAIN, TAG, FORMAT, ...args)
  }

  static warn(...args: string[]) {
    hilog.warn(DOMAIN, TAG, FORMAT, ...args)
  }

  static error(...args: string[]) {
    hilog.error(DOMAIN, TAG, FORMAT, ...args)
  }
}