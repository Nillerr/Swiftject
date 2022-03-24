import Combine

/// Resolves instances of types
public protocol Resolver {
    /// Resolves an instance of the specified type ``T``, or ``nil`` if an
    /// instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    /// - Parameter context: The resolver to resolve dependencies from.
    ///
    /// - Returns: The resolved instance of type ``T``, or ``nil``.
    func tryResolveInstance<T>(_ type: T.Type, from context: Resolver) -> T?
}

extension Resolver {
    /// Resolves an instance of the specified type ``T``, or ``nil`` if an
    /// instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    /// - Parameter context: The resolver to resolve dependencies from.
    ///
    /// - Returns: The resolved instance of type ``T``, or ``nil``.
    public func tryResolve<T>(_ type: T.Type = T.self, from context: Resolver) -> T? {
        tryResolveInstance(type, from: context)
    }
    
    /// Resolves an instance of the specified type ``T``, or ``nil`` if an
    /// instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    ///
    /// - Returns: The resolved instance of type ``T``, or ``nil``.
    public func tryResolve<T>(_ type: T.Type = T.self) -> T? {
        tryResolveInstance(type, from: self)
    }
    
    /// Resolves an instance of the specified type ``T``, or throws a fatal
    /// error if an instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    /// - Parameter context: The resolver to resolve dependencies from.
    ///
    /// - Returns: The resolved instance of type ``T``.
    public func resolve<T>(_ type: T.Type = T.self, from context: Resolver, file: StaticString = #file, line: UInt = #line) -> T {
        guard let instance = tryResolveInstance(type, from: context) else {
            fatalError("Could not resolve an instance of type \(type) at \(file):\(line)")
        }

        return instance
    }
    
    /// Resolves an instance of the specified type ``T``, or throws a fatal
    /// error if an instance for the given type could not be resolved.
    ///
    /// - Parameter type: The type to resolve an instance for.
    ///
    /// - Returns: The resolved instance of type ``T``.
    public func resolve<T>(_ type: T.Type = T.self, file: StaticString = #file, line: UInt = #line) -> T {
        guard let instance = tryResolveInstance(type, from: self) else {
            fatalError("Could not resolve an instance of type \(type) at \(file):\(line)")
        }

        return instance
    }
}
