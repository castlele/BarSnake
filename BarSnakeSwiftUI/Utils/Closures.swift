typealias Closure<Input, Output> = (Input) -> Output
typealias VoidClosure = () -> Void
typealias ParameterClosure<Input> = Closure<Input, Void>
