
import UIKit

class detailPageViewController: UIViewController {

    @IBOutlet var uImg: UIImageView!
    
    @IBOutlet var uName: UILabel!
    @IBOutlet var uQual: UILabel!
    @IBOutlet var uGender: UILabel!
//    @IBOutlet var uAge: UILabel!
    @IBOutlet var uAgeTxt: UITextField!
    @IBOutlet var uCity: UILabel!
    @IBOutlet var uState: UILabel!
    @IBOutlet var uRole: UILabel!
    @IBOutlet var uMobile: UILabel!
    @IBOutlet var uIntrest: UILabel!
    
    @IBOutlet var agePiker: UIPickerView!
    @IBOutlet var notesTxt: UITextView!
    
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var webBtn: UIButton!


    //    var img = UIImage()
//    var username = ""
    
    var item: UserData?
    
   var textViewKey = ""
    var texFieldKey = ""
    
    var AgeArray = Array<String>()
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                navigationController?.setNavigationBarHidden(false, animated: animated)
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uAgeTxt.delegate = self
        
        agePiker.isHidden = true
        
        uImg.layer.cornerRadius = 20
        
        saveBtn.tintColor = .gray
        notesTxt.text = ""
        notesTxt.layer.cornerRadius = 20
        notesTxt.layer.shadowOffset = CGSize(width: 22.2, height: 22.2)
        notesTxt.layer.shadowColor = UIColor.lightGray.cgColor
        
       
        for i in 20...60{
            AgeArray.append(String(i))
        }
    
        
        if let item = item{
            
//            if let imageUrl = URL(string: item.url) {

//                func loadImage(from url: URL) {
//                    
//                    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                        print("loading2",item.url)
//                        if let data = data, error == nil {
//                            DispatchQueue.main.async {
//                              
//                                self.uImg.image = UIImage(data: data)
//                                
//                        }
//                    }
//                
//                    task.resume()
//                }
//                
//                loadImage(from: imageUrl)
//            }
            
            uName.text = item.name
            uQual.text = item.qualification
            uGender.text = item.gender
            uAgeTxt.text = item.age
            uCity.text = item.city
            uState.text = item.state
            uRole.text = item.role
            uMobile.text = item.mobile
            uIntrest.text = item.interested
            
            textViewKey = item.id
            texFieldKey = item.name
            
            appendToUserDefaultsArray(newValue: item.id)
        }
        loadUserText()
        loadAgeText()
   
    }
    
    @IBAction func saveBtnTap(_ sender: UIButton) {
  
        let userInput = notesTxt.text ?? ""
        UserDefaults.standard.set(userInput, forKey: textViewKey)

        saveBtn.tintColor = .blue
        print(userInput)
        
    }
    
    func loadUserText() {
        if let savedText = UserDefaults.standard.string(forKey: textViewKey) {
            notesTxt.text = savedText
        }
    }
    
    @IBAction func productBtnTap(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsNewViewController") as? ProductsNewViewController {
            
           navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func WebBtnTap(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "myWebView") as? myWebView {
            
            vc.item2 = item
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    //history data
    func appendToUserDefaultsArray(newValue: String) {
        var currentArray = UserDefaults.standard.array(forKey: "historyKey") as? [String] ?? [String]()
        currentArray.append(newValue)
        UserDefaults.standard.set(currentArray, forKey: "historyKey")
    }
    
       
}

extension detailPageViewController : UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        notesTxt.backgroundColor = .white
        saveBtn.tintColor = .systemGreen
        
    }
    
    
    
}


extension detailPageViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AgeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AgeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        uAgeTxt.text = AgeArray[row]
        let userInput = uAgeTxt.text
        UserDefaults.standard.set(userInput, forKey: texFieldKey)
    }
}

extension detailPageViewController : UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        agePiker.isHidden = false
    }   

    
    
    func loadAgeText() {
        if let savedText = UserDefaults.standard.string(forKey: texFieldKey) {
            uAgeTxt.text = savedText
            
        }
        
    }
}
