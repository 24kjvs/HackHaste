// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
import UIKit

final class KeyboardViewController: UIInputViewController {
    private var variantLeft = false
    private var shifted = false
    private let stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.12, alpha: 1)
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
        ])
        rebuild()
    }

    private func rebuild() {
        stack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let toolbar = UIStackView()
        toolbar.axis = .horizontal
        toolbar.spacing = 8
        let toggle = UIButton(type: .system)
        toggle.setTitle(variantLeft ? "Left" : "Main", for: .normal)
        toggle.addTarget(self, action: #selector(flipVariant), for: .touchUpInside)
        toolbar.addArrangedSubview(toggle)
        stack.addArrangedSubview(toolbar)
        for row in [HackHasteKeys.numberRow, HackHasteKeys.letterRow,
                    HackHasteKeys.homeRow, HackHasteKeys.bottomRow] {
            stack.addArrangedSubview(rowView(row))
        }
        stack.addArrangedSubview(modRow())
    }

    private func rowView(_ ids: [String]) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 3
        for id in ids {
            let b = UIButton(type: .system)
            b.setTitle(HackHasteKeys.glyph(variantLeft: variantLeft, xkb: id, shifted: shifted),
                       for: .normal)
            b.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            b.setTitleColor(.white, for: .normal)
            b.backgroundColor = UIColor(white: 0.22, alpha: 1)
            b.layer.cornerRadius = 5
            b.tag = id.hashValue
            b.accessibilityIdentifier = id
            b.addAction(UIAction { [weak self] _ in
                self?.typeXkb(id)
            }, for: .touchUpInside)
            row.addArrangedSubview(b)
        }
        return row
    }

    private func modRow() -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 4
        func add(_ title: String, _ action: Selector) {
            let b = UIButton(type: .system)
            b.setTitle(title, for: .normal)
            b.setTitleColor(.white, for: .normal)
            b.addTarget(self, action: action, for: .touchUpInside)
            row.addArrangedSubview(b)
        }
        add("Shift", #selector(flipShift))
        add("Space", #selector(space))
        add("Bksp", #selector(bksp))
        add("Return", #selector(ret))
        return row
    }

    private func typeXkb(_ id: String) {
        let t = HackHasteKeys.glyph(variantLeft: variantLeft, xkb: id, shifted: shifted)
        textDocumentProxy.insertText(t)
        if shifted {
            shifted = false
            rebuild()
        }
    }

    @objc private func flipVariant() {
        variantLeft.toggle()
        rebuild()
    }
    @objc private func flipShift() {
        shifted.toggle()
        rebuild()
    }
    @objc private func space() { textDocumentProxy.insertText(" ") }
    @objc private func bksp() { textDocumentProxy.deleteBackward() }
    @objc private func ret() { textDocumentProxy.insertText("\n") }
}
