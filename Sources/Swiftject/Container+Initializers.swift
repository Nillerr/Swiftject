extension Container {
    public func register<T1, S>(_ type: S.Type, initializer: @escaping (T1) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) { initializer($0.resolve(file: file, line: line)) }
    }
    
    public func register<T1, T2, S>(_ type: S.Type, initializer: @escaping (T1, T2) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) {
            initializer(
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line)
            )
        }
    }
    
    public func register<T1, T2, T3, S>(_ type: S.Type, initializer: @escaping (T1, T2, T3) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) {
            initializer(
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line)
            )
        }
    }
}
