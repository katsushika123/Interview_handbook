import { Logger } from '../common/utils/Logger';
import { windowManger } from '../common/utils/windowManger';
import { Mine } from '../views/mine/Mine';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  //存储tabBar的索引
  @State tabBarIndex: number = 0

  aboutToAppear(): void {
    windowManger.enableFullScreen() //开启沉浸模式
    Logger.info('测试', '提交')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          //手动控制页面的渲染和销毁
          if (this.tabBarIndex == 0) {
            Text('首页')
              .fontSize(50)
          }

        }
        .tabBar(this.tabBarBuilder('home', '首页', 0))

        TabContent() {
          //手动控制页面的渲染和销毁
          if (this.tabBarIndex == 1) {
            Text('项目')
              .fontSize(50)
          }

        }
        .tabBar(this.tabBarBuilder('project', '项目', 1))

        TabContent() {
          //手动控制页面的渲染和销毁
          if (this.tabBarIndex == 2) {
            Text('面经')
              .fontSize(50)
          }

        }
        .tabBar(this.tabBarBuilder('interview', '面经', 2))

        TabContent() {
          //手动控制页面的渲染和销毁
          if (this.tabBarIndex == 3) {
            Mine()
          }
        }
        .tabBar(this.tabBarBuilder('mine', '我的', 3))

      }
      .onChange((index: number) => {
        this.tabBarIndex = index
      })
      .onTabBarClick((index: number) => {
        this.tabBarIndex = index
      })
    }

    .height('100%')
    .width('100%')
  }

  //首页的builder
  @Builder
  //接收的三个参数分别为：名字，中文名字，页面自身的索引
  tabBarBuilder(name: string, cnName: string, index: number) {
    Column({ space: 5 }) {
      //比较当前选中的索引和tabba自身的索引，切换图标样式
      Image(index != this.tabBarIndex ? $r(`app.media.tabbar_${name}`) : $r(`app.media.ic_tabbar_${name}_select`))
        .width(30)
      Text(cnName)
    }
  }
}