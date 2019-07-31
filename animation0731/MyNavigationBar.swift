
import UIKit

class MyNavigationBar: UINavigationBar {

    //높이로 사용할 변수를 생성
    var customHeight : CGFloat = 300
    
    //너비와 높이를 설정하는 메소드
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
    
    //하위 뷰를 출력할 때 호출되는 메소드
    //기본 모양의 크기를 변경할 때 오버라이딩 해야하는 메소드
    override func layoutSubviews() {
        super.layoutSubviews()
        //상태 표시줄의 세로 위치를 찾아오기
        let y = UIApplication.shared.statusBarFrame.height
        var frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: customHeight)
        //하위 뷰들을 순회하면 크기를 설정
        for subview in self.subviews{
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground"){
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
            //하위 뷰의 내용을 출력할 때 마다 다시 설정
            if stringFromClass.contains("BarContent"){
                subview.frame = CGRect(x: 0, y: 20, width: self.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
            
            
        }
    }
    
    
}
