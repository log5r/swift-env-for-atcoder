import Foundation

{% if mod %}
let MOD = {{ mod }}
{% endif %}
{% if yes_str %}
let YES = "{{ yes_str }}"
{% endif %}
{% if no_str %}
let NO = "{{ no_str }}"
{% endif %}
{% if prediction_success %}

func solve({{ formal_arguments }}) {
    {% if yes_str %}
    var ans = false

    print(ans ? YES : NO)
    {% else %}
    var ans = 0

    print(ans)
    {% endif %}
}
{% endif %}

func main() {
    {% if prediction_success %}
    var tokenIndex = 0, tokenBuffer = [String]()
    func readString() -> String {
        if tokenIndex >= tokenBuffer.count {
            tokenIndex = 0
            tokenBuffer = readLine()!.split(separator: " ").map { String($0) }
        }
        defer { tokenIndex += 1 }
        return tokenBuffer[tokenIndex]
    }
    func readInt() -> Int { Int(readString())! }
    func readDouble() -> Double { Double(readString())! }
    {{input_part}}
    solve({{ actual_arguments }})
    {% else %}
    // Failed to predict input format
    {% endif %}
}

main()

extension Array {
    func cumulate(from start: Element, _ method: (Element, Element) -> Element) -> [Element] {
        guard count > 0 else { return []}
        var res = [Element](repeating: start, count: count + 1)
        for i in 0..<count {
            res[i + 1] = method(res[i], self[i])
        }
        return res
    }
}

extension Array where Element: Comparable {

    func lowerBound(of item: Element) -> Index {
        var (left, right) = (0, count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] >= item { right = mid }
            else { left = mid + 1 }
        }
        return left
    }

    func upperBound(of item: Element) -> Index {
        var (left, right) = (0, count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] <= item { left = mid + 1}
            else { right = mid }
        }
        return left
    }

    func chunked(by chunkSize: Int, allowDeficit: Bool = true) -> [[Element]] {
        let res = stride(from: 0, to: count, by: chunkSize).map { i in
            Array(self[i..<Swift.min(i + chunkSize, count)])
        }
        guard let head = res.first, let tail = res.last else { return [] }
        if !allowDeficit {
            if head.count != tail.count { return res.dropLast() }
            if res.count == 1           { return [] }
        }
        return res
    }
}

extension Array where Element: Hashable {
    func groupByCount() -> [Element: Int] {
        var res: [Element: Int] = [:]
        for item in self { res[item, default: 0] += 1 }
        return res
    }
    func reversedIndexMap() -> [Element: Int] {
        enumerated().reduce(into: [Element: Int]()) { (pr: inout [Element: Int], tuple: (offset: Int, element: Element)) in
            pr[tuple.element] = tuple.offset
        }
    }
}

extension BinaryInteger {

    func binaryDescription(bitWidth: Int? = nil) -> String {
        let bw = bitWidth ?? self.bitWidth
        var res = "", me = self, count = 0
        for _ in 1...bw {
            res.insert(contentsOf: "\(me & 1)", at: res.startIndex)
            me >>= 1
            count += 1
        }
        return res
    }

}

extension Comparable {

    @discardableResult
    mutating func superiorMerge(using value: Self) -> Bool {
        if self < value {
            self = value
            return true
        }
        return false
    }

    @discardableResult
    mutating func inferiorMerge(using value: Self) -> Bool {
        if self > value {
            self = value
            return true
        }
        return false
    }

}

extension Int {
    func sqrt() -> Int {
        Int(Double(self).squareRoot())
    }

    func pow(_ ex: Int, mod: Int? = nil) -> Int {
        var res = 1, n = ex, a = self
        while n > 0 {
            if (n & 1) != 0 {
                res *= a
                if let m = mod { res %= m }
            }
            a *= a
            if let m = mod { a %= m }
            n >>= 1
        }
        return res
    }

    func divisors() -> [Int] {
        precondition(self >= 1)
        var result = [Int]()
        var i = 1
        while i * i <= self {
            if self % i == 0 {
                result.append(i)
                if i * i != self { result.append(self / i) }
            }
            i += 1
        }
        return result.sorted()
    }
}

extension Character {
    func asciiIntValue() -> Int? {
        guard let ascv = asciiValue else { return nil }
        return Int(ascv)
    }
    func isUppercaseAlphabet() -> Bool {
        guard let aiv = asciiIntValue() else { return false }
        return (65...90) ~= aiv
    }
    func isLowercaseAlphabet() -> Bool {
        guard let aiv = asciiIntValue() else { return false }
        return (97...122) ~= aiv
    }
    func isAlphabet() -> Bool { isUppercaseAlphabet() || isLowercaseAlphabet() }
}

extension String {
    func values() -> [Character] { Array(self) }
    func makeIterator() -> StringIterator {
        StringIterator(string: self)
    }
    func asciiIntValues() -> [Int]? {
        var res = [Int]()
        for v in values() {
            guard let vav = v.asciiIntValue() else { return nil }
            res.append(vav)
        }
        return res
    }
    subscript(_ index: Int) -> Character {
        get {
            values()[index]
        }
        set {
            var buf = values()
            buf[index] = newValue
            self = String(buf)
        }
    }
    func bitArray() -> [Bool]? {
        var res = [Bool]()
        for c in values() {
            switch c {
            case "1": res.append(true)
            case "0": res.append(false)
            default: return nil
            }
        }
        return res
    }
}

struct StringIterator: IteratorProtocol {
    let string: String
    var index: Int = 0
    public mutating func next() -> Character? {
        let buf = string.values()
        guard index < buf.count else { return nil }
        defer { index += 1 }
        return buf[index]
    }
}

