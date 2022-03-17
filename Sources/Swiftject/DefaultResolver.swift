import Combine

/// Resolves instances of types from a set of resolves created by an instance
/// of ``Container``.
public struct DefaultResolver: Resolver {
    public let objectWillChange: AnyPublisher<Void, Never>

    public let resolvers: [ObjectIdentifier: (Resolver) -> Any]

    public init(resolvers: [ObjectIdentifier: (Resolver) -> Any]) {
        self.resolvers = resolvers
        self.objectWillChange = PassthroughSubject().eraseToAnyPublisher()
    }

    public func tryResolve<T>(_ type: T.Type) -> T? {
        if let resolver = resolvers[ObjectIdentifier(type)] {
            return (resolver(self) as! T)
        } else {
            return nil
        }
    }
}
