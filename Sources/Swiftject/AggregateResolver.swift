import Combine

/// A wrapper around multiple ``Resolver`` instances. Attempting to resolve an
/// instance from this ``Resolver`` will attempt to resolve from each of the
/// specified resolvers in sequence, until a non-``nil`` value is returned.
public struct AggregateResolver: Resolver {
    public let resolvers: [Resolver]

    public init(resolvers: [Resolver]) {
        self.resolvers = resolvers
    }

    public func tryResolve<T>(_ type: T.Type) -> T? {
        resolvers.lazy
            .compactMap { resolver in resolver.tryResolve(type) }
            .first
    }
}
