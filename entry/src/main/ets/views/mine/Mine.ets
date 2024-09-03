import { windowManger } from '../../common/utils/windowManger'

@Component
export struct Mine {
  //接收安全区高度
  @StorageProp('topHeight') topHeight: number = 0

  aboutToAppear(): void {
    windowManger.settingStatusBarLight() //开启页面时将状态烂部分颜色设置为白色
  }

  aboutToDisappear(): void {
    windowManger.settingStatusBarDark() //离开页面时将状态栏部分文字设置为黑色
  }

  build() {
    Column() {
      Text('我的')
        .fontColor(Color.Red)
        .fontSize(this.topHeight)
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [[Color.Orange, 0], [Color.White, 0.5]]
    })
    .padding({ top: this.topHeight })
  }
}