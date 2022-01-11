import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var names: [TestModel] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private lazy var nameTitle: UILabel = {
        let view = UILabel()
        view.text = "Новинки фильмов"
        view.font = .systemFont(ofSize: 17)
        view.textAlignment = .center
        view.backgroundColor = UIColor(red: 107 / 255, green: 155 / 255, blue: 209 / 255,alpha: 1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
        setupViews()
    }
    
    private func setupSubView() {
        
        view.addSubview(nameTitle)
        nameTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(nameTitle.snp.bottom)
        }
    }
    
    private func setupViews() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        names.append(TestModel(title: "Дюна", description: "Американский фантастический фильм режиссёра Дени Вильнёва по сценарию самого Вильнёва, Джона Спэйтса и Эрика Рота.", image: "Dyuna"))
        names.append(TestModel(title: "Человек-паук", description: "Жизнь и репутация Питера Паркера оказываются под угрозой, поскольку Мистерио раскрыл всему миру тайну личности Человека-паука.", image: "pauk"))
        names.append(TestModel(title: "Гарри Поттер", description: "20 лет спустя: Возвращение в Хогвартс» — документальный фильм, специальный эпизод в составе франшизы о Гарри Поттере.", image: "garri"))
        names.append(TestModel(title: "Матрица", description: "Нео снова придется выбирать, следовать ли за белым кроликом. Выбор, пусть и иллюзорный, все еще остается единственным путем в Матрицу", image: "neo"))
        names.append(TestModel(title: "Веном 2", description: "Более чем через год после тех событий журналист Эдди Брок пытается приспособиться к жизни в качестве хозяина инопланетного симбиота Венома", image: "venom"))
        names.append(TestModel(title: "Чёрная вдова", description: "Наташе Романофф предстоит встретиться со своим прошлым. Ей придется вспомнить о том, что было в её жизни задолго до присоединения к команде Мстителей", image: "black"))
        names.append(TestModel(title: "Red Notice", description: "Грозный агент Интерпола идет по следу самого разыскиваемого и неуловимого международного преступника, который специализируется на краже произведений искусства.", image: "red"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TestCell()
        let model = names[indexPath.row]
        
        cell.titleName.text = model.title
        cell.titleDescription.text = model.description
        cell.titleImage.image = UIImage(named: model.image)
        cell.backgroundColor = UIColor(red: 206 / 255, green: 222 / 255, blue: 240 / 255,alpha: 1)
        
        cell.likeButton.setOnClickListener { view in
            if view.image(for: .normal) == UIImage(named:"like0") {
                view.setImage(UIImage(named:"like1"), for: .normal)
                cell.dislikeButton.setImage(UIImage(named:"dislike0"), for: .normal)
            } else {
                view.setImage(UIImage(named:"like0"), for: .normal)
            }
        }
        cell.dislikeButton.setOnClickListener { view in
            if view.image(for: .normal) == UIImage(named:"dislike0") {
                view.setImage(UIImage(named:"dislike1"), for: .normal)
                cell.likeButton.setImage(UIImage(named:"like0"), for: .normal)
            } else {
                view.setImage(UIImage(named:"dislike0"), for: .normal)
            }
        }
        return cell
    }
}

