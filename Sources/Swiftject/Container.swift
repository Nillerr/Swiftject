/// Registers instances and initializers for constructing instances.
///
/// A ``Container`` can be transformed to a ``Resolver`` using the ``resolver``
/// property.
public class Container {
    private var resolvers: [ObjectIdentifier: (Resolver) -> Any] = [:]

    /// Creates a ``Resolver`` holding the resolvers of this ``Container``.
    public var resolver: Resolver {
        DefaultResolver(resolvers: resolvers)
    }
    
    public init() {}

    public func register<S>(_ type: S.Type, instance: S) {
        resolvers[ObjectIdentifier(type)] = { _ in instance }
    }

    public func register<S>(_ type: S.Type, initializer: @escaping (Resolver) -> S) {
        resolvers[ObjectIdentifier(type)] = initializer
    }
}
