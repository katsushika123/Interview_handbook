//用于开启和关闭沉浸式模式的方法
import { window } from '@kit.ArkUI'


export class windowManger {
  //开启全屏
  static async enableFullScreen() {
    //获取到当前的窗口
    const windowStage = await window.getLastWindow(getContext())
    //调用方法开启全屏
    windowStage.setWindowLayoutFullScreen(true)
    //获取安全区域的高度
    const topHeight = (windowStage.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect).height
    //将安全区域高度设置给AppStorage
    AppStorage.setOrCreate<number>('topHeight', topHeight)
  }

  //关闭全屏  项目中并未用到，保留即可
  static async disableFullScreen() {
    //获取到当前的窗口
    const windowStage = await window.getLastWindow(getContext())
    //调用方法关闭全屏
    windowStage.setWindowLayoutFullScreen(false)
    //重置安全区高度
    AppStorage.setOrCreate<number>('topHeight', 0)
  }

  //状态栏文字颜色设置为白色
  static async settingStatusBarLight() {
    //获取到当前的窗口
    const windowStage = await window.getLastWindow(getContext())
    //调用方法将安全区域的文字设置为白色
    windowStage.setWindowSystemBarProperties({ statusBarContentColor: '#FFFFFF' })
  }

  //状态栏文字颜色设置为黑色
  static async settingStatusBarDark() {
    //获取到当前的窗口
    const windowStage = await window.getLastWindow(getContext())
    //调用方法将安全区域的文字设置为黑色
    windowStage.setWindowSystemBarProperties({ statusBarContentColor: '#000000' })
  }
}