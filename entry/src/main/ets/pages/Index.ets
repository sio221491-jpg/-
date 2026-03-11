import { TabType } from '../models/Index';
@Entry
@Component
struct Index {
  @State isActive: string = 'recommend';

  tabData: TabType[] = [
    { icon: $r('app.media.ic_recommend'), text: '推荐', name: 'recommend' },
    { icon: $r('app.media.ic_find'), text: '发现', name: 'find' },
    { icon: $r('app.media.ic_moment'), text: '动态', name: 'moment' },
    { icon: $r('app.media.ic_mine'), text: '我的', name: 'mine' }
  ];

  @Builder
  tabBarBuilder(item: TabType) {
    Column({ space: 5 }) {
      Image(item.icon)
        .height(24)
        .fillColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
      Text(item.text)
        .fontSize(14)
        .fontColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabData, (item: TabType) => {
        TabContent() {
          Text(item.text + '内容')
        }
        .backgroundColor('#131215')
        .tabBar(this.tabBarBuilder(item))
      })
    }
    .backgroundColor('#3b3f42')
    .onChange((index: number) => {
      this.isActive = this.tabData[index].name;
    })
  }
}