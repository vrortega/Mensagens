<div align="center">  <h1>Mensagens 📱</div></h1>

## 📘 Introdução
O app "Mensagens" permite alterar a cor do texto, a cor de fundo da mensagem, e a cor de fundo da tela. Ele é desenvolvido em Swift utilizando Storyboard e é estruturado em torno de uma superclasse `BaseViewController` e várias subclasses que herdam suas propriedades e métodos.

## 📂 Estrutura do Projeto

- Mensagens
  - Controllers
    - BaseViewController.swift
    - MessageViewController.swift
    - MessageColorViewController.swift
    - ScreenColorViewController.swift
    - ResultViewController.swift
    - ColorPickerViewController.swift
  - Models
    - Message.swift
  - Views
    - Main.storyboard
  - Resources
    - Assets.xcassets
  - Info.plist


## 📜 Superclasse `BaseViewController`
Define as propriedades compartilhadas `message` (uma instância da struct `Message`) e `messageLb` (UILabel para exibir a mensagem).

```swift
import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var messageLb: UILabel!
    var message: Message!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeColor(_ sender: UIButton) {
        // Implementação padrão ou override nas subclasses
    }
}

```

##  🎨 MessageColorViewController
Permite ao usuário alterar a cor do texto da mensagem.

```swift
class MessageColorViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let message = message else { fatalError("message is nil") }
        messageLb.text = message.text
        messageLb.textColor = message.textColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }

    override func changeColor(_ sender: UIButton) {
        let colorPicker = storyboard?.instantiateViewController(identifier: "ColorPickerViewController") as! ColorPickerViewController
        colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.reference = self
        present(colorPicker, animated: true, completion: nil)
    }
}

extension MessageColorViewController: ColorPickerProtocol {
    func applyColor(color: UIColor) {
        messageLb.backgroundColor = color
        message.backgroundColor = color
    }
}
```

## 🖼️ ScreenColorViewController
Permite ao usuário alterar a cor da view atrás da mensagem.

```swift
class ScreenColorViewController: BaseViewController {
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var whiteBorderSw: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let message = message else { fatalError("message is nil") }
        messageLb.text = message.text
        messageLb.textColor = message.textColor
        messageLb.backgroundColor = message.backgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func changeBorder(_ sender: UISwitch) {
        viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
}

extension ScreenColorViewController: ColorPickerProtocol {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}
```

## 📝 ResultViewController
Exibe o resultado final após todas as alterações de cor.

```swift
class ResultViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let message = message else { fatalError("message is nil") }
        messageLb.text = message.text
        messageLb.textColor = message.textColor
        messageLb.backgroundColor = message.backgroundColor
        view.backgroundColor = message.screenColor
    }
}
```

## 🎨 ColorPickerViewController e Protocolo ColorPickerProtocol
Permite ao usuário selecionar uma cor e aplica essa cor nas subclasses que implementam ColorPickerProtocol.

```swift
protocol ColorPickerProtocol {
    func applyColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {
    var reference: ColorPickerProtocol?

    @IBAction func selectColor(_ sender: UIButton) {
        let color = sender.backgroundColor ?? .white
        reference?.applyColor(color: color)
        dismiss(animated: true, completion: nil)
    }
}
```

## 🚀 Como Rodar o Projeto
* **Clone o Repositório:**

```sh
git clone https://github.com/seu-usuario/mensagens.git
cd mensagens
```
* **Abra o Projeto no Xcode:**

Navegue até o arquivo `Mensagens.xcodeproj` e abra-o com o Xcode.

* **Instale as Dependências:**

Se o projeto utilizar CocoaPods, execute `pod install` para instalar as dependências necessárias.

* **Compile e Rode o Projeto:**

Pressione `Cmd + R` ou clique no botão de rodar no Xcode.
