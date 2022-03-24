extension Container {
    public func register<S>(_ type: S.Type, initializer: @escaping () -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) { (resolver: Resolver) -> S in initializer() }
    }
    
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
    
    public func register<T1, T2, T3, T4, S>(_ type: S.Type, initializer: @escaping (T1, T2, T3, T4) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) {
            initializer(
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line)
            )
        }
    }
    
    public func register<T1, T2, T3, T4, T5, S>(_ type: S.Type, initializer: @escaping (T1, T2, T3, T4, T5) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) {
            initializer(
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line)
            )
        }
    }
    
    public func register<T1, T2, T3, T4, T5, T6, S>(_ type: S.Type, initializer: @escaping (T1, T2, T3, T4, T5, T6) -> S, file: StaticString = #file, line: UInt = #line) {
        register(type) {
            initializer(
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line),
                $0.resolve(file: file, line: line)
            )
        }
    }
    
}
