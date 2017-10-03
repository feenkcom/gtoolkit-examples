I am an abstract class for manipulating examples.

My subclasses can add different semantics for different use cases. For example, evaluating an example is to be treated differently from a debugging scenario, or from a  scenario to recorver static dependencies.

I maintain a context that can be accessed from within the examples being processed during the execution of the processor.

#value - Execute the processor. Can return a value, depending on the processor.
#canProcess - Verifies if the processor can execute on the given example.