import MapKit

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var imageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //상위 뷰에서 제거 참조 카운트가 감소
        imageView1.removeFromSuperview()
        
        //네비게이션 바에 중앙에 제목 출력
        //self.title = "요기요"
        
        //이미지 가져오기
        let image = UIImage(named: "default.jpg")
        //이미지를 가지고 이미지 뷰를 만들면 이미지 뷰의 크기가
        //이미지의 크기로 설정
        let imgView = UIImageView(image: image)
        self.navigationItem.titleView = imgView
        
        
    }
    var flag = 1.0
    //터치 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*
        //애니메이션 시작
        UIView.beginAnimations(nil, context: nil)
        
        //인터폴레이션 효과 설정
        UIView.setAnimationCurve(.linear)
        UIView.setAnimationDuration(3.0)
        UIView.setAnimationRepeatCount(3)
        UIView.setAnimationRepeatAutoreverses(true)
        if flag == 1.0{
            flag = 0.0
        }else{
            flag = 1.0
        }
        imageView.alpha = CGFloat(flag)
        //회전효과
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(90 * Double.pi/2))
        
        //애니메이션 종료
        UIView.commitAnimations()
    }
    */
        /*
    //이미지 뷰의 위치를 변경하고 현재 뷰의 색상 변경하기
        UIView.animate(withDuration: 2.0, animations: {()->Void in
            self.imageView.center = CGPoint(x: 400, y: 400)
            })
        {
                (finished)->Void in
            UIView.animate(withDuration: 3.0, animations: {self.view.backgroundColor = UIColor.red})
 */
        /*
        UIView.transition(with: self.view, duration: 3.0, options: [.transitionFlipFromRight], animations: {
            ()->Void in
            self.imageView.removeFromSuperview()
            self.view.addSubview(self.imageView1)
        }, completion: {(finished:Bool) in print("애니메이션이 종료되었습니다.")})
        */
        
        //Custom 대화상자 출력
        let alert = UIAlertController(title: "지도", message: "맵 뷰 출력", preferredStyle: .actionSheet)
        
        //대화 상자의 내용이 될 뷰 컨트롤러 생성
        let contentViewController = UIViewController()
        let mapView = MKMapView(frame:CGRect(x:0, y:0,width:0,height:0))
        //항목 뷰 컨트롤러의 높이를 설정
        contentViewController.preferredContentSize.height = 300
        //지도 중심의 좌표
        let center = CLLocationCoordinate2D(latitude: 37.5143, longitude: 126.8946)
        //지도에 표시할 거리
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        //영역 생성
        let region = MKCoordinateRegion(center: center, span: span)
        //지도에 설정
        mapView.region = region
        mapView.regionThatFits(region)
        
        //맵뷰를 contentViewController의 view 로 설정
        contentViewController.view = mapView
        //contentviewController를 대화상자에 출력
        alert.setValue(contentViewController, forKey: "contentViewController")
        
       
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        self.present(alert,animated: true)
        
        
 }
    
}

