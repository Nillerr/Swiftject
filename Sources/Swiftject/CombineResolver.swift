import Combine

/// A wrapper around a ``Resolver`` that implements ``ObservableObject`` from
/// ``Combine``, in order to be used as an ``@EnvironmentObject``.
public class CombineResolver: Resolver, ObservableObject {
    private let _objectWillChange = PassthroughSubject<Void, Never>()
    
    public let objectWillChange: AnyPublisher<Void, Never>
    
    public let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
        self.objectWillChange = _objectWillChange.eraseToAnyPublisher()
    }

    public func tryResolve<T>(_ type: T.Type, from context: Resolver) -> T? {
        resolver.tryResolve(type, from: context)
    }
}
