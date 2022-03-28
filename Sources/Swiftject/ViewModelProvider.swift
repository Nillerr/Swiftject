import Combine
import SwiftUI

/**
 Enables creation of view models in views by lazily creating an instance of a
 view model as needed.
 */
class ViewModelProvider<ViewModel: ObservableObject>: ObservableObject {
    private var viewModel: ViewModel?
    private var subscription: AnyCancellable?

    func get(orCreate initializer: () -> ViewModel) -> ViewModel {
        if let viewModel = viewModel {
            return viewModel
        }

        let viewModel = initializer()

        subscription = viewModel.objectWillChange
            .sink(receiveValue: { [weak self] _ in self?.objectWillChange.send() })

        self.viewModel = viewModel

        return viewModel
    }
}

extension ViewModelProvider {
    /**
     Enables injection of a view model resolved form a ``Resolver`` in a view.
     */
    func get(from resolver: Resolver) -> ViewModel {
        get { resolver.resolve() }
    }

    func get<Factory>(from resolver: Resolver, using factoryType: Factory.Type, factory: (Factory) -> ViewModel) -> ViewModel {
        get { factory(resolver.resolve(Factory.self)) }
    }
}
