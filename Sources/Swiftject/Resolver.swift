import Combine

/// Resolves instances of types
public protocol Resolver {
    /// Resolves an instance of the specified type ``T``, or ``nil`` if an
    /// instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    ///
    /// - Returns: The resolved instance of type ``T``, or ``nil``.
    func tryResolve<T>(_ type: T.Type) -> T?
}

extension Resolver {
    public func tryResolve<T>(_ type: T.Type = T.self) -> T? {
        tryResolve(type)
    }

    /// Resolves an instance of the specified type ``T``, or throws a fatal
    /// error if an instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    ///
    /// - Returns: The resolved instance of type ``T``.
    public func resolve<T>(_ type: T.Type = T.self, file: StaticString = #file, line: UInt = #line) -> T {
        guard let instance = tryResolve(type) else {
            fatalError("Could not resolve an instance of type \(type) at \(file):\(line)")
        }

        return instance
    }
}
